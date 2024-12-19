
#!/bin/bash

# File di input
ip_file="ip_list.txt"          # File contenente gli IP
port_file="port_list.txt"      # File contenente le porte
sid_file="sid.txt"             # File contenente i SID
user_file="users.txt"          # File contenente i nomi utente
password_file="passwords.txt"  # File contenente le password
timeout_duration=5             # Timeout in secondi per ogni connessione

# Verifica che i file esistano
if [[ ! -f "$ip_file" || ! -f "$port_file" || ! -f "$sid_file" || ! -f "$user_file" || ! -f "$password_file" ]]; then
    echo "Errore: Uno o più file di input non esistono."
    exit 1
fi

# Legge le righe di ogni file in array
mapfile -t ip_list < "$ip_file"
mapfile -t port_list < "$port_file"
mapfile -t sid_list < "$sid_file"
mapfile -t user_list < "$user_file"
mapfile -t password_list < "$password_file"

# Loop su ogni IP
for ip in "${ip_list[@]}"; do
    echo ">> Testando IP: $ip"

    # Loop su ogni porta
    for port in "${port_list[@]}"; do
        echo ">>> Testando Porta: $port su IP: $ip"

        # Loop su ogni SID
        for sid in "${sid_list[@]}"; do
            echo ">>>> Testando SID: $sid su IP: $ip e Porta: $port"

            # Loop su ogni username
            for username in "${user_list[@]}"; do

                # Loop su ogni password
                for password in "${password_list[@]}"; do
                    echo ">>>>> Provando: IP=$ip, Porta=$port, SID=$sid, USER=$username, PASS=$password"

                    # Connessione con SQL*Plus con timeout
                    output=$(timeout "$timeout_duration" echo "exit" | sqlplus -s "$username/$password@//$ip:$port/$sid" 2>&1)

                    # Controlla il risultato
                    if echo "$output" | grep -q "Connected to"; then
                        echo ">>>>> SUCCESSO: IP=$ip, Porta=$port, SID=$sid, USER=$username, PASS=$password"
                        echo "Trovato: IP=$ip, Porta=$port, SID=$sid, USER=$username, PASS=$password" >> success.txt
                        break  # Interrompe il ciclo password, il login è riuscito
                    elif echo "$output" | grep -q "ORA-01017"; then
                        echo ">>>>> Fallito: Credenziali errate per IP=$ip, Porta=$port, SID=$sid, USER=$username, PASS=$password"
                    elif echo "$output" | grep -q "ORA-12170"; then
                        echo ">>>>> Timeout: Nessuna risposta da IP=$ip, Porta=$port, SID=$sid"
                        echo "Errore: Timeout per IP=$ip, Porta=$port, SID=$sid" >> errors.txt
                        break  # Interrompe il ciclo per evitare ulteriori tentativi su una connessione non valida
                    else
                        echo ">>>>> Errore sconosciuto per IP=$ip, Porta=$port, SID=$sid"
                        echo "Errore: $output" >> errors.txt
                    fi

                done

            done

        done

    done

done

echo "Test completati. Risultati salvati in success.txt ed errors.txt."



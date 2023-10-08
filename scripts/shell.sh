sudo apt-get install mailutils
echo "Fim da instalacao"
echo "Mandando e-mail de notificacao" | mail -s "a subject" ${EMAIL_LIST}
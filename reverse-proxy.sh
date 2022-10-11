echo "What domain do you want for your dynmap? (Ex. map.yourserver.xyz)"                                                                                                                   
read ccdomain                                                                                                                                                     
                                                                                                                                                                  
echo "What is the IP and PORT of your dynmap? (Ex. 1234:5678)"                                                                                   
read ccip                                                                                                                                                         
                                                                                                                                                                  
echo " server {                                                                                                                                                   
        server_name $ccdomain;                                                                                                                                    
        listen 80;                                                                                                                                                
        listen [::]:80;                                                                                                               
        location / {                                                                                                                                              
                    proxy_pass http://$ccip;                                                                                                                      
  }                                                                                                                                                               
} " > /etc/nginx/sites-available/$ccdomain.conf                                                                                                                   
                                                                                                                                                                  
ln -s /etc/nginx/sites-available/$ccdomain.conf /etc/nginx/sites-enabled/$ccdomain.conf                                                                           
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
echo "Your Dynmap is now setup and should be available at https://$ccdomain" 

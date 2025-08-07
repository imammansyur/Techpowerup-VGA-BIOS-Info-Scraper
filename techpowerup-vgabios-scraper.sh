#!/bin/bash
mkdir -p pages
while read id; do
  while true; do
    echo "Trying $id..."
    response=$(curl -s -w "%{http_code}" -o "pages/$id.html" "https://www.techpowerup.com/vgabios/$id/$id" [insert your cookie header here])
    if [ "$response" = "200" ]; then
      echo "Success: $id"
      break
    elif [ "$response" = "429" ]; then
      echo "Rate limited. Sleeping 60s..."
      sleep 60
    else
      echo "Failed ($response), retrying in 15s..."
      sleep 15
    fi
  done
  sleep 15
done < data-id.txt

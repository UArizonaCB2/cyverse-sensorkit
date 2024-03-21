echo "hello docker"
python3 ../createJson.py > storage.json

cat storage.json

python3 main.py schema/schema.json storage.json

echo `ls -1`

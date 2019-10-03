root="$(pwd)"
ln -s "$root/hooks/preventingmergescript.sh" "$root/.git/hooks/pre-commit"
githookpath=".git/hooks/pre-commit"
chmod +x "$githookpath"


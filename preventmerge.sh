root="$(pwd)"
ln -s "$root/hooks" "$root/.git/hooks"
githookpath=".git/hooks/pre-commit"
chmod +x "$githookpath"


ln -s -f ../../hooks/preventingmergescript.sh .git/hooks/pre-commit
githookpath=".git/hooks/pre-commit"
chmod +x "$githookpath"


#!/bin/bash
echo "Estado del repositorio"
git status -s
echo "Agregar los cambios del repositorio"

git add .
git commit -m "$1"
echo "El commit agregado fue: $1"
git push lfrecalde1 luchofercho96

echo "Actualizacion Finalizada"


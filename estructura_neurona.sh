#!/bin/bash

# Nombre del directorio principal
PARENT_DIR="odoo_projects"

# Crear el directorio padre si no existe
if [ ! -d "$PARENT_DIR" ]; then
  echo "Creando el directorio padre '$PARENT_DIR'..."
  mkdir "$PARENT_DIR"
else
  echo "El directorio padre '$PARENT_DIR' ya existe."
  exit 1
fi

# Crear la carpeta "clientes" dentro del directorio padre si no existe
mkdir "$PARENT_DIR/clientes"

# Crear la estructura de carpetas "modulos18" dentro del directorio padre
echo "Creando la estructura de carpetas 'modulos15' y 'modulos18' dentro de '$PARENT_DIR'..."
mkdir -p "$PARENT_DIR/modulos18/extras"
mkdir -p "$PARENT_DIR/modulos18/neurona"
mkdir -p "$PARENT_DIR/modulos18/oca"
mkdir -p "$PARENT_DIR/modulos18/locales"
mkdir -p "$PARENT_DIR/modulos18/.vscode"
mkdir -p "$PARENT_DIR/modulos15/extras"
mkdir -p "$PARENT_DIR/modulos15/neurona"
mkdir -p "$PARENT_DIR/modulos15/oca"
mkdir -p "$PARENT_DIR/modulos15/locales"
mkdir -p "$PARENT_DIR/modulos15/.vscode"

# Crear la carpeta "config" dentro del directorio padre si no existe
echo "Creando la carpeta 'config' dentro de '$PARENT_DIR'..."
mkdir "$PARENT_DIR/config"

# Crear el entorno virtual "venv18" dentro de "config" si no existe
echo "Creando el entorno virtual 'venv18' dentro de '$PARENT_DIR/config' usando python -m venv..."
python3 -m venv "$PARENT_DIR/config/venv18"
echo "Entorno virtual 'venv18' creado con éxito."
wget https://raw.githubusercontent.com/NeuronaTech/estructura/refs/heads/main/requirements-o18.txt -P "$PARENT_DIR/config/"
wget https://raw.githubusercontent.com/NeuronaTech/estructura/refs/heads/main/requirements-o15.txt -P "$PARENT_DIR/config/"

wget https://raw.githubusercontent.com/NeuronaTech/estructura/refs/heads/main/pyrightconfig-o18.json -P "$PARENT_DIR/modulos18/pyrightconfig.json"
wget https://raw.githubusercontent.com/NeuronaTech/estructura/refs/heads/main/vscode-o18/launch.json -P "$PARENT_DIR/modulos18/.vscode/"
wget https://raw.githubusercontent.com/NeuronaTech/estructura/refs/heads/main/vscode-o18/settings.json -P "$PARENT_DIR/modulos18/.vscode/"
wget https://raw.githubusercontent.com/NeuronaTech/estructura/refs/heads/main/vscode-o18/shortcuts.json -P "$PARENT_DIR/modulos18/.vscode/"

echo "Instalando odoo en 'venv18'..."
source "$PARENT_DIR/config/venv18/bin/activate"
pip install --upgrade pip
pip install -r $PARENT_DIR/config/requirements-o18.txt
git clone --branch=18.0 --depth=1 --single-branch https://www.github.com/odoo/odoo "$PARENT_DIR/odoo18"
echo "Estructura completa creada en '$PARENT_DIR'."

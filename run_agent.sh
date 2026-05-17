#!/bin/bash
# ==============================================================================
# Script de Ejecución Autónoma para AceAutonomousCreator
# Diseñado para ser ejecutado por el Cronjob en Google Cloud VM
# ==============================================================================

# 1. Navegar al directorio del proyecto
cd /home/solanauser/solana-agent

# 2. Activar el entorno virtual de Python
if [ -d "venv" ]; then
    source venv/bin/activate
else
    echo "❌ Error: No se encontró el entorno virtual virtualenv (venv)."
    exit 1
fi

# 3. Ejecutar el Agente Autónomo y guardar registros con fecha
echo "==============================================================" >> agent.log
echo "⏰ ARRANQUE AUTÓNOMO CRONJOB: $(date)" >> agent.log
echo "==============================================================" >> agent.log
python agent.py >> agent.log 2>&1

echo "✅ Ciclo autónomo completado." >> agent.log

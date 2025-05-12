
# Variables
PYTHON=python3
CXX=g++
LATEX=pdflatex

# Archivos
DATOS=datos.txt
DATOS1=datos1.txt
PLOT1=plot1.png
PLOT2=plot2.png
PDF=resultados.pdf

# Reglas

all: $(DATOS) $(DATOS1) $(PLOT1) $(PLOT2) $(PDF)

# Generar datos
$(DATOS): makedatos.py
	$(PYTHON) makedatos.py

$(DATOS1): makedatos1.cpp
	$(CXX) makedatos1.cpp -o makedatos1
	./makedatos1

# Graficar datos
$(PLOT1): plotdatos.py $(DATOS)
	$(PYTHON) plotdatos.py

$(PLOT2): plotdatos1.py $(DATOS1)
	$(PYTHON) plotdatos1.py

# Generar PDF
$(PDF): resultados.tex
	$(LATEX) resultados.tex

# Limpiar archivos temporales
clean:
	rm -f $(DATOS) $(DATOS1) makedatos1 *.aux *.log $(PLOT1) $(PLOT2) $(PDF)

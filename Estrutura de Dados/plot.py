import matplotlib.pyplot as plt
from matplotlib.ticker import ScalarFormatter

# Ler os dados do arquivo
x_values = []
y_values = []

with open('arquivo.txt', 'r') as file:
    for line in file:
        x, y = map(int, line.split())
        x_values.append(x)
        y_values.append(y)

plt.plot(x_values, y_values, color='b', label="selectionSort")
plt.xlabel('Tamanho')
plt.ylabel('Tempo(ns)')
plt.title('Gráfico de Linha')
plt.legend()
plt.grid(True)

plt.gca().yaxis.set_major_formatter(ScalarFormatter(useOffset=False))
plt.ticklabel_format(style='plain', axis='y')

plt.ylim(bottom=0)
plt.xlim(left=0, right=x_values[-1])

plt.tight_layout()

#plt.savefig('grafico.png')
plt.show()

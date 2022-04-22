import clips
import logging


class Emergency:
    def __init__(self, city, position):
        city.zones[position - 1] = self


class Police(Emergency):
    def __init__(self, city, position):
        super().__init__(city, position)


class Firefigther(Emergency):
    def __init__(self, city, position):
        super().__init__(city, position)


class Hospital(Emergency):
    def __init__(self, city, position):
        super().__init__(city, position)


class City:
    def __init__(self, dimesionX, dimensionY):
        self.dimensionX = dimesionX
        self.dimensionY = dimensionY
        self.area = dimensionY * dimesionX
        self.zones = [Zone()] * self.area


class Zone:
    def __init__(self):
        self.id = None
        self.Police = None
        self.Hospital = None
        self.Firefigther = None

    def police(self, police):
        self.Police = police

    def hospital(self, hospital):
        self.Hospital = hospital

    def firefigther(self, firefigther):
        self.Firefigther = firefigther


logging.basicConfig(level=10, format='%(message)s')
env = clips.Environment()

router = clips.LoggingRouter()


env.load('clips.clp')

template = env.find_template('PR')

template.assert_fact(zone=1, type=2, people=3, guns=1)
env.run()
for i in env.facts():
    print(i)

# Reglas a definir en CLIPS
# 1 - Cómo determinar el nivel de peligro (Qué tenemos en cuenta) - Zona, Si es fuego/atraco/accidente,
# dimension = grande/media/pequeà, gravedad, cantidad de personas involucradas, mirar las patrullas disponibles
# y llamar en funcin de eso
# 2 - Reglas de si sigue el peligro o ha acabado Mirar cada cierto tiempo si el problema o se ha acabado,
# para que vuelva la patrulla, o sigue el peligro o ha bajado

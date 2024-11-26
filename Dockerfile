# Utilise une image de base avec les outils C++ et CMake
FROM ubuntu:latest

# Installe les dépendances nécessaires (compilateur, CMake, etc.)
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    libcppunit-dev \
    && rm -rf /var/lib/apt/lists/*

# Définit le répertoire de travail
WORKDIR /app

# Copie les fichiers sources et les en-têtes
COPY cppunit_test.cc cppunit.h ./

# Compile le programme de test
RUN g++ -o cppunit_test cppunit_test.cc -lcppunit -ldl

# Définit la commande par défaut pour exécuter les tests
CMD ["./cppunit_test"]
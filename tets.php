<?php

// Interface for all animals
interface AnimalInterface {
    public function __construct($name);
    public function eat();
    public function __toString();
}

// Interface for zoo
interface ZooInterface {
    public function addAnimal(AnimalInterface $animal);
    public function getAnimals();
}

class Zoo implements ZooInterface {
    private $animals = [];

    public function addAnimal(AnimalInterface $animal) {
        $this->animals[] = $animal;
        echo $animal->species . ' ' . $animal->name . ' added to the zoo.' . PHP_EOL;
    }

    public function getAnimals() {
        echo 'Animals in the zoo:' . PHP_EOL;
        foreach ($this->animals as $animal) {
            echo $animal . PHP_EOL;
        }
    }
}

abstract class Animal implements AnimalInterface {

    public $species;
    public $name;

    public function __construct($name) {
        $this->name = $name;
    }

    public function groom() {
        echo 'Grooming the ' . $this->species . ' ' . $this->name . '.' . PHP_EOL;
    }

    public function __toString() {
        return $this->species . ' ' . $this->name . '.' . PHP_EOL;
    }
}

// abstract classes for different kinds of animals
abstract class Carnivore extends Animal {
    public function eat() {
        echo $this->species . ' ' . $this->name . ' is eating meat.' . PHP_EOL;
    }
}

abstract class Herbivore extends Animal {
    public function eat() {
        echo $this->species . ' ' . $this->name . ' is eating plants.' . PHP_EOL;
    }
}

abstract class Omnivore extends Animal {
    public function eat() {
        echo $this->species . ' ' . $this->name . ' is eating both meat and plants.' . PHP_EOL;
    }
}

class Tiger extends Carnivore {
    public $species = 'Tiger';
}

class Elephant extends Herbivore {
    public $species = 'Elephant';
}

class Rhinoceros extends Herbivore {
    public $species = 'Rhinoceros';
}

class Fox extends Omnivore {
    public $species = 'Fox';
}

class SnowLeopard extends Carnivore {
    public $species = 'Snow Leopard';
}

class Rabbit extends Herbivore {
    public $species = 'Rabbit';
}


$zoo = new Zoo();

$tiger = new Tiger('Norman');
$zoo->addAnimal($tiger);
$tiger->groom();
$tiger->eat();

echo '-------' . PHP_EOL;

$elephant = new Elephant('Naomi');
$zoo->addAnimal($elephant);
$elephant->groom();
$elephant->eat();

echo '-------' . PHP_EOL;

$fox = new Fox('Sherman');
$zoo->addAnimal($fox);
$fox->groom();
$fox->eat();

echo '-------' . PHP_EOL;

$zoo->getAnimals();

echo '-------' . PHP_EOL;

echo $tiger;

?>

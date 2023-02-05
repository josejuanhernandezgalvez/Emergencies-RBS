# Emergencies-RBS
This repository contains a CLIPS code for handling incidents in a certain zone, developed for the FSI subject. The code defines 8 rules for determining the necessary response in case of an incident.

[![My Skills](https://skillicons.dev/icons?i=python&perline=3)](https://skillicons.dev)

## Rules

1. `fire_alert` - This rule asserts a fire in a sector with a specified number of people injured if a PR fact is detected with a type of 3 and a non-zero number of people.

2. `injured_alert` - This rule asserts an accident in a sector with a specified number of people injured if a PR fact is detected with a type of 2 and a non-zero number of people.

3. `heist_alert` - This rule asserts a heist in a sector with a specified number of people in danger and a specified number of aggressors if a PR fact is detected with a type of 1, a non-zero number of people, and a non-zero number of aggressors.

4. `there_are_guns` - This rule asserts that the aggressors are armed if a PR fact is detected with guns equal to 1 and type equal to 1.

5. `send_troops_guns` - This rule asserts the number of cops needed if a PR fact is detected with guns equal to 1, type equal to 1, a non-zero number of aggressors, and a non-zero number of people.

6. `send_troops_without_guns` - This rule asserts the number of cops needed if a PR fact is detected with guns equal to 0, type equal to 1, a non-zero number of aggressors, and a non-zero number of people.

7. `send_fire_fighters` - This rule asserts the number of fire trucks needed if a PR fact is detected with type equal to 3 and a non-zero number of people.

8. `injured_people` - This rule asserts the number of ambulances needed if a PR fact is detected with a type greater than 1 and a non-zero number of people.

# Conclusion

This code provides a simple solution for handling incidents in a certain zone. The code defines 8 rules for determining the necessary response in case of an incident, ensuring a prompt and efficient response.

(c) 2022 José Juan Hernández Gálvez



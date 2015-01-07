
We get the error because the program use **attr_reader**, which creates a getter method, but not a setter method. But at the end, the program tries to set Bob's name.

To fix this, change **attr_reader** to **attr_writer** if you don't need the getter method, or set it to **attr_accessor** if you'd like to have both a getter and a setter method for the @name instance variable.

int time_slot;
int delay_time = 500; 
int r1 = 13;  //signal 1 red led
int y1 = 12;  //signal 1 yellow led
int g1 = 11;  //signal 1 green led
int r2 = 10;  //signal 2 red led
int y2 = 9;   //signal 2 yellow led
int g2 = 8;   //signal 2 green led
int r3 = 7;   //signal 3 red led
int y3 = 6;   //signal 3 yellow led
int g3 = 5;   //signal 3 green led
int r4 = 4;   //signal 1 red led
int y4 = 3;   //signal 1 yellow led
int g4 = 2;   //signal 1 green led

void timeSlot1()
{ 
  //Setting all yellow LED's to blink
    digitalWrite(y1, HIGH);
    digitalWrite(y2, HIGH);
    digitalWrite(y3, HIGH);
    digitalWrite(y4, HIGH);
    delay(delay_time);
    digitalWrite(y1, LOW);
    digitalWrite(y2, LOW);
    digitalWrite(y3, LOW);
    digitalWrite(y4, LOW);
    delay(delay_time);
}

void timeSlot2()
{
  //Signal 1 is Green for 3 secs
    digitalWrite(r1, LOW);
  	digitalWrite(r2, HIGH);
    digitalWrite(r3, HIGH);
    digitalWrite(r4, HIGH);
    digitalWrite(g1, HIGH);
    delay(3000);
  //Signal 1 is yellow for 1 sec
    digitalWrite(g1, LOW);
    digitalWrite(y1, HIGH);
    delay(1000);
  	digitalWrite(y1, LOW);
  
  //Signal 2 is Green for 3 secs
    digitalWrite(r1, HIGH);
    digitalWrite(r2, LOW);
    digitalWrite(g2, HIGH);
    delay(3000);
  //Signal 2 is yellow for 1 sec
    digitalWrite(r1, HIGH);
    digitalWrite(g2, LOW);
    digitalWrite(y2, HIGH);
    delay(1000);
    digitalWrite(y2, LOW);
  
  //Signal 3 is Green for 3 secs
    digitalWrite(r2, HIGH);
    digitalWrite(r3, LOW);
    digitalWrite(g3, HIGH);
   	delay(3000);
  //Signal 3 is yellow for 1 sec
    digitalWrite(g3, LOW);
    digitalWrite(y3, HIGH);
    delay(1000);
    digitalWrite(y3, LOW);
  
  //Signal 4 is Green for 3 secs
    digitalWrite(r3, HIGH);
    digitalWrite(r4, LOW);
    digitalWrite(g4, HIGH);
    delay(3000);
  //Signal 4 is yellow for 1 sec
    digitalWrite(g4, LOW);
    digitalWrite(y4, HIGH);
    delay(1000);
  	digitalWrite(y4, LOW);
} 

void timeSlot3()
{
  //Signals 2 and 4 are GREEN for 3 secs
  	digitalWrite(r1, HIGH);
    digitalWrite(r3, HIGH);
    digitalWrite(g2, HIGH);
    digitalWrite(g4, HIGH);
    delay(3000);
 //Signal 2 and 4 are yellow for 1 sec
    digitalWrite(g2, LOW);
    digitalWrite(g4, LOW);
    digitalWrite(y2, HIGH);
    digitalWrite(y4, HIGH);
    delay(1000);
  	digitalWrite(y2, LOW);
    digitalWrite(y4, LOW);
 
 //Signal 1 and 3 are Green for 3 secs
    digitalWrite(r1, LOW);
    digitalWrite(r2, HIGH);
    digitalWrite(r3, LOW);
    digitalWrite(r4, HIGH);
    digitalWrite(g1, HIGH);
    digitalWrite(g3, HIGH);
    delay(3000);
 //Signal 1 and 3 are yellow for 1 sec
    digitalWrite(g1, LOW);
    digitalWrite(g3, LOW);
    digitalWrite(y1, HIGH);
    digitalWrite(y3, HIGH);
    delay(1000);
   	digitalWrite(y1, LOW);
    digitalWrite(y3, LOW);
  	digitalWrite(r2, LOW);
  	digitalWrite(r4, LOW);
}

void setup()
{
  Serial.begin(9600);
  Serial.println("Slot 1: 3 am to 6 am , Light traffic");
  Serial.println("Slot 2: 6 am to 9 am , Medium Traffic");
  Serial.println("Slot 3: 9 am to 9 pm , Heavy Traffic");
  Serial.println("Slot 4: 9 pm to 3 am , Medium Traffic");
  Serial.print("Enter time slot: ");

  //Taking input from Serial Monitor for the time slot
  while (Serial.available() == 0){}
  time_slot = Serial.parseInt();  
  //SIGNAL 1
  pinMode(r1, OUTPUT);  //signal 1 red led
  pinMode(y1, OUTPUT);	//signal 1 yellow led
  pinMode(g1, OUTPUT);  //signal 1 green led
  //SIGNAL 2
  pinMode(r2, OUTPUT);  //signal 2 red led
  pinMode(y2, OUTPUT);	//signal 2 yellow led
  pinMode(g2, OUTPUT);  //signal 2 green led
  //SIGNAL 3
  pinMode(r3, OUTPUT);  //signal 3 red led
  pinMode(y3, OUTPUT);	//signal 3 yellow led
  pinMode(g3, OUTPUT);  //signal 3 green led
  //SIGNAL 4
  pinMode(r4, OUTPUT);  //signal 4 red led
  pinMode(y4, OUTPUT);	//signal 4 yellow led
  pinMode(g4, OUTPUT);  //signal 4 green led
 
}

void loop()
{
  if(time_slot == 1)
  {
    timeSlot1();
    
  }
  else if(time_slot == 2)
  {
    timeSlot2();
  }
  else if(time_slot == 3)
  {
    timeSlot3();
  }
  else if(time_slot == 4)
  {
    timeSlot2();
  }
}
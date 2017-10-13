import sys
import random
import string

def base_str():
	return (string.letters+string.digits)   
def key_gen(KEY_LEN = 12):
	keylist = [random.choice(base_str()) for i in range(KEY_LEN)]
	return ("".join(keylist))


def generate():
	file = open("generated.txt", "w") 
	
	random.seed()
	insert_str = [] # the same as list() but faster
	i = 0
	while(i<61):
		name = ("Dawid", "Vlad", "Andrzej", "Wiktor", "Krista"\
				,'Felicia', 'Janice', 'Katelyn', 'Samantha'\
				,'Meghan', 'Edwin', 'Constance', 'Jeremy' \
				,'Catherine', 'Allison', 'Marion', 'Amanda'\
				,'Ethel','Ethel','Erin','Lorene')
				
		city = ("Oswiecim", "Krakow", "Poznan", "Rzeszow"\
				,'Seattle','Columbus','Las Vegas','Cambridge'\
				,'Montgomery','Danbury','Sioux Falls','Austin'\
				,'Monrovia','Madison','Pearsall','Chicago','El Paso')
		email_service = ("@gmail.com", "@onet.pl", "@hotmail.com", "@op.pl")
		

		


		
		
		phone = random.randint(100000000,999999999)
		insert_str.append("INSERT INTO customer VALUES ("  + "'" \
							+ name[random.randint(0,20)] + " " \
							+ name[random.randint(0,20)] + "','" \
							+ city[random.randint(0,16)] + "','" \
							+ str(phone) + "','" \
							+ name[random.randint(0,16)] \
							+ email_service[random.randint(0,3)] + "','" \
							+ name[random.randint(0,16)] + key_gen(4) + "','" \
							+ key_gen()  + ");")
							
							
		file.write(insert_str[i]+"\n")
		
		
		i = i + 1
	
	
	
	file.close()
						
if __name__ == "__main__":

	generate()
import csv

csvfile = open("laptops.csv", newline='')
reader = csv.DictReader(csvfile)
i =1
for row in reader:
	row['id'] = i
	i = i+1
	row['comments'] = row['comments'].replace('\n',' ')
	print(f"% Facts for {row['brand']} {row['model']}")
	print(f"laptop({str(row['id'])}).")
	print(f"brand({str(row['id'])},\'{row['brand']}\').")
	print(f"model({str(row['id'])},\'{row['model']}\').")
	print(f"ram({str(row['id'])},{row['ram']}).")
	print(f"hd_type({str(row['id'])},\'{row['hd_type']}\').")
	print(f"hd_size({str(row['id'])},{row['hd_size']}).")
	print(f"screen_size({str(row['id'])},{row['screen_size']}).")
	print(f"price({str(row['id'])},{row['price']}).")
	print(f"processor_brand({str(row['id'])},\'{row['processor_brand']}\').")
	print(f"processor_model({str(row['id'])},\'{row['processor_model']}\').")
	if row['clock_speed']:
		print(f"clock_speed({str(row['id'])},{row['clock_speed']}).")
	else:
		print(f"clock_speed({str(row['id'])},0).")
	if row['graphic_card_brand']:
		print(f"gc_brand({str(row['id'])},\'{row['graphic_card_brand']}\').")
	else:
		print(f"gc_brand({str(row['id'])},0).")
	if row['graphic_card_size']:
		print(f"gc_size({str(row['id'])},{row['graphic_card_size']}).")
	else:
		print(f"gc_size({str(row['id'])},0).")
	print(f"os({str(row['id'])},\'{row['os']}\').")
	if row['weight']:
		print(f"weight({str(row['id'])},{row['weight']}).")
	else:
		print(f"weight({str(row['id'])},1).")
	print(f"comments({str(row['id'])},\'{row['comments']}\').")
	print()
	print()
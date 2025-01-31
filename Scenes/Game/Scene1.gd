extends Control


var screen_button # Это тут было давно, ещё когда я делал активацию диалогов по нажатию на нивидимую кнопку на весь экран. Теперь эта переменная нигде не используется. Используется прямое считывание нажатий мыши. Это я вшил в код плагина (res://addons/dialogue_nodes/objects/DialogueBox.gd : 251 стока).
var current_start : String # Буффер-переменная чтобы понимать, какой именно диалог запускать. Но лучше запускать всё вручную.
var Vakumi : int
var Nakima : int


func _ready():
	current_start = 'START14'
	_on_dialogue_box_dialogue_signal(current_start) # Вызывается первый диалог. По умолчанию 'START1'
	$DialogueBox.data = preload("res://Dialogues/chapter 0.tres") # Указывается начальный Диалог
# Пока я не нашёл применения этой функции. Ваще удалить надо наверное. Но в прошлом она использовалась для последовательных вызовов диалогов.
func _on_dialogue_box_dialogue_ended():
	pass

# Функция которую нужно вызывать если надо вызвать диалог.
func _select_dialogue(_start): # Принимает название старта диалога.
	current_start = _start # В переменную-буффер записывается диалог.
	$Timer.start(1) # Вызываем таймер, чтобы диалог не начинался мгновенно.

# Этот таймер предназначен только для вызывания диалогов. Для других эвентов можно сделать другой таймер.
func _on_timer_timeout(): # Вызывается когда время таймера выходит.
	$DialogueBox.start(current_start) # По истечению таймера вызывается Start Node. В качестве аргумента - переменная-буффер.


# Эта функция вызывается, когда в файле диалога вызывается Signal Node. В ноде есть поле, куда ты вписываешь параметр.
# Здесь параметр принимается в виде _value. Делаешь проверки на определённые параметры и вызываешь определённые диалоги. ничего сложного.
func _on_dialogue_box_dialogue_signal(_value): # _value : String
	# Есть идея реализовать руты как ключевые слова. Т.е. представим есть рут 'mainVacumi' или типа того.
	# Тогда можно в Dialogue вызывать сигнал 'mainVacumi1' к примеру и делать проверку:
	# if 'mainVacumi' in _value:
	#     _select_dialogue(_value)

	if 'VakumiGood' in _value:
		Vakumi += 1
	if 'VakumiBad' in _value:
		Vakumi -= 1
	if 'NakimaGood' in _value:
		Nakima += 1
	if 'NakimaBad' in _value:
		Nakima -= 1
		
	if 'START' in _value: # Например 'START1' 'START2' 'START572'. Главное, что есть ключевое слово 'START'. В других проверках лучше не использовать 'START'. Для этого можно создать другую сцену и другой файл диалога.
		if _value == 'START2':
			$BG/BGImage.texture = preload('res://Textures/BGs/school class evening.png')
		if _value == 'START3':
			$BG/BGImage.texture = preload("res://Textures/BGs/wakumi's house.jpeg")
			
	if 'Scene' in _value:
		if _value == 'Scene2':
			get_tree().change_scene_to_file("res://Scenes/Game/Scene2.tscn")
	
	_select_dialogue(_value)

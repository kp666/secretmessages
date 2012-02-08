require 'rubygems'
require 'bundler'
require "bundler/setup"
require 'caesar'
require 'vigenere'
require 'shellwords'
encoded_key ="UREXVIFLJ"
cipher ="ZE VTXVBX LR BRMME CH LKE SOVJH IX IEOXYRFS MQRRYXIWWLHD FAFDOLAQE JGVWOLW. ZE FNECZ
YFGENBSI WH KSIGK SW HBAV TB QIVD NZH UAOXVR MLDTRY SW OGWUIPG RVINJDL. VT XYS YNHNG
UJ KVCK QOG YYTQYWGIAM, AV AUCH MRDMTC U HUOCUWRZ IJ DLYOEEQY GQ TUK JFZFGZIAM FRGCK:
PAXK ARF NGJEGNII, AUCH PRGGV HIYHTUKV, XSHWUOHY JZBUFFINR WLDJGUT NTH RB
OFGEEYXRBXAQG BT SLF JSUT GNEK AYPLCB OW KC LWFOAWYVF NZH LBYX KSLJLTBXC ZB NWAAF,
TIN AYPLCB, GRU OLACOAG. XYS MWWTYKQVBN AQ DRZEZZ CK OESZ XF MIM. BOH CMCZ CFIOES
XYS JJHSVJIEH IX WHR GFFJY ERSG YITFYLOY NY WFCH SV TUK SLHVJHAX UJ NOL OLTU ZLV
IHAWEQ YXRHYK RF NSIIWWS LS PKVKOCF DNQ GHU HBW VUTMIJHCGQ TUGX YS MZRUYJ, SE VCK
RWA ORZHCSWIIK, MEJCLH JNVEE HI APMRJMRHY SGHRXIEQY SQD NZ XYS MSPE GOQV AYVLAGK
FVHQWHN WGTRB UFG OHXWVZPWV. PYKEJS WSOL GNI GFYKLDRTX'J ONLHNGOSE HI LKE SGGK
HBSW TUK VLHBDHSF KQGZIQPEAZ SW COJ VUOSEIWHWV NBC SWTYJV TUK TICMHHCG UJ
TCGHHLYORX SHYOAAJ ME O ZWZ MBTXYG NG PAXK TVOWW."

alphabets = ("a".."z").to_a+("A".."Z").to_a  # no need for both upper case and lower case, but still adding just for the sake of it.
words = open('/usr/share/dict/words').map{|l| l.split("\n")[0]}
msgs =[]
most_matched_till_now = 0
success =""
alphabets.each do |i|
   possible_key = Caesar.encode(i, encoded_key) # have to do each possible key as its not necessary that the possible key is a valid english word
  msg = Vigenere.decode(possible_key, cipher)
  a =[]
  msg.split(" ").each do |word| #looks how many valid/almost valid words are there in the decrypted message
    #cmd=["look",word,].shelljoin
     if words.include? word.downcase     # u will need a word list in "/usr/share/dict/words"
      a << word if word.downcase!= "\n"     
    end
  end
  if most_matched_till_now < a.size
    most_matched_till_now = a.size
    success = msg    #adds the decrypted word with most semi-valid words as the result
  end
end
p  success


pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

#include main.lua
#include gamestate.lua
#include input.lua
#include object.lua
#include objects.lua
#include player.lua
#include px9_decomp.lua

single_level = true
level_index = 2

__gfx__
00000000777777770011110001111110011111000000000000000000000000000000000000000022000000000000000000000000000000000000000000000000
00000000700000070111111011144411111111100000000000000000000000000000000000000220000000000000000000000000000000000000000000000000
00700700722222071114441111474471144441100000000000000000000000000000000000002200000000000000000000000000000000000000000000000000
00077000722222071147447101444440174474100000000000000000000000000000000000022000000000000000000000000000000000000000000000000000
00077000722222070144444000aaaa0004444410000000000eeeeeeeeee000000000000000994000000000000000000000000000000000000000000000000000
007007007222220700aaaa000022220000aaaa7000000000e111ee11e11100000077000009444770000000000000000000000000000000000000000000000000
000000007222220700222200070000700022220000000000e1ccee7ce7cc00000777770004447770000000000000000000000000000000000000000000000000
000000007777777700700700000000000000700000000000e1cceeccee77c0007777777044777777000000000000000000000000000000000000000000000000
577777777777777777777775999999990006000000000000e1cceeeceeccc0000440000000000000000000000000000000000000000000000000000000022000
777777777777777777777777911111190066600000000000eeeeeeeeeeee22220444400000000000000000000000000000000000000000000000000000022000
77777777777777777777777791411419000500000000000088888888888897970442240000000000000000000000000000000000000000000000000000024000
77777771177777711777777791441119000500000000000088888888888897970442244000000000000000000000000000000000000000000000000000044000
777777122177771221777777911441190044400000000000eeeeeeeeeeee11110442244400000000000000000000000000000000000000000000000000044000
71777122221111222217771791414419009990000000000020002220002222220444444420000000000000000000000000000000000000000000000000044000
72111222222222222221112791111119004440000000000001610201615551000477744422000000000000000000000000000000000000000000000000044000
72222222222222222222222799999999009990000000000001110001110111007777774422200777000000000000000000000000000000000000000000042000
72222222222222222222222757777775000000000000066622222222222222225555555555555555555555555777777777777777777777750008800056666650
77222222222222222222227777777777000000000007777722222221122222225555555555555550055555557771111177711111777111170080080066666661
77222222222222222222227777777777000000000000066622222211112222225555555555555500005555557777111117771111177711170800008066666661
77722222222222222222277777177177007000700000000022222111111222225555555555555000000555557177711111777111117771178008800866666661
777222222222222222222777772112770070007000000666222211111111222255555555555500000000555571c777ccccc777ccccc777178008800856666651
772222222222222222222277772222770676067600077777222111111111122255555555555000000000055571cc777ccccc777ccccc77770800008055555551
77222222222222222222227777722777067606760000066622111111111111225555555555000000000000557111177711111777111117770080080015555551
72222222222222222222222757777775067606760000000021111111111111125555555550000000000000055777777777777777777777750008800001111110
722222222222222222222227577777777777777777777775211111111111111211111111500000000000000557777775777ccc17777ccc170077770056666650
7222222222222222222222277777777777777777777777772211111111111122111111115500000000000055777711177777cc177777cc170777677066666665
72222722222222222222222777777777777777777777777722211111111112221111111155500000000005557177711771777c1771777c177777777766666665
72222222222222222222222777777771177777711777777722221111111122221111111155550000000055557117771771c7771771c777177777767766666665
772222222222222222272277777777122177771221777777222221111112222211111111555550000005555571cc777771cc777771cc77777767777756666655
777222222277772222222777717771222211112222177717222222111122222211111111555555000055555571ccc77771ccc77771ccc7777777777755555555
777772222777777222277777721112222222222222211127222222211222222211111111555555500555555571cccc7771cccc77711111770777677005555550
577777777777777777777775577777777777777777777775222222222222222211111111555555555555555571cccc1771cccc17577777750077770000000000
__gff__
0003000000000101010100000000000003030300000001010101000000000001030303030800030301010107070700030303030303030303010101070707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000200000000002021212121000000000000000000000000000000000021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000002021212121000000000000000000000000000000000021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000003021212121000000000000000000000000000000000021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000020212121000000000000000000000000000000000021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000020212121000000000000000000000000000000000021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000020212121000000000000000000000000000000000021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000020212121210000000000000000000000000000000021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000020212121210000000000000000000000000000000021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000030212121210000000000000000000000000000000021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000202121210000000000000000000000000000000021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000202121210000000000000000000000000000000021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000202121210000000000000000000000000000000021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000302121210000000000000000000000000000000021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000002021210000000000000000000000000000000021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000003021210000000000000000000000000000000021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000020210000000000000000000000000000000021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000020210000000000000000000000000000000021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000020210000000000000000000000000000000021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000020210000000000000000000000000000000021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000020210000000000000000000000000000000021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000020210000000000000000000000000000000021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000020210000000000000000000000000000000021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000030210000000000000000000000000000000021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000200000000000000000000000000000200021000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000202200000000000000000000000000202121000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000202200000000000000000000000000202121000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000202111120000000000000000001400202121000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000303131320000000000000000000000202121000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000101111212121000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111111200000000000000000000000000000000000000000000202121212121000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2121212111111111111111111111111111111111111111111111212121212121000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2121212121212121212121212121212121212121212121212121212121212121000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
01030306245342452024510245102451024510245002450030500305002b5002b5002950029500245002450030500305002b5002b5002950029500245002450030500305002b5002b50029500295002450024500
0104020317770187711877018770154001540015400164001740018400194001a4001b4001d4001e4001f4001f4001f4001c40018400164000000000000000000000000000000000000000000000000000000000
010b05080017000160001500014000132001220012200122000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010605081817300154001400013000122001220012200122000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010300002f6702f6302f6202f6202f6102f6102f6102f6102f6152f61500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010400021807020070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01040002180701f070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010b000030830308252b8202b8152982029815248202481530820308152b8202b8152982029815248202481530820308152b8102b8152981029815248102481530820308152b8102b81529810298152481024815
010b0000080400802513045130251a0451a0251f0451f025080400802513045130251a0451a0251f0451f025080400802513045130251a0451a0251f0451f025080400802513045130251a0451a0251f0451f025
010b00000c0400c02513045130251a0451a0251f0451f0250c0400c02513045130251a0451a0251f0451f0250c0400c02513045130251a0451a0251f0451f0250c0400c02513045130251a0451a0251f0451f025
010b00000a0400a02513045130251a0451a0251f0451f0250a0400a02513045130251a0451a0251f0451f0250a0400a02513045130251a0451a0251f0451f0250a0400a02513045130251a0451a0251f0451f025
010b0000060400602513045130251a0451a0251f0451f025060400602513045130251a0451a0251f0451f025070400702513045130251a0451a0251f0451f025070400702513045130251a0451a0251f0451f025
010b00002480024800248002480024800248002480024800248002480024800248002480024800248002480000000000000000000000000000000000000000000000000000000000000000000000001f7501f745
010b0000247402473500000000002b7402b73500000000002b7402b73500000000002b7402b73500000240002b9402b7302b7222b7122c740007002e7402e7302e7202e71530750000002e7402e7352c7402c735
010b00002b9402b7302b7302b7222b7122b7122c7402b740297402973029730297202971029712297120000027740277302773027720277122771229740277402674026730267202671226712267120000000000
010b00002482024820248202482024812248122481224812248122481224812248122481224812248122481500000000000000000000000000000000000000000000000000000000000000000000000000000000
010b0000247402473024722247152b7402b73500000000002b7402b73500000000002b7402b73500000000002b7402b7302b7222b7152c740000002e9402e7302e7422e73530740307352e7402e7352c7402c735
010b0000090400902513040130251a0401a0251f0401f0250804008025120401202519040190251e0401e0250704007025110401102518040180251d0401d0250604006025140401402518040180251d0401d025
010b00002b9402b7302b7302b7222b7122b7122c7402b7302974029730297302972229712297122b7402973027740277302772027722277122771229740277302674026730267302672226712267122671026710
010b000014b5014a2014a2014a5014a2014a2014a5014a2014a5014a2014a2014a5014a2014a2014b5020a2014b5014a2014a2014a5014a2014a2014a5014a2014a5014a2014a2014a5014a2014a2016a5016a20
010b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018c0018c000000024a3018a21
010b000018b5018a2018a2018a5018a2018a2018a5018a2018a5018a2018a2018a5018a2018a2018b5024a2018b5018a2018a2018a5018a2018a2018a5018a2018a5018a2018a2018a5018a2018a201aa5018a20
010b000016b5016a2016a2016a5016a2016a2016a5016a2016a5016a2016a2016a5016a2016a2016b5022a2016b5016a2016a2016a5016a2016a2016a5016a2016a5016a2016a2016a5016a2016a2018a5016a20
010b000012b5012a2012a2012a5012a2012a2012a5012a2012b5012a2012a2012a5012a2012a201ea501ea2007b50000000000000000000000000007b50000000000000000000000000018c4018c1024a3018a21
010b000014b5014a2014a2014a5014a2014a2014a5014a2014c4014c1014a2014a5014a2014a2014b5020a2014b5014a2014a2014a5014a2014a2014a5014a2014c4014c1014a2014a5014a2014a2016a5016a20
010b000018b5018a2018a2018a5018a2018a2018a5018a2018c4018c1018a2018a5018a2018a2018b5024a2018b5018a2018a2018a5018a2018a2018a5018a2018c4018c1018a2018a5018a2018a201ac3018a20
010b000016b5016a2016a2016a5016a2016a2016a5016a2016c4016c1016a2016a5016a2016a2016b5022a2016b5016a2016a2016a5016a2016a2016a5016a2016c4016c1016a2016a5016a2016a2018a5016a20
010b00000000030810308152b8102b8152981029815248102481530810308152b8102b8152981029815248102481530810308152b8102b8152981029815248102481530810308152b8102b815298102981524810
010b000022130221202211222112291302912500000000002912029115000000000029110291150000000000291302912527135001002912500100291302b1302b1202b112291302912527135001002612500000
010b0000241302412024112241122b1302b12500100001002b1202b11500100001002b1102b11500100001002b1302b12529135001002b125001002b1302c1302c1202c1122b1302b12529135001002712500000
010b0000050400502513045130251a0451a0251f0451f025050400502513045130251a0451a0251f0451f025050400502513045130251a0451a0251f0451f025050400502513045130251a0451a0251f0451f025
010b000011b5011a2011a2011a5011a2011a2011a5011a2011c4011c1011a2011a5011a2011a2011b501da2011b5011a2011a2011a5011a2011a2011a5011a2011c4011c1011a2011a5011a2011a2011a5013a20
010b000026130261202611226112291302912500000000002912029115000000000029110291150000000000291302912527135001002912500100291302b1302b1202b112291302912527135001002612500000
010b0000241302412024112241122b1302b12500100001002b1202b11500100001002b1102b11500100001002b1102b11529100001002b1102b1152b1002c1002b1102b1152b1002b1002b1102c1112e7212f731
010b00000b0400b02513045130251a0451a0251f0451f0250b0400b02513045130251a0451a0251f0451f0252b0242b01500000000002b0242b01500000000002b0342b02500000000002b0442b0352b00000000
010b000017b5017a2017a2017a5017a2017a2017a5017a2017c4017c1017a2017a5017a2017a2017b5023a2013b5013a4013a4213a3207a2107a1207a1207a120000000000000000000018b5018a4016b5016a40
010b0000307503074500000000003075030745000000000030750307450000000000307503074030732307253275032740327323272533755000003295032740327323272530750000002e7502e7453074500000
010b00003275032745000000000032740327350000000000327403273032722327153375033745357303572533950337403373033722337123371532950327303273232742337503274030750307403073230725
010b00002c7502c7402c7322c7322c7222c7222e7502e7402e7322e7222e7122e715307503074030732307422f7502f7402f7322f7322f7222f72230750307403073230722307123071532750327403273232725
010b00002a7502b7412b7402b7302b7322b7222b7222b7122b7122b7122b7122b715297402b7302c7302b7502b7402b7402b7322b7222b7122b7122b7150000000000000000000000000297002b7002c7002b700
010b00002f7502f7402f7402f7322f7322f7423075030740307403073230732307423275032740327323273533750337403373033722337123371235750337403275032740327303272232722327123271232715
010b0000080500000013d400000013d3000000080500000013d400000013d3000000080500000013d40000000a0500000013e400000013e30000000a0500000013e400000013e30000000a0500000013e4000000
010b00000b0500000013e400000013e30000000b0500000013e400000013e30000000b0500000013e40000000c050130351b0250c050130351b0250a050130351b0250a050130351b0250a050130301b0201b015
__music__
01 091d4344
00 091d1656
00 090a1555
00 090b1757
00 090c1858
00 090d190e
00 1a0a0f11
00 1b0b1057
00 1c0c1258
00 16131444
00 21201e44
00 1b0b1f44
00 1c0c2244
00 25242344
00 412b2644
00 412c2744
00 41422844
00 41422944
00 41422644
00 41422744
00 41422844
00 41422a44


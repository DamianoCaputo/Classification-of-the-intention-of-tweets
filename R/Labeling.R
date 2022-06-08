#-# Librerie---------
library(readr)
library(textclean)
library(tidyverse)

#-# Creazione set di dati--------
#ragruppo i 4 dataset 
X20210310_tweetitaly_visit <- read_csv("AIMLEA_R/20210310-tweetitaly-visit.csv")
X20210310_tweetitaly_trip <- read_csv("AIMLEA_R/20210310-tweetitaly-trip.csv")
X20210310_tweetitaly_travel <- read_csv("AIMLEA_R/20210310-tweetitaly-travel.csv")
X20210310_tweetitaly_holiday <- read_csv("AIMLEA_R/20210310-tweetitaly-holiday.csv")

tweet <- rbind(X20210310_tweetitaly_holiday,X20210310_tweetitaly_travel,
               X20210310_tweetitaly_trip,X20210310_tweetitaly_visit)

rm(X20210310_tweetitaly_visit)
rm(X20210310_tweetitaly_trip)
rm(X20210310_tweetitaly_travel)
rm(X20210310_tweetitaly_holiday)

#salvo il dataset completo 
write.csv(tweet,file ="test_R.csv")

#importo i dataset di: training e test
test <- read_csv("AIMLEA_R/test_R.csv")

#conto gli na presenti e rimuovo le colonne di poco interesse 
summary(test)

na_count <-sapply(test, function(y) sum(length(which(is.na(y)))))
na_count <- data.frame(na_count)

test$longitude <- NULL #perchè la maggior parte dei valori sono nulli
test$latitude <- NULL #perchè la maggior parte dei valori sono nulli
test$replyToSN <- NULL #perchè la maggior parte dei valori sono nulli
test$replyToSID <- NULL #perchè la maggior parte dei valori sono nulli
test$replyToUID <- NULL #perchè la maggior parte dei valori sono nulli

test$...1 <- NULL
test$...2 <- NULL
test$retweeted <- NULL
test$statusSource <- NULL
test$id <- NULL

test$created <- as.Date(test$created,format = "%d/%m/%Y")

#-# Etichettatura--------
#creo la colonna per l'etichettatura 
test$intention=FALSE

#rimuovo i duplicati
z <- test
x <- z[!duplicated(z$text),]
write.csv(x,file ="test_etichettato_R.csv") #salvo il dataset pulito 
test_2 <- read_csv("AIMLEA_R/test_etichettato_R.csv")
x <- test_2

#Etichettatura manuale 
x$text[1]
x$intention[1] <- 'N'

x$text[2]
x$intention[2] <- 'N'

x$text[3]
x$intention[3] <- 'N'

x$text[4]
x$intention[4] <- 'Y'

x$text[5]
x$intention[5] <- 'N'

x$text[6]
x$intention[6] <- 'N'

x$text[7]
x$intention[7] <- 'Y'

x$text[8]
x$intention[8] <- 'Y'

x$text[9]
x$intention[9] <- 'N'

x$text[10]
x$intention[10] <- 'N'

x$text[11]
x$intention[11] <- 'N'

x$text[12]
x$intention[12] <- 'N'

x$text[13]
x$intention[13] <- 'N'

x$text[14]
x$intention[14] <- 'N'

x$text[15]
x$intention[15] <- 'N'

x$text[16]
x$intention[16] <- 'N'

x$text[17]
x$intention[17] <- 'N'

x$text[18]
x$intention[18] <- 'N'

x$text[19]
x$intention[19] <- 'N'

x$text[20]
x$intention[20] <- 'N'

x$text[21]
x$intention[21] <- 'N'

x$text[22]
x$intention[22] <- 'N'

x$text[23]
x$intention[23] <- 'N'

x$text[24]
x$intention[24] <- 'N'

x$text[25]
x$intention[25] <- 'N'

x$text[26]
x$intention[26] <- 'N'

x$text[27]
x$intention[27] <- 'N'

x$text[28]
x$intention[28] <- 'N'

x$text[29]
x$intention[29] <- 'N'

x$text[30]
x$intention[30] <- 'N'

x$text[31]
x$intention[31] <- 'N'

x$text[32]
x$intention[32] <- 'N'

x$text[33]
x$intention[33] <- 'N'

x$text[34]
x$intention[34] <- 'N'

x$text[35]
x$intention[35] <- 'Y'

x$text[36]
x$intention[36] <- 'N'

x$text[37]
x$intention[37] <- 'N'

x$text[38]
x$intention[38] <- 'N'

x$text[39]
x$intention[39] <- 'N'

x$text[40]
x$intention[40] <- 'Y'

x$text[41]
x$intention[41] <- 'N'

x$text[42]
x$intention[42] <- 'N'

x$text[43]
x$intention[43] <- 'Y'

x$text[44]
x$intention[44] <- 'N'

x$text[45]
x$intention[45] <- 'N'

x$text[46]
x$intention[46] <- 'N'

x$text[47]
x$intention[47] <- 'N'

x$text[48]
x$intention[48] <- 'N'

x$text[49]
x$intention[49] <- 'Y' 

x$text[50]
x$intention[50] <- 'N'

x$text[51]
x$intention[51] <- 'N'

x$text[52]
x$intention[52] <- 'N'

x$text[53]
x$intention[53] <- 'N'

x$text[54]
x$intention[54] <- 'N'

x$text[55]
x$intention[55] <- 'N'

x$text[56]
x$intention[56] <- 'N'

x$text[57]
x$intention[57] <- 'N'

x$text[58]
x$intention[58] <- 'N'

x$text[59]
x$intention[59] <- 'N'

x$text[60]
x$intention[60] <- 'N'

x$text[61]
x$intention[61] <- 'N'

x$text[62]
x$intention[62] <- 'N'

x$text[63]
x$intention[63] <- 'N'

x$text[64]
x$intention[64] <- 'N'

x$text[65]
x$intention[65] <- 'N'

x$text[66]
x$intention[66] <- 'N'

x$text[67]
x$intention[67] <- 'N'

x$text[68]
x$intention[68] <- 'N'

x$text[69]
x$intention[69] <- 'N'

x$text[70]
x$intention[70] <- 'N'

x$text[71]
x$intention[71] <- 'N'

x$text[72]
x$intention[72] <- 'N'

x$text[73]
x$intention[73] <- 'N'

x$text[74]
x$intention[74] <- 'N'

x$text[75]
x$intention[75] <- 'N'

x$text[76]
x$intention[76] <- 'N'

x$text[77]
x$intention[77] <- 'Y'

x$text[78]
x$intention[78] <- 'N'

x$text[79]
x$intention[79] <- 'N'

x$text[80]
x$intention[80] <- 'N'

x$text[81]
x$intention[81] <- 'Y'

x$text[82]
x$intention[82] <- 'N'

x$text[83]
x$intention[83] <- 'N'

x$text[84]
x$intention[84] <- 'N'

x$text[85]
x$intention[85] <- 'N'

x$text[86]
x$intention[86] <- 'N'

x$text[87]
x$intention[87] <- 'N'

x$text[88]
x$intention[88] <- 'N'

x$text[89]
x$intention[89] <- 'N'

x$text[90]
x$intention[90] <- 'N'

x$text[91]
x$intention[91] <- 'N'

x$text[92]
x$intention[92] <- 'N'

x$text[93]
x$intention[93] <- 'N'

x$text[94]
x$intention[94] <- 'Y'

x$text[95]
x$intention[95] <- 'N'

x$text[96]
x$intention[96] <- 'N'

x$text[97]
x$intention[97] <- 'Y'

x$text[98]
x$intention[98] <- 'N'

x$text[99]
x$intention[99] <- 'N'

x$text[100]
x$intention[100] <- 'N'

x$text[101]
x$intention[101] <- 'N'

x$text[102]
x$intention[102] <- 'N'

x$text[103]
x$intention[103] <- 'Y'

x$text[104]
x$intention[104] <- 'N'

x$text[105]
x$intention[105] <- 'N'

x$text[106]
x$intention[106] <- 'N'

x$text[107]
x$intention[107] <- 'N'

x$text[108]
x$intention[108] <- 'N'

x$text[109]
x$intention[109] <- 'N'

x$text[110]
x$intention[110] <- 'N'

x$text[111]
x$intention[111] <- 'N'

x$text[112]
x$intention[112] <- 'N'

x$text[113]
x$intention[113] <- 'Y'

x$text[114]
x$intention[114] <- 'N'

x$text[115]
x$intention[115] <- 'Y'

x$text[116]
x$intention[116] <- 'N'

x$text[117]
x$intention[117] <- 'N'

x$text[118]
x$intention[118] <- 'N'

x$text[119]
x$intention[119] <- 'N'

x$text[120]
x$intention[120] <- 'N'

x$text[121]
x$intention[121] <- 'N'

x$text[122]
x$intention[122] <- 'N'

x$text[123]
x$intention[123] <- 'N'

x$text[124]
x$intention[124] <- 'N'

x$text[125]
x$intention[125] <- 'Y'

x$text[126]
x$intention[126] <- 'N'

x$text[127]
x$intention[127] <- 'N'

x$text[128]
x$intention[128] <- 'N'

x$text[129]
x$intention[129] <- 'N'

x$text[130]
x$intention[130] <- 'N'

x$text[131]
x$intention[131] <- 'N'

x$text[132]
x$intention[132] <- 'Y'

x$text[133]
x$intention[133] <- 'N'

x$text[134]
x$intention[134] <- 'N'

x$text[135]
x$intention[135] <- 'N'

x$text[136]
x$intention[136] <- 'N'

x$text[137]
x$intention[137] <- 'N'

x$text[138]
x$intention[138] <- 'Y'

x$text[139]
x$intention[139] <- 'N'

x$text[140]
x$intention[140] <- 'N'

x$text[141]
x$intention[141] <- 'N'

x$text[142]
x$intention[142] <- 'N'

x$text[143]
x$intention[143] <- 'N'

x$text[144]
x$intention[144] <- 'N'

x$text[145]
x$intention[145] <- 'N'

x$text[146]
x$intention[146] <- 'N'

x$text[147]
x$intention[147] <- 'N'

x$text[148]
x$intention[148] <- 'N'

x$text[149]
x$intention[149] <- 'N'

x$text[150]
x$intention[150] <- 'N'

x$text[151]
x$intention[151] <- 'N'

x$text[152]
x$intention[152] <- 'N'

x$text[153]
x$intention[153] <- 'N'

x$text[154]
x$intention[154] <- 'Y'

x$text[155]
x$intention[155] <- 'N'

x$text[156]
x$intention[156] <- 'N'

x$text[157]
x$intention[157] <- 'N'

x$text[158]
x$intention[158] <- 'N'

x$text[159]
x$intention[159] <- 'N'

x$text[160]
x$intention[160] <- 'N'

x$text[161]
x$intention[161] <- 'Y'

x$text[162]
x$intention[162] <- 'N'

x$text[163]
x$intention[163] <- 'Y'

x$text[164]
x$intention[164] <- 'N'

x$text[165]
x$intention[165] <- 'Y'

x$text[166]
x$intention[166] <- 'N'

x$text[167]
x$intention[167] <- 'Y'

x$text[168]
x$intention[168] <- 'N' 

x$text[169]
x$intention[169] <- 'N'

x$text[170]
x$intention[170] <- 'N'

x$text[171]
x$intention[171] <- 'N'

x$text[172]
x$intention[172] <- 'N'

x$text[173]
x$intention[173] <- 'N'

x$text[174]
x$intention[174] <- 'Y'

x$text[175]
x$intention[175] <- 'N'

x$text[176]
x$intention[176] <- 'Y'

x$text[177]
x$intention[177] <- 'N'

x$text[178]
x$intention[178] <- 'N'

x$text[179]
x$intention[179] <- 'N'

x$text[180]
x$intention[180] <- 'Y'

x$text[181]
x$intention[181] <- 'N'

x$text[182]
x$intention[182] <- 'Y'

x$text[183]
x$intention[183] <- 'N'

x$text[184]
x$intention[184] <- 'N'

x$text[185]
x$intention[185] <- 'N'

x$text[186]
x$intention[186] <- 'N'

x$text[187]
x$intention[187] <- 'N'

x$text[188]
x$intention[188] <- 'N'

x$text[189]
x$intention[189] <- 'Y'

x$text[190]
x$intention[190] <- 'N'

x$text[191]
x$intention[191] <- 'N'

x$text[192]
x$intention[192] <- 'N'

x$text[193]
x$intention[193] <- 'N' 

x$text[194]
x$intention[194] <- 'Y'

x$text[195]
x$intention[195] <- 'N'

x$text[196]
x$intention[196] <- 'N'

x$text[197]
x$intention[197] <- 'N'

x$text[198]
x$intention[198] <- 'N'

x$text[199]
x$intention[199] <- 'N'

x$text[200]
x$intention[200] <- 'N'

x$text[201]
x$intention[201] <- 'N'

x$text[202]
x$intention[202] <- 'N'

x$text[203]
x$intention[203] <- 'N'

x$text[204]
x$intention[204] <- 'N'

x$text[205]
x$intention[205] <- 'N'

x$text[206]
x$intention[206] <- 'N'

x$text[207]
x$intention[207] <- 'N'

x$text[208]
x$intention[208] <- 'N'

x$text[209]
x$intention[209] <- 'N'

x$text[210]
x$intention[210] <- 'N'

x$text[211]
x$intention[211] <- 'N' 

x$text[212]
x$intention[212] <- 'N'

x$text[213]
x$intention[213] <- 'N'

x$text[214]
x$intention[214] <- 'N'

x$text[215]
x$intention[215] <- 'N'

x$text[216]
x$intention[216] <- 'N'

x$text[217]
x$intention[217] <- 'N'

x$text[218]
x$intention[218] <- 'N'

x$text[219]
x$intention[219] <- 'N'

x$text[220]
x$intention[220] <- 'N'

x$text[221]
x$intention[221] <- 'N' 

x$text[222]
x$intention[222] <- 'N'

x$text[223]
x$intention[223] <- 'N'

x$text[224]
x$intention[224] <- 'N'

x$text[225]
x$intention[225] <- 'N'

x$text[226]
x$intention[226] <- 'N'

x$text[227]
x$intention[227] <- 'N'

x$text[228]
x$intention[228] <- 'N'

x$text[229]
x$intention[229] <- 'N'

x$text[230]
x$intention[230] <- 'N'

x$text[231]
x$intention[231] <- 'N'

x$text[232]
x$intention[232] <- 'N'

x$text[233]
x$intention[233] <- 'N'

x$text[234]
x$intention[234] <- 'Y'

x$text[235]
x$intention[235] <- 'N'

x$text[236]
x$intention[236] <- 'N'

x$text[237]
x$intention[237] <- 'N'

x$text[238]
x$intention[238] <- 'N'

x$text[239]
x$intention[239] <- 'N'

x$text[240]
x$intention[240] <- 'N'

x$text[241]
x$intention[241] <- 'N'

x$text[242]
x$intention[242] <- 'N'

x$text[243]
x$intention[243] <- 'N'

x$text[244]
x$intention[244] <- 'N'

x$text[245]
x$intention[245] <- 'N'

x$text[246]
x$intention[246] <- 'N'

x$text[247]
x$intention[247] <- 'N'

x$text[248]
x$intention[248] <- 'N'

x$text[249]
x$intention[249] <- 'N'

x$text[250]
x$intention[250] <- 'N'

x$text[251]
x$intention[251] <- 'N'

x$text[252]
x$intention[252] <- 'N'

x$text[253]
x$intention[253] <- 'N'

x$text[254]
x$intention[254] <- 'N'

x$text[255]
x$intention[255] <- 'N'

x$text[256]
x$intention[256] <- 'N'

x$text[257]
x$intention[257] <- 'N'

x$text[258]
x$intention[258] <- 'N'

x$text[259]
x$intention[259] <- 'N'

x$text[260]
x$intention[260] <- 'N'

x$text[261]
x$intention[261] <- 'N'

x$text[262]
x$intention[262] <- 'N'

x$text[263]
x$intention[263] <- 'N'

x$text[264]
x$intention[264] <- 'Y'

x$text[265]
x$intention[265] <- 'N'

x$text[266]
x$intention[266] <- 'N'

x$text[267]
x$intention[267] <- 'Y'

x$text[268]
x$intention[268] <- 'N'

x$text[269]
x$intention[269] <- 'N'

x$text[270]
x$intention[270] <- 'N'

x$text[271]
x$intention[271] <- 'N' 

x$text[272]
x$intention[272] <- 'N'

x$text[273]
x$intention[273] <- 'N'

x$text[274]
x$intention[274] <- 'N'

x$text[275]
x$intention[275] <- 'N'

x$text[276]
x$intention[276] <- 'N'

x$text[277]
x$intention[277] <- 'N'

x$text[278]
x$intention[278] <- 'N'

x$text[279]
x$intention[279] <- 'N'

x$text[280]
x$intention[280] <- 'N'

x$text[281]
x$intention[281] <- 'N'

x$text[282]
x$intention[282] <- 'N'

x$text[283]
x$intention[283] <- 'N'

x$text[284]
x$intention[284] <- 'N'

x$text[284]
x$intention[284] <- 'N'

x$text[285]
x$intention[285] <- 'N'

x$text[286]
x$intention[286] <- 'N'

x$text[287]
x$intention[287] <- 'Y'

x$text[288]
x$intention[288] <- 'N'

x$text[289]
x$intention[289] <- 'Y'

x$text[290]
x$intention[290] <- 'N'

x$text[291]
x$intention[291] <- 'N'

x$text[292]
x$intention[292] <- 'N'

x$text[293]
x$intention[293] <- 'N'

x$text[294]
x$intention[294] <- 'Y'

x$text[295]
x$intention[295] <- 'N'

x$text[296]
x$intention[296] <- 'N'

x$text[297]
x$intention[297] <- 'N'

x$text[298]
x$intention[298] <- 'Y'

x$text[299]
x$intention[299] <- 'N'

x$text[300]
x$intention[300] <- 'N'

x$text[301]
x$intention[301] <- 'N'

x$text[302]
x$intention[302] <- 'N'

x$text[303]
x$intention[303] <- 'N'

x$text[304]
x$intention[304] <- 'N'

x$text[305]
x$intention[305] <- 'N'

x$text[306]
x$intention[306] <- 'N'

x$text[307]
x$intention[307] <- 'N'

x$text[308]
x$intention[308] <- 'N'

x$text[309]
x$intention[309] <- 'N'

x$text[310]
x$intention[310] <- 'N'

x$text[311]
x$intention[311] <- 'N'

x$text[312]
x$intention[312] <- 'N'

x$text[313]
x$intention[313] <- 'N'

x$text[314]
x$intention[314] <- 'N'

x$text[315]
x$intention[315] <- 'N'

x$text[316]
x$intention[316] <- 'N'

x$text[317]
x$intention[317] <- 'Y'

x$text[318]
x$intention[318] <- 'N'

x$text[319]
x$intention[319] <- 'N'

x$text[320]
x$intention[320] <- 'N'

x$text[321]
x$intention[321] <- 'Y'

x$text[322]
x$intention[322] <- 'N'

x$text[323]
x$intention[323] <- 'N'

x$text[324]
x$intention[324] <- 'N'

x$text[325]
x$intention[325] <- 'N'

x$text[326]
x$intention[326] <- 'Y'

x$text[327]
x$intention[327] <- 'N'

x$text[328]
x$intention[328] <- 'N'

x$text[329]
x$intention[329] <- 'N'

x$text[330]
x$intention[330] <- 'Y'

x$text[331]
x$intention[331] <- 'N'

x$text[332]
x$intention[332] <- 'N'

x$text[333]
x$intention[333] <- 'N'

x$text[334]
x$intention[334] <- 'N'

x$text[335]
x$intention[335] <- 'N'

x$text[336]
x$intention[336] <- 'Y'

x$text[337]
x$intention[337] <- 'N'

x$text[338]
x$intention[338] <- 'N'

x$text[339]
x$intention[339] <- 'N'

x$text[340]
x$intention[340] <- 'N'

x$text[341]
x$intention[341] <- 'N'

x$text[342]
x$intention[342] <- 'N'

x$text[343]
x$intention[343] <- 'N'

x$text[344]
x$intention[344] <- 'N'

x$text[345]
x$intention[345] <- 'N'

x$text[346]
x$intention[346] <- 'N'

x$text[347]
x$intention[347] <- 'N'

x$text[348]
x$intention[348] <- 'N'

x$text[349]
x$intention[349] <- 'N'

x$text[350]
x$intention[350] <- 'N'

x$text[351]
x$intention[351] <- 'N'

x$text[352]
x$intention[352] <- 'N'

x$text[353]
x$intention[353] <- 'N'

x$text[354]
x$intention[354] <- 'N'

x$text[355]
x$intention[355] <- 'N'

x$text[356]
x$intention[356] <- 'N'

x$text[357]
x$intention[357] <- 'N'

x$text[358]
x$intention[358] <- 'N'

x$text[359]
x$intention[359] <- 'N'

x$text[360]
x$intention[360] <- 'N'

x$text[361]
x$intention[361] <- 'N'

x$text[362]
x$intention[362] <- 'N'

x$text[363]
x$intention[363] <- 'Y' 

x$text[364]
x$intention[364] <- 'N'

x$text[365]
x$intention[365] <- 'N'

x$text[366]
x$intention[366] <- 'N'

x$text[367]
x$intention[367] <- 'N'

x$text[368]
x$intention[368] <- 'N'

x$text[369]
x$intention[369] <- 'N'

x$text[370]
x$intention[370] <- 'N'

x$text[371]
x$intention[371] <- 'N'

x$text[372]
x$intention[372] <- 'N'

x$text[373]
x$intention[373] <- 'N'

x$text[374]
x$intention[374] <- 'N'

x$text[375]
x$intention[375] <- 'N'

x$text[376]
x$intention[376] <- 'N'

x$text[377]
x$intention[377] <- 'N'

x$text[378]
x$intention[378] <- 'N'

x$text[379]
x$intention[379] <- 'N'

x$text[380]
x$intention[380] <- 'N'

x$text[381]
x$intention[381] <- 'N'

x$text[382]
x$intention[382] <- 'N'

x$text[383]
x$intention[383] <- 'N'

x$text[384]
x$intention[384] <- 'N'

x$text[385]
x$intention[385] <- 'N'

x$text[386]
x$intention[386] <- 'N'

x$text[387]
x$intention[387] <- 'N'

x$text[388]
x$intention[388] <- 'N'

x$text[389]
x$intention[389] <- 'N'

x$text[390]
x$intention[390] <- 'N'

x$text[391]
x$intention[391] <- 'N'

x$text[392]
x$intention[392] <- 'N'

x$text[393]
x$intention[393] <- 'N'

x$text[394]
x$intention[394] <- 'N'

x$text[395]
x$intention[395] <- 'N'

x$text[396]
x$intention[396] <- 'N'

x$text[397]
x$intention[397] <- 'N'

x$text[398]
x$intention[398] <- 'N'

x$text[399]
x$intention[399] <- 'N'

x$text[400]
x$intention[400] <- 'N'

x$text[401]
x$intention[401] <- 'N'

x$text[402]
x$intention[402] <- 'N'

x$text[403]
x$intention[403] <- 'N'

x$text[404]
x$intention[404] <- 'N'

x$text[405]
x$intention[405] <- 'N'

x$text[406]
x$intention[406] <- 'N'

x$text[407]
x$intention[407] <- 'N'

x$text[408]
x$intention[408] <- 'N'

x$text[409]
x$intention[409] <- 'N'

x$text[410]
x$intention[410] <- 'N'

x$text[411]
x$intention[411] <- 'N'

x$text[412]
x$intention[412] <- 'N'

x$text[413]
x$intention[413] <- 'N'

x$text[414]
x$intention[414] <- 'Y'

x$text[415]
x$intention[415] <- 'N'

x$text[416]
x$intention[416] <- 'N'

x$text[417]
x$intention[417] <- 'N'

x$text[418]
x$intention[418] <- 'N'

x$text[419]
x$intention[419] <- 'N'

x$text[420]
x$intention[420] <- 'N'

x$text[421]
x$intention[421] <- 'N'

x$text[422]
x$intention[422] <- 'N'

x$text[423]
x$intention[423] <- 'N'

x$text[424]
x$intention[424] <- 'N'

x$text[425]
x$intention[425] <- 'N'

x$text[426]
x$intention[426] <- 'N'

x$text[427]
x$intention[427] <- 'N'

x$text[428]
x$intention[428] <- 'Y'

x$text[429]
x$intention[429] <- 'N'

x$text[430]
x$intention[430] <- 'N'

x$text[431]
x$intention[431] <- 'N'

x$text[432]
x$intention[432] <- 'N'

x$text[433]
x$intention[433] <- 'N'

x$text[434]
x$intention[434] <- 'N'

x$text[435]
x$intention[435] <- 'N'

x$text[436]
x$intention[436] <- 'N'

x$text[437]
x$intention[437] <- 'N'

x$text[438]
x$intention[438] <- 'N'

x$text[439]
x$intention[439] <- 'N'

x$text[440]
x$intention[440] <- 'Y'

x$text[441]
x$intention[441] <- 'N'

x$text[442]
x$intention[442] <- 'Y'

x$text[443]
x$intention[443] <- 'N'

x$text[444]
x$intention[444] <- 'N'

x$text[445]
x$intention[445] <- 'N'

x$text[446]
x$intention[446] <- 'Y'

x$text[447]
x$intention[447] <- 'N'

x$text[448]
x$intention[448] <- 'N'

x$text[449]
x$intention[449] <- 'N'

x$text[450]
x$intention[450] <- 'N'

x$text[451]
x$intention[451] <- 'N'

x$text[452]
x$intention[452] <- 'N'

x$text[453]
x$intention[453] <- 'N'

x$text[454]
x$intention[454] <- 'N'

x$text[455]
x$intention[455] <- 'N'

x$text[456]
x$intention[456] <- 'N'

x$text[457]
x$intention[457] <- 'N'

x$text[458]
x$intention[458] <- 'N'

x$text[459]
x$intention[459] <- 'N'

x$text[460]
x$intention[460] <- 'N'

x$text[461]
x$intention[461] <- 'N'

x$text[462]
x$intention[462] <- 'N'

x$text[463]
x$intention[463] <- 'N'

x$text[464]
x$intention[464] <- 'N'

x$text[465]
x$intention[465] <- 'N'

x$text[466]
x$intention[466] <- 'N'

x$text[467]
x$intention[467] <- 'N'

x$text[468]
x$intention[468] <- 'N'

x$text[469]
x$intention[469] <- 'N'

x$text[470]
x$intention[470] <- 'N'

x$text[471]
x$intention[471] <- 'N'

x$text[472]
x$intention[472] <- 'N'

x$text[473]
x$intention[473] <- 'N'

x$text[474]
x$intention[474] <- 'N'

x$text[475]
x$intention[475] <- 'N'

x$text[476]
x$intention[476] <- 'N'

x$text[477]
x$intention[477] <- 'N'

x$text[478]
x$intention[478] <- 'N'

x$text[479]
x$intention[479] <- 'N'

x$text[480]
x$intention[480] <- 'Y'

x$text[481]
x$intention[481] <- 'N'

x$text[482]
x$intention[482] <- 'N'

x$text[483]
x$intention[483] <- 'N'

x$text[484]
x$intention[484] <- 'N'

x$text[485]
x$intention[485] <- 'N'

x$text[486]
x$intention[486] <- 'N'

x$text[487]
x$intention[487] <- 'N'

x$text[488]
x$intention[488] <- 'N'

x$text[489]
x$intention[489] <- 'N'

x$text[490]
x$intention[490] <- 'N'

x$text[491]
x$intention[491] <- 'N'

x$text[492]
x$intention[492] <- 'N'

x$text[493]
x$intention[493] <- 'N'

x$text[494]
x$intention[494] <- 'Y'

x$text[495]
x$intention[495] <- 'N'

x$text[496]
x$intention[496] <- 'N' #DA RIVEDERE 

x$text[497]
x$intention[497] <- 'N'

x$text[498]
x$intention[498] <- 'N'

x$text[499]
x$intention[499] <- 'N'

x$text[500]
x$intention[500] <- 'N'

x$text[501]
x$intention[501] <- 'N'

x$text[502]
x$intention[502] <- 'N'

x$text[503]
x$intention[503] <- 'N'

x$text[504]
x$intention[504] <- 'N'

x$text[505]
x$intention[505] <- 'N'

x$text[506]
x$intention[506] <- 'N'

x$text[507]
x$intention[507] <- 'N'

x$text[508]
x$intention[508] <- 'N'

x$text[509]
x$intention[509] <- 'N'

x$text[510]
x$intention[510] <- 'N'

x$text[511]
x$intention[511] <- 'N'

x$text[512]
x$intention[512] <- 'N'

x$text[513]
x$intention[513] <- 'N'

x$text[514]
x$intention[514] <- 'N'

x$text[515]
x$intention[515] <- 'N'

x$text[516]
x$intention[516] <- 'N'

x$text[517]
x$intention[517] <- 'N'

x$text[518]
x$intention[518] <- 'N'

x$text[519]
x$intention[519] <- 'N'

x$text[520]
x$intention[520] <- 'N'

x$text[521]
x$intention[521] <- 'N'

x$text[522]
x$intention[522] <- 'N'

x$text[523]
x$intention[523] <- 'N'

x$text[524]
x$intention[524] <- 'N'

x$text[525]
x$intention[525] <- 'N'

x$text[526]
x$intention[526] <- 'N'

x$text[527]
x$intention[527] <- 'N'

x$text[528]
x$intention[528] <- 'N'

x$text[529]
x$intention[529] <- 'N'

x$text[530]
x$intention[530] <- 'Y'

x$text[531]
x$intention[531] <- 'N'

x$text[532]
x$intention[532] <- 'N'

x$text[533]
x$intention[533] <- 'N'

x$text[534]
x$intention[534] <- 'N'

x$text[535]
x$intention[535] <- 'N'

x$text[536]
x$intention[536] <- 'N'

x$text[537]
x$intention[537] <- 'N'

x$text[538]
x$intention[538] <- 'N'

x$text[539]
x$intention[539] <- 'N'

x$text[540]
x$intention[540] <- 'N'

x$text[541]
x$intention[541] <- 'N'

x$text[542]
x$intention[542] <- 'N'

x$text[543]
x$intention[543] <- 'N'

x$text[544]
x$intention[544] <- 'N'

x$text[545]
x$intention[545] <- 'N'

x$text[546]
x$intention[546] <- 'N'

x$text[547]
x$intention[547] <- 'N'

x$text[548]
x$intention[548] <- 'N'

x$text[549]
x$intention[549] <- 'N'

x$text[550]
x$intention[550] <- 'N'

x$text[551]
x$intention[551] <- 'Y'

x$text[552]
x$intention[552] <- 'N'

x$text[553]
x$intention[553] <- 'N'

x$text[554]
x$intention[554] <- 'N'

x$text[555]
x$intention[555] <- 'N'

x$text[556]
x$intention[556] <- 'N'

x$text[557]
x$intention[557] <- 'N'

x$text[558]
x$intention[558] <- 'N'

x$text[559]
x$intention[559] <- 'N'

x$text[560]
x$intention[560] <- 'N'

x$text[561]
x$intention[561] <- 'N'

x$text[562]
x$intention[562] <- 'N'

x$text[563]
x$intention[563] <- 'N'

x$text[564]
x$intention[564] <- 'N'

x$text[565]
x$intention[565] <- 'N'

x$text[566]
x$intention[566] <- 'N'

x$text[567]
 x$intention[567] <- 'N'

x$text[568]
x$intention[568] <- 'N'

x$text[569]
x$intention[569] <- 'N'

x$text[570]
x$intention[570] <- 'N'

x$text[571]
x$intention[571] <- 'N'

x$text[572]
x$intention[572] <- 'N'

x$text[573]
x$intention[573] <- 'N'

x$text[574]
x$intention[574] <- 'N'

x$text[575]
x$intention[575] <- 'N'

x$text[576]
x$intention[576] <- 'N'

x$text[578]
x$intention[578] <- 'N'

x$text[579]
x$intention[579] <- 'N'

x$text[580]
x$intention[580] <- 'N'

x$text[581]
x$intention[581] <- 'Y'

x$text[582]
x$intention[582] <- 'N'

x$text[583]
x$intention[583] <- 'N'

x$text[584]
x$intention[584] <- 'N'

x$text[585]
x$intention[585] <- 'N'

x$text[586]
x$intention[586] <- 'N'

x$text[587]
x$intention[587] <- 'N'

x$text[588]
x$intention[588] <- 'N'

x$text[589]
x$intention[589] <- 'N'

x$text[590]
x$intention[590] <- 'N'

x$text[591]
x$intention[591] <- 'N'

x$text[592]
x$intention[592] <- 'N'

x$text[593]
x$intention[593] <- 'N'

x$text[594]
x$intention[594] <- 'N'

x$text[595]
x$intention[595] <- 'N'

x$text[596]
x$intention[596] <- 'N'

x$text[597]
x$intention[597] <- 'N'

x$text[598]
x$intention[598] <- 'N'

x$text[599]
x$intention[599] <- 'N'

x$text[600]
x$intention[600] <- 'N'

x$text[601]
x$intention[601] <- 'N'

x$text[602]
x$intention[602] <- 'N'

x$text[603]
x$intention[603] <- 'N'

x$text[604]
x$intention[604] <- 'N'

x$text[605]
x$intention[605] <- 'N'

x$text[606]
x$intention[606] <- 'N'

x$text[607]
x$intention[607] <- 'N'

x$text[608]
x$intention[608] <- 'N'

x$text[609]
x$intention[609] <- 'N'

x$text[610]
x$intention[610] <- 'N'

x$text[611]
x$intention[611] <- 'N'

x$text[612]
x$intention[612] <- 'N'

x$text[613]
x$intention[613] <- 'N'

x$text[614]
x$intention[614] <- 'N'

x$text[615]
x$intention[615] <- 'N'

x$text[616]
x$intention[616] <- 'N'

x$text[617]
x$intention[617] <- 'N'

x$text[618]
x$intention[618] <- 'N'

x$text[619]
x$intention[619] <- 'N'

x$text[620]
x$intention[620] <- 'N'

x$text[621]
x$intention[621] <- 'N'

x$text[622]
x$intention[622] <- 'N'

x$text[623]
x$intention[623] <- 'N'

x$text[624]
x$intention[624] <- 'N'

x$text[625]
x$intention[625] <- 'Y'

x$text[626]
x$intention[626] <- 'N'

x$text[627]
x$intention[627] <- 'N'

x$text[628]
x$intention[628] <- 'N'

x$text[629]
x$intention[629] <- 'N'

x$text[630]
x$intention[630] <- 'N'

x$text[631]
x$intention[631] <- 'N'

x$text[632]
x$intention[632] <- 'N'

x$text[633]
x$intention[633] <- 'N'

x$text[634]
x$intention[634] <- 'N'

x$text[635]
x$intention[635] <- 'N'

x$text[636]
x$intention[636] <- 'N'

x$text[637]
x$intention[637] <- 'N'

x$text[638]
x$intention[638] <- 'N'

x$text[639]
x$intention[639] <- 'N'

x$text[640]
x$intention[640] <- 'N'

x$text[641]
x$intention[641] <- 'N'

x$text[642]
x$intention[642] <- 'N'

x$text[643]
x$intention[643] <- 'N'

x$text[644]
x$intention[644] <- 'N'

x$text[645]
x$intention[645] <- 'N'

x$text[646]
x$intention[646] <- 'N'

x$text[647]
x$intention[647] <- 'N'

x$text[648]
x$intention[648] <- 'N'

x$text[649]
x$intention[649] <- 'N'

x$text[650]
x$intention[650] <- 'Y'

x$text[651]
x$intention[651] <- 'N'

x$text[652]
x$intention[652] <- 'Y'

x$text[653]
x$intention[653] <- 'N'

x$text[654]
x$intention[654] <- 'N'

x$text[655]
x$intention[655] <- 'N'

x$text[656]
x$intention[656] <- 'N'

x$text[657]
x$intention[657] <- 'N'

x$text[658]
 x$intention[658] <- 'N'

x$text[659]
x$intention[659] <- 'N'

x$text[660]
x$intention[660] <- 'N'

x$text[661]
x$intention[661] <- 'N'

x$text[662]
x$intention[662] <- 'N'

x$text[663]
x$intention[663] <- 'N'

x$text[664]
x$intention[664] <- 'N'

x$text[665]
x$intention[665] <- 'N'

x$text[666]
x$intention[666] <- 'N'

x$text[667]
x$intention[667] <- 'N'

x$text[668]
x$intention[668] <- 'N'

x$text[669]
x$intention[669] <- 'N'

x$text[670]
x$intention[670] <- 'N'

x$text[671]
x$intention[671] <- 'N'

x$text[672]
x$intention[672] <- 'N'

x$text[673]
x$intention[673] <- 'N'

x$text[674]
x$intention[674] <- 'N'

x$text[675]
x$intention[675] <- 'N'

x$text[676]
x$intention[676] <- 'N'

x$text[677]
x$intention[677] <- 'N'

x$text[678]
x$intention[678] <- 'N'

x$text[679]
x$intention[679] <- 'N'

x$text[680]
x$intention[680] <- 'N'

x$text[681]
x$intention[681] <- 'N'

x$text[682]
x$intention[682] <- 'N'

x$text[683]
x$intention[683] <- 'N'

x$text[684]
x$intention[684] <- 'N'

x$text[685]
x$intention[685] <- 'N'

x$text[686]
x$intention[686] <- 'N'

x$text[687]
x$intention[687] <- 'N'

x$text[688]
x$intention[688] <- 'N'

x$text[689]
x$intention[689] <- 'N'

x$text[690]
x$intention[690] <- 'N'

x$text[691]
x$intention[691] <- 'N'

x$text[692]
x$intention[692] <- 'N'

x$text[693]
x$intention[693] <- 'N'

x$text[694]
x$intention[694] <- 'N'

x$text[695]
x$intention[695] <- 'N'

x$text[696]
x$intention[696] <- 'N'

x$text[697]
x$intention[697] <- 'N'

x$text[698]
x$intention[698] <- 'N'

x$text[699]
x$intention[699] <- 'N'

x$text[700]
x$intention[700] <- 'N'

x$text[701]
x$intention[701] <- 'N'

x$text[702]
x$intention[702] <- 'N'

x$text[703]
x$intention[703] <- 'N'

x$text[704]
x$intention[704] <- 'N'

x$text[705]
x$intention[705] <- 'N'

x$text[706]
x$intention[706] <- 'Y'

x$text[707]
x$intention[707] <- 'N'

x$text[708]
x$intention[708] <- 'Y'

x$text[709]
x$intention[709] <- 'N'

x$text[710]
x$intention[710] <- 'N'

x$text[711]
x$intention[711] <- 'N'

x$text[712]
x$intention[712] <- 'N'

x$text[713]
x$intention[713] <- 'N'

x$text[714]
x$intention[714] <- 'N'

x$text[715]
x$intention[715] <- 'N'

x$text[716]
x$intention[716] <- 'N'

x$text[717]
x$intention[717] <- 'N'

x$text[718]
x$intention[718] <- 'N'

x$text[719]
x$intention[719] <- 'N'

x$text[720]
x$intention[720] <- 'N'

x$text[721]
x$intention[721] <- 'N'

x$text[722]
x$intention[722] <- 'N'

x$text[723]
x$intention[723] <- 'N'

x$text[724]
x$intention[724] <- 'N'

x$text[725]
x$intention[725] <- 'N'

x$text[726]
x$intention[726] <- 'N'

x$text[727]
x$intention[727] <- 'N'

x$text[728]
x$intention[728] <- 'N'

x$text[729]
x$intention[729] <- 'N'

x$text[730]
x$intention[730] <- 'N'

x$text[731]
x$intention[731] <- 'N'

x$text[732]
x$intention[732] <- 'N'

x$text[733]
x$intention[733] <- 'N'

x$text[734]
x$intention[734] <- 'N'

x$text[735]
x$intention[735] <- 'N'

x$text[736]
x$intention[736] <- 'N'

x$text[737]
x$intention[737] <- 'Y'

x$text[738]
x$intention[738] <- 'N'

x$text[739]
x$intention[739] <- 'N'

x$text[740]
x$intention[740] <- 'N'

x$text[741]
x$intention[741] <- 'N'

x$text[742]
x$intention[742] <- 'N'

x$text[743]
x$intention[743] <- 'N'

x$text[744]
x$intention[744] <- 'N'

x$text[745]
x$intention[745] <- 'N'

x$text[746]
x$intention[746] <- 'N'

x$text[747]
x$intention[747] <- 'N'

x$text[748]
x$intention[748] <- 'N'

x$text[749]
x$intention[749] <- 'Y'

x$text[750]
x$intention[750] <- 'N'

x$text[751]
x$intention[751] <- 'N'

x$text[752]
x$intention[752] <- 'N'

x$text[753]
x$intention[753] <- 'N'

x$text[754]
x$intention[754] <- 'N'

x$text[755]
x$intention[755] <- 'N'

x$text[756]
x$intention[756] <- 'N'

x$text[757]
x$intention[757] <- 'N'

x$text[758]
x$intention[758] <- 'N'

x$text[759]
x$intention[759] <- 'N'

x$text[760]
x$intention[760] <- 'N'

x$text[761]
x$intention[761] <- 'N'

x$text[762]
x$intention[762] <- 'N'

x$text[763]
x$intention[763] <- 'N'

x$text[764]
x$intention[764] <- 'N'

x$text[765]
x$intention[765] <- 'N'

x$text[766]
x$intention[766] <- 'N'

x$text[767]
x$intention[767] <- 'N'

x$text[768]
x$intention[768] <- 'N'

x$text[769]
x$intention[769] <- 'N'

x$text[770]
x$intention[770] <- 'N'

x$text[771]
x$intention[771] <- 'N'

x$text[772]
x$intention[772] <- 'N'

x$text[773]
x$intention[773] <- 'N'

x$text[774]
x$intention[774] <- 'N'

x$text[775]
x$intention[775] <- 'N'

x$text[776]
x$intention[776] <- 'N'

x$text[777]
x$intention[777] <- 'N'

x$text[778]
x$intention[778] <- 'N'

x$text[779]
x$intention[779] <- 'N'

x$text[780]
x$intention[780] <- 'N'

x$text[781]
x$intention[781] <- 'N'

x$text[782]
x$intention[782] <- 'N'

x$text[783]
x$intention[783] <- 'N'

x$text[784]
x$intention[784] <- 'N'

x$text[785]
x$intention[785] <- 'N'

x$text[786]
x$intention[786] <- 'N'

x$text[787]
x$intention[787] <- 'N'

x$text[788]
x$intention[788] <- 'N'

x$text[789]
x$intention[789] <- 'N'

x$text[790]
x$intention[790] <- 'N'

x$text[791]
x$intention[791] <- 'N'

x$text[792]
x$intention[792] <- 'N'

x$text[793]
x$intention[793] <- 'N'

x$text[794]
x$intention[794] <- 'Y'

x$text[795]
x$intention[795] <- 'N'

x$text[796]
x$intention[796] <- 'Y'

x$text[797]
x$intention[797] <- 'N'

x$text[798]
x$intention[798] <- 'N'

x$text[799]
x$intention[799] <- 'N'

x$text[800]
x$intention[800] <- 'N'

x$text[801]
x$intention[801] <- 'N'

x$text[802]
x$intention[802] <- 'N'

x$text[803]
x$intention[803] <- 'N'

x$text[804]
x$intention[804] <- 'N'

x$text[805]
x$intention[805] <- 'N'

x$text[806]
x$intention[806] <- 'N'

x$text[807]
x$intention[807] <- 'N'

x$text[808]
x$intention[808] <- 'N'

x$text[809]
x$intention[809] <- 'N'

x$text[810]
x$intention[810] <- 'N'

x$text[811]
x$intention[811] <- 'N'

x$text[812]
x$intention[812] <- 'N'

x$text[813]
x$intention[813] <- 'N'

x$text[814]
x$intention[814] <- 'N'

x$text[815]
x$intention[815] <- 'N'

x$text[816]
x$intention[816] <- 'N'

x$text[817]
x$intention[817] <- 'N'

x$text[818]
x$intention[818] <- 'N'

x$text[819]
x$intention[819] <- 'N'

x$text[820]
x$intention[820] <- 'N'

x$text[821]
x$intention[821] <- 'N'

x$text[822]
x$intention[822] <- 'N'

x$text[823]
x$intention[823] <- 'N'

x$text[824]
x$intention[824] <- 'N'

x$text[825]
x$intention[825] <- 'N'

x$text[826]
x$intention[826] <- 'N'

x$text[827]
x$intention[827] <- 'N'

x$text[828]
x$intention[828] <- 'N'

x$text[829]
x$intention[829] <- 'N'

x$text[830]
x$intention[830] <- 'N'

x$text[831]
x$intention[831] <- 'N'

x$text[832]
x$intention[832] <- 'N'

x$text[833]
x$intention[833] <- 'N'

x$text[834]
x$intention[834] <- 'N'

x$text[835]
x$intention[835] <- 'N'

x$text[836]
 x$intention[836] <- 'N'

x$text[837]
x$intention[837] <- 'N'

x$text[838]
x$intention[838] <- 'N'

x$text[839]
x$intention[839] <- 'N'

x$text[840]
x$intention[840] <- 'N'

x$text[841]
x$intention[841] <- 'N'

x$text[842]
x$intention[842] <- 'N'

x$text[843]
x$intention[843] <- 'N'

x$text[844]
x$intention[844] <- 'N'

x$text[845]
x$intention[845] <- 'N' 

x$text[846]
x$intention[846] <- 'N'

x$text[847]
x$intention[847] <- 'N'

x$text[848]
x$intention[848] <- 'N'

x$text[849]
x$intention[849] <- 'N'

x$text[850]
x$intention[850] <- 'N'

x$text[851]
x$intention[851] <- 'N'

x$text[852]
x$intention[852] <- 'N'

x$text[853]
x$intention[853] <- 'N'

x$text[854]
x$intention[854] <- 'N'

x$text[855]
x$intention[855] <- 'N'

x$text[856]
x$intention[856] <- 'N'

x$text[857]
x$intention[857] <- 'N'

x$text[858]
x$intention[858] <- 'N'

x$text[859]
x$intention[859] <- 'N'

x$text[860]
x$intention[860] <- 'N'

x$text[861]
x$intention[861] <- 'N'

x$text[862]
x$intention[862] <- 'N'

x$text[863]
x$intention[863] <- 'N'

x$text[864]
x$intention[864] <- 'N'

x$text[865]
x$intention[865] <- 'N'

x$text[866]
x$intention[866] <- 'N'

x$text[867]
x$intention[867] <- 'N'

x$text[868]
x$intention[868] <- 'N'

x$text[869]
x$intention[869] <- 'N'

x$text[870]
x$intention[870] <- 'N'

x$text[871]
x$intention[871] <- 'N'

x$text[872]
x$intention[872] <- 'N'

x$text[873]
x$intention[873] <- 'N'

x$text[874]
x$intention[874] <- 'N'

x$text[875]
x$intention[875] <- 'N'

x$text[876]
x$intention[876] <- 'N'

x$text[877]
x$intention[877] <- 'N'

x$text[878]
x$intention[878] <- 'N'

x$text[879]
x$intention[879] <- 'N'

x$text[880]
x$intention[880] <- 'N'

x$text[881]
x$intention[881] <- 'N'

x$text[882]
x$intention[882] <- 'N'

x$text[883]
x$intention[883] <- 'N'

x$text[884]
x$intention[884] <- 'N'

x$text[885]
x$intention[885] <- 'N'

x$text[886]
x$intention[886] <- 'N'

x$text[887]
x$intention[887] <- 'N'

x$text[888]
x$intention[888] <- 'N'

x$text[889]
x$intention[889] <- 'N'

x$text[890]
x$intention[890] <- 'N'

x$text[891]
x$intention[891] <- 'N'

x$text[892]
x$intention[892] <- 'N'

x$text[893]
x$intention[893] <- 'N'

x$text[894]
x$intention[894] <- 'N'

x$text[895]
x$intention[895] <- 'N'

x$text[896]
x$intention[896] <- 'N'

x$text[897]
x$intention[897] <- 'N'

x$text[898]
x$intention[898] <- 'N'

x$text[899]
x$intention[899] <- 'N'

x$text[900]
x$intention[900] <- 'N'

x$text[901]
x$intention[901] <- 'Y'

x$text[902]
x$intention[902] <- 'N'

x$text[903]
x$intention[903] <- 'N'

x$text[904]
x$intention[904] <- 'N'

x$text[905]
x$intention[905] <- 'N'

x$text[906]
x$intention[906] <- 'N'

x$text[907]
x$intention[907] <- 'N'

x$text[908]
x$intention[908] <- 'N'

x$text[909]
x$intention[909] <- 'N'

x$text[910]
x$intention[910] <- 'Y'

x$text[911]
x$intention[911] <- 'N'

x$text[912]
x$intention[912] <- 'N'

x$text[913]
x$intention[913] <- 'N'

x$text[914]
x$intention[914] <- 'N'

x$text[915]
x$intention[915] <- 'N'

x$text[916]
x$intention[916] <- 'N'

x$text[917]
x$intention[917] <- 'N'

x$text[918]
x$intention[918] <- 'N'

x$text[919]
x$intention[919] <- 'N'

x$text[920]
x$intention[920] <- 'N'

x$text[921]
x$intention[921] <- 'N'

x$text[922]
x$intention[922] <- 'N'

x$text[923]
x$intention[923] <- 'N'

x$text[924]
x$intention[924] <- 'N'

x$text[925]
x$intention[925] <- 'N'

x$text[926]
x$intention[926] <- 'N'

x$text[927]
x$intention[927] <- 'N'

x$text[928]
x$intention[928] <- 'N'

x$text[929]
x$intention[929] <- 'N'

x$text[930]
x$intention[930] <- 'N'

x$text[931]
x$intention[931] <- 'N'

x$text[932]
x$intention[932] <- 'N'

x$text[933]
x$intention[933] <- 'N'

x$text[934]
x$intention[934] <- 'N'

x$text[935]
x$intention[935] <- 'N'

x$text[936]
x$intention[936] <- 'N'

x$text[937]
x$intention[937] <- 'N'

x$text[938]
x$intention[938] <- 'N'

x$text[939]
x$intention[939] <- 'N'

x$text[940]
x$intention[940] <- 'N'

x$text[941]
x$intention[941] <- 'N'

x$text[942]
x$intention[942] <- 'N'

x$text[943]
x$intention[943] <- 'N'

x$text[944]
x$intention[944] <- 'N'

x$text[945]
x$intention[945] <- 'N'

x$text[946]
x$intention[946] <- 'N'

x$text[947]
x$intention[947] <- 'N'

x$text[948]
x$intention[948] <- 'N'

x$text[949]
x$intention[949] <- 'N'

x$text[950]
x$intention[950] <- 'N'

x$text[951]
x$intention[951] <- 'N'

x$text[952]
x$intention[952] <- 'N'

x$text[953]
x$intention[953] <- 'N'

x$text[954]
x$intention[954] <- 'N'

x$text[955]
x$intention[955] <- 'N'

x$text[956]
x$intention[956] <- 'N'

x$text[957]
x$intention[957] <- 'N'

x$text[958]
x$intention[958] <- 'N'

x$text[959]
x$intention[959] <- 'N'

x$text[960]
x$intention[960] <- 'N'

x$text[961]
x$intention[961] <- 'N'

x$text[962]
x$intention[962] <- 'N'

x$text[963]
x$intention[963] <- 'N'

x$text[964]
x$intention[964] <- 'N'

x$text[965]
x$intention[965] <- 'N'

x$text[966]
x$intention[966] <- 'N'

x$text[967]
x$intention[967] <- 'Y'

x$text[968]
x$intention[968] <- 'N'

x$text[969]
x$intention[969] <- 'N'

x$text[970]
x$intention[970] <- 'N'

x$text[971]
x$intention[971] <- 'N'

x$text[972]
x$intention[972] <- 'N'

x$text[973]
x$intention[973] <- 'N'

x$text[974]
x$intention[974] <- 'N'

x$text[975]
x$intention[975] <- 'N'

x$text[976]
x$intention[976] <- 'N'

x$text[977]
x$intention[977] <- 'N'

x$text[978]
x$intention[978] <- 'N'

x$text[979]
x$intention[979] <- 'N'

x$text[980]
x$intention[980] <- 'N'

x$text[981]
x$intention[981] <- 'N'

x$text[982]
x$intention[982] <- 'N'

x$text[983]
x$intention[983] <- 'N'

x$text[984]
x$intention[984] <- 'N'

x$text[985]
x$intention[985] <- 'N'

x$text[986]
x$intention[986] <- 'N'

x$text[987]
x$intention[987] <- 'N'

x$text[988]
x$intention[988] <- 'N'

x$text[989]
x$intention[989] <- 'N'

x$text[990]
x$intention[990] <- 'N'

x$text[991]
x$intention[991] <- 'N'

x$text[992]
x$intention[992] <- 'N'

x$text[993]
x$intention[993] <- 'N'

x$text[994]
x$intention[994] <- 'N'

x$text[995]
x$intention[995] <- 'Y'

x$text[996]
x$intention[996] <- 'N'

x$text[997]
x$intention[997] <- 'N'

x$text[998]
x$intention[998] <- 'N'

x$text[999]
x$intention[999] <- 'N'

x$text[1000]
x$intention[1000] <- 'N'

x$text[1001]
x$intention[1001] <- 'N'

x$text[1002]
x$intention[1002] <- 'N'

x$text[1003]
x$intention[1003] <- 'N'

x$text[1004]
x$intention[1004] <- 'N'

x$text[1005]
x$intention[1005] <- 'N'

x$text[1006]
x$intention[1006] <- 'N'

x$text[1007]
x$intention[1007] <- 'N'

x$text[1008]
x$intention[1008] <- 'N'

x$text[1009]
x$intention[1009] <- 'N'

x$text[1010]
x$intention[1010] <- 'N'

x$text[1011]
x$intention[1011] <- 'Y'

x$text[1012]
x$intention[1012] <- 'N'

x$text[1013]
x$intention[1013] <- 'N'

x$text[1014]
x$intention[1014] <- 'N'

x$text[1015]
x$intention[1015] <- 'N' 

x$text[1016]
x$intention[1016] <- 'N'

x$text[1017]
x$intention[1017] <- 'N'

x$text[1018]
x$intention[1018] <- 'N'

x$text[1019]
x$intention[1019] <- 'N'

x$text[1020]
x$intention[1020] <- 'N'

x$text[1021]
x$intention[1021] <- 'N'

x$text[1022]
x$intention[1022] <- 'N'

x$text[1023]
x$intention[1023] <- 'N'

x$text[1024]
x$intention[1024] <- 'N'

x$text[1025]
x$intention[1025] <- 'N'

x$text[1026]
x$intention[1026] <- 'N'

x$text[1027]
x$intention[1027] <- 'N'

x$text[1028]
x$intention[1028] <- 'N'

x$text[1029]
x$intention[1029] <- 'Y'

x$text[1030]
x$intention[1030] <- 'N'

x$text[1031]
x$intention[1031] <- 'N'

x$text[1032]
x$intention[1032] <- 'N'

x$text[1033]
x$intention[1033] <- 'N'

x$text[1034]
x$intention[1034] <- 'N'

x$text[1035]
x$intention[1035] <- 'N'

x$text[1036]
x$intention[1036] <- 'N'

x$text[1037]
x$intention[1037] <- 'N'

x$text[1038]
x$intention[1038] <- 'N'

x$text[1039]
x$intention[1039] <- 'N'

x$text[1040]
x$intention[1040] <- 'N'

x$text[1041]
x$intention[1041] <- 'N'

x$text[1042]
x$intention[1042] <- 'N'

x$text[1043]
x$intention[1043] <- 'N'

x$text[1044]
x$intention[1044] <- 'Y'

x$text[1045]
x$intention[1045] <- 'N'

x$text[1046]
x$intention[1046] <- 'N'

x$text[1047]
x$intention[1047] <- 'N'

x$text[1048]
x$intention[1048] <- 'N'

x$text[1049]
x$intention[1049] <- 'N'

x$text[1050]
x$intention[1050] <- 'N'

x$text[1051]
x$intention[1051] <- 'N'

x$text[1052]
x$intention[1052] <- 'N'

x$text[1053]
x$intention[1053] <- 'N'

x$text[1054]
x$intention[1054] <- 'N'

x$text[1055]
x$intention[1055] <- 'N'

x$text[1056]
x$intention[1056] <- 'N'

x$text[1057]
x$intention[1057] <- 'N'

x$text[1058]
x$intention[1058] <- 'N'

x$text[1059]
x$intention[1059] <- 'N'

x$text[1060]
x$intention[1060] <- 'N'

x$text[1061]
x$intention[1061] <- 'N'

x$text[1062]
x$intention[1062] <- 'N'

x$text[1063]
x$intention[1063] <- 'N'

x$text[1064]
x$intention[1064] <- 'N'

x$text[1065]
x$intention[1065] <- 'N'

x$text[1066]
x$intention[1066] <- 'N'

x$text[1067]
x$intention[1067] <- 'N'

x$text[1068]
x$intention[1068] <- 'N'

x$text[1069]
x$intention[1069] <- 'N'

x$text[1070]
x$intention[1070] <- 'N'

x$text[1071]
x$intention[1071] <- 'N'

x$text[1072]
x$intention[1072] <- 'N'

x$text[1073]
x$intention[1073] <- 'N'

x$text[1074]
x$intention[1074] <- 'N'

x$text[1075]
x$intention[1075] <- 'N'

x$text[1076]
x$intention[1076] <- 'N'

x$text[1077]
x$intention[1077] <- 'N'

x$text[1078]
x$intention[1078] <- 'N'

x$text[1079]
x$intention[1079] <- 'N'

x$text[1080]
x$intention[1080] <- 'Y'

x$text[1081]
x$intention[1081] <- 'N'

x$text[1082]
x$intention[1082] <- 'N'

x$text[1083]
x$intention[1083] <- 'N'

x$text[1084]
x$intention[1084] <- 'N'

x$text[1085]
x$intention[1085] <- 'N'

x$text[1086]
x$intention[1086] <- 'N'

x$text[1087]
x$intention[1087] <- 'N'

x$text[1088]
x$intention[1088] <- 'N'

x$text[1089]
x$intention[1089] <- 'N'

x$text[1090]
x$intention[1090] <- 'N'

x$text[1091]
x$intention[1091] <- 'N'

x$text[1092]
x$intention[1092] <- 'N'

x$text[1093]
x$intention[1093] <- 'N'

x$text[1094]
x$intention[1094] <- 'N'

x$text[1095]
x$intention[1095] <- 'N'

x$text[1096]
x$intention[1096] <- 'N'

x$text[1097]
x$intention[1097] <- 'N'

x$text[1098]
x$intention[1098] <- 'N'

x$text[1099]
x$intention[1099] <- 'N'

x$text[1100]
x$intention[1100] <- 'N'

x$text[1101]
x$intention[1101] <- 'N'

x$text[1102]
x$intention[1102] <- 'N'

x$text[1103]
x$intention[1103] <- 'N'

x$text[1104]
x$intention[1104] <- 'N'

x$text[1105]
x$intention[1105] <- 'N'

x$text[1106]
x$intention[1106] <- 'N'

x$text[1107]
x$intention[1107] <- 'N'

x$text[1108]
x$intention[1108] <- 'N'

x$text[1109]
x$intention[1109] <- 'N'

x$text[1110]
x$intention[1110] <- 'N'

x$text[1111]
x$intention[1111] <- 'N'

x$text[1112]
x$intention[1112] <- 'N'

x$text[1113]
x$intention[1113] <- 'N'

x$text[1114]
x$intention[1114] <- 'N'

x$text[1115]
x$intention[1115] <- 'N'

x$text[1116]
x$intention[1116] <- 'N'

x$text[1117]
x$intention[1117] <- 'N'

x$text[1118]
x$intention[1118] <- 'N'

x$text[1119]
x$intention[1119] <- 'N'

x$text[1120]
x$intention[1120] <- 'N'

x$text[1121]
x$intention[1121] <- 'N'

x$text[1122]
x$intention[1122] <- 'N'

x$text[1123]
x$intention[1123] <- 'N'

x$text[1124]
x$intention[1124] <- 'N'

x$text[1125]
x$intention[1125] <- 'N'

x$text[1126]
x$intention[1126] <- 'N'

x$text[1127]
x$intention[1127] <- 'N'

x$text[1128]
x$intention[1128] <- 'N'

x$text[1129]
x$intention[1129] <- 'Y'

x$text[1130]
x$intention[1130] <- 'N'

x$text[1131]
x$intention[1131] <- 'N'

x$text[1132]
x$intention[1132] <- 'N'

x$text[1133]
x$intention[1133] <- 'N'

x$text[1134]
x$intention[1134] <- 'N'

x$text[1135]
x$intention[1135] <- 'N'

x$text[1136]
x$intention[1136] <- 'N'

x$text[1137]
x$intention[1137] <- 'N'

x$text[1138]
x$intention[1138] <- 'N'

x$text[1139]
x$intention[1139] <- 'N'

x$text[1140]
x$intention[1140] <- 'N'

x$text[1141]
x$intention[1141] <- 'N'

x$text[1142]
x$intention[1142] <- 'N'

x$text[1143]
x$intention[1143] <- 'N'

x$text[1144]
x$intention[1144] <- 'N'

x$text[1145]
x$intention[1145] <- 'N'

x$text[1146]
x$intention[1146] <- 'N'

x$text[1147]
x$intention[1147] <- 'N'

x$text[1148]
x$intention[1148] <- 'N'

x$text[1149]
x$intention[1149] <- 'N'

x$text[1150]
x$intention[1150] <- 'N'

x$text[1151]
x$intention[1151] <- 'N'

x$text[1152]
x$intention[1152] <- 'N'

x$text[1153]
x$intention[1153] <- 'N'

x$text[1154]
x$intention[1154] <- 'N'

x$text[1155]
x$intention[1155] <- 'N'

x$text[1156]
x$intention[1156] <- 'N'

x$text[1157]
x$intention[1157] <- 'N'

x$text[1158]
x$intention[1158] <- 'N'

x$text[1159]
x$intention[1159] <- 'N'

x$text[1160]
x$intention[1160] <- 'N'

x$text[1161]
x$intention[1161] <- 'N'

x$text[1162]
x$intention[1162] <- 'N'

x$text[1163]
x$intention[1163] <- 'N'

x$text[1164]
x$intention[1164] <- 'N'

x$text[1165]
x$intention[1165] <- 'N'

x$text[1166]
x$intention[1166] <- 'N'

x$text[1167]
x$intention[1167] <- 'N'

x$text[1168]
x$intention[1168] <- 'N'

x$text[1169]
x$intention[1169] <- 'N'

x$text[1170]
x$intention[1170] <- 'N'

x$text[1171]
x$intention[1171] <- 'N'

x$text[1172]
x$intention[1172] <- 'N'

x$text[1173]
x$intention[1173] <- 'N'

x$text[1174]
x$intention[1174] <- 'N'

x$text[1175]
x$intention[1175] <- 'N'

x$text[1176]
x$intention[1176] <- 'N'

x$text[1177]
x$intention[1177] <- 'N'

x$text[1178]
x$intention[1178] <- 'N'

x$text[1179]
x$intention[1179] <- 'N'

x$text[1180]
x$intention[1180] <- 'N'

x$text[1181]
x$intention[1181] <- 'N'

x$text[1181]
x$intention[1181] <- 'N'

x$text[1182]
x$intention[1182] <- 'N'

x$text[1183]
x$intention[1183] <- 'N'

x$text[1184]
x$intention[1184] <- 'N'

x$text[1185]
x$intention[1185] <- 'N'

x$text[1186]
x$intention[1186] <- 'N'

x$text[1187]
x$intention[1187] <- 'N'

x$text[1188]
x$intention[1188] <- 'N'

x$text[1189]
x$intention[1189] <- 'N'

x$text[1190]
x$intention[1190] <- 'N'

x$text[1191]
x$intention[1191] <- 'N'

x$text[1192]
x$intention[1192] <- 'N'

x$text[1193]
x$intention[1193] <- 'N'

x$text[1194]
x$intention[1194] <- 'N'

x$text[1195]
x$intention[1195] <- 'N'

x$text[1196]
x$intention[1196] <- 'N'

x$text[1197]
x$intention[1197] <- 'N'

x$text[1198]
x$intention[1198] <- 'N'

x$text[1199]
x$intention[1199] <- 'N'

x$text[1200]
x$intention[1200] <- 'N'

x$text[1201]
x$intention[1201] <- 'N'

x$text[1202]
x$intention[1202] <- 'N'

x$text[1203]
x$intention[1203] <- 'Y'

x$text[1204]
x$intention[1204] <- 'N'

x$text[1205]
x$intention[1205] <- 'Y'

x$text[1206]
x$intention[1206] <- 'N'

x$text[1207]
x$intention[1207] <- 'N'

x$text[1208]
x$intention[1208] <- 'N'

x$text[1209]
x$intention[1209] <- 'N'

x$text[1210]
x$intention[1210] <- 'N'

x$text[1211]
x$intention[1211] <- 'N'

x$text[1212]
x$intention[1212] <- 'N'

x$text[1213]
x$intention[1213] <- 'N'

x$text[1214]
x$intention[1214] <- 'N'

x$text[1215]
x$intention[1215] <- 'N'

x$text[1216]
x$intention[1216] <- 'N'

x$text[1217]
x$intention[1217] <- 'N'

x$text[1218]
x$intention[1218] <- 'N'

x$text[1219]
x$intention[1219] <- 'N'

x$text[1220]
x$intention[1220] <- 'N'

x$text[1221]
x$intention[1221] <- 'N'

x$text[1222]
x$intention[1222] <- 'N'

x$text[1223]
x$intention[1223] <- 'N'

x$text[1224]
x$intention[1224] <- 'N'

x$text[1225]
x$intention[1225] <- 'N'

x$text[1226]
x$intention[1226] <- 'N'

x$text[1227]
x$intention[1227] <- 'N'

x$text[1228]
x$intention[1228] <- 'N'

x$text[1229]
x$intention[1229] <- 'N'

x$text[1230]
x$intention[1230] <- 'N'

x$text[1231]
x$intention[1231] <- 'N'

x$text[1232]
x$intention[1232] <- 'N'

x$text[1233]
x$intention[1233] <- 'N'

x$text[1234]
x$intention[1234] <- 'N'

x$text[1235]
x$intention[1235] <- 'N'

x$text[1236]
x$intention[1236] <- 'N'

x$text[1237]
x$intention[1237] <- 'N'

x$text[1238]
x$intention[1238] <- 'N'

x$text[1239]
x$intention[1239] <- 'N'

x$text[1240]
x$intention[1240] <- 'N'

x$text[1241]
x$intention[1241] <- 'N'

x$text[1242]
x$intention[1242] <- 'N'

x$text[1243]
x$intention[1243] <- 'N'

x$text[1244]
x$intention[1244] <- 'N'

x$text[1245]
x$intention[1245] <- 'N'

x$text[1246]
x$intention[1246] <- 'N'

x$text[1247]
x$intention[1247] <- 'N'

x$text[1248]
x$intention[1248] <- 'N'

x$text[1249]
x$intention[1249] <- 'N'

x$text[1250]
x$intention[1250] <- 'N'

x$text[1251]
x$intention[1251] <- 'N'

x$text[1252]
x$intention[1252] <- 'N'

x$text[1253]
x$intention[1253] <- 'N'

x$text[1254]
x$intention[1254] <- 'Y'

x$text[1255]
x$intention[1255] <- 'N'

x$text[1256]
x$intention[1256] <- 'N'

x$text[1257]
x$intention[1257] <- 'N'

x$text[1258]
x$intention[1258] <- 'N'

x$text[1259]
x$intention[1259] <- 'N'

x$text[1260]
x$intention[1260] <- 'N'

x$text[1261]
x$intention[1261] <- 'N'

x$text[1262]
x$intention[1262] <- 'N'

x$text[1263]
x$intention[1263] <- 'N'

x$text[1264]
x$intention[1264] <- 'N'

x$text[1265]
x$intention[1265] <- 'N'

x$text[1266]
x$intention[1266] <- 'N'

x$text[1267]
x$intention[1267] <- 'N'

x$text[1268]
x$intention[1268] <- 'N'

x$text[1269]
x$intention[1269] <- 'N'

x$text[1270]
x$intention[1270] <- 'N'

x$text[1271]
x$intention[1271] <- 'N'

x$text[1272]
x$intention[1272] <- 'N'

x$text[1273]
x$intention[1273] <- 'N'

x$text[1274]
x$intention[1274] <- 'N'

x$text[1275]
x$intention[1275] <- 'N'

x$text[1276]
x$intention[1276] <- 'N'

x$text[1277]
x$intention[1277] <- 'N'

x$text[1278]
x$intention[1278] <- 'N'

x$text[1279]
x$intention[1279] <- 'N'

x$text[1280]
x$intention[1280] <- 'N'

x$text[1281]
x$intention[1281] <- 'N'

x$text[1282]
x$intention[1282] <- 'N'

x$text[1283]
x$intention[1283] <- 'N'

x$text[1284]
x$intention[1284] <- 'N'

x$text[1285]
x$intention[1285] <- 'N'

x$text[1286]
x$intention[1286] <- 'N'

x$text[1287]
x$intention[1287] <- 'N'

x$text[1288]
x$intention[1288] <- 'N'

x$text[1289]
x$intention[1289] <- 'N'

x$text[1290]
x$intention[1290] <- 'N'

x$text[1291]
x$intention[1291] <- 'N'

x$text[1292]
x$intention[1292] <- 'N'

x$text[1293]
x$intention[1293] <- 'N'

x$text[1294]
x$intention[1294] <- 'N'

x$text[1295]
x$intention[1295] <- 'N'

x$text[1296]
x$intention[1296] <- 'N'

x$text[1297]
x$intention[1297] <- 'N'

x$text[1298]
x$intention[1298] <- 'N'

x$text[1299]
x$intention[1299] <- 'Y'

x$text[1300]
x$intention[1300] <- 'N'

x$text[1301]
x$intention[1301] <- 'N'

x$text[1302]
x$intention[1302] <- 'N'

x$text[1303]
x$intention[1303] <- 'N'

x$text[1304]
x$intention[1304] <- 'N'

x$text[1305]
x$intention[1305] <- 'Y'

x$text[1306]
x$intention[1306] <- 'N'

x$text[1307]
x$intention[1307] <- 'N'

x$text[1308]
x$intention[1308] <- 'N'

x$text[1309]
x$intention[1309] <- 'N'

x$text[1310]
x$intention[1310] <- 'N'

x$text[1311]
x$intention[1311] <- 'N'

x$text[1312]
x$intention[1312] <- 'N'

x$text[1313]
x$intention[1313] <- 'N'

x$text[1314]
x$intention[1314] <- 'N'

x$text[1315]
x$intention[1315] <- 'N'

x$text[1316]
x$intention[1316] <- 'N'

x$text[1317]
x$intention[1317] <- 'N'

x$text[1318]
x$intention[1318] <- 'N'

x$text[1319]
x$intention[1319] <- 'N'

x$text[1320]
x$intention[1320] <- 'N'

x$text[1321]
x$intention[1321] <- 'N'

x$text[1322]
x$intention[1322] <- 'N'

x$text[1323]
x$intention[1323] <- 'N'

x$text[1324]
x$intention[1324] <- 'N'

x$text[1325]
x$intention[1325] <- 'N'

x$text[1326]
x$intention[1326] <- 'N'

x$text[1327]
x$intention[1327] <- 'N'

x$text[1328]
x$intention[1328] <- 'N'

x$text[1329]
x$intention[1329] <- 'N'

x$text[1330]
x$intention[1330] <- 'N'

x$text[1331]
x$intention[1331] <- 'N'

x$text[1332]
x$intention[1332] <- 'N'

x$text[1333]
x$intention[1333] <- 'N'

x$text[1334]
x$intention[1334] <- 'N'

x$text[1335]
x$intention[1335] <- 'N'

x$text[1336]
x$intention[1336] <- 'N'

x$text[1337]
x$intention[1337] <- 'N'

x$text[1338]
x$intention[1338] <- 'N'

x$text[1339]
x$intention[1339] <- 'N'

x$text[1340]
x$intention[1340] <- 'N'

x$text[1341]
x$intention[1341] <- 'N'

x$text[1342]
x$intention[1342] <- 'Y'

x$text[1343]
x$intention[1343] <- 'N'

x$text[1344]
x$intention[1344] <- 'N'

x$text[1345]
x$intention[1345] <- 'N'

x$text[1346]
x$intention[1346] <- 'N'

x$text[1347]
x$intention[1347] <- 'N'

x$text[1348]
x$intention[1348] <- 'N'

x$text[1349]
x$intention[1349] <- 'N'

x$text[1350]
x$intention[1350] <- 'N'

x$text[1351]
x$intention[1351] <- 'N'

x$text[1352]
x$intention[1352] <- 'N'

x$text[1353]
x$intention[1353] <- 'N'

x$text[1354]
x$intention[1354] <- 'N'

x$text[1355]
x$intention[1355] <- 'N'

x$text[1356]
x$intention[1356] <- 'N'

x$text[1357]
x$intention[1357] <- 'N'

x$text[1358]
x$intention[1358] <- 'N'

x$text[1359]
x$intention[1359] <- 'N'

x$text[1360]
x$intention[1360] <- 'N'

x$text[1361]
x$intention[1361] <- 'N'

x$text[1362]
x$intention[1362] <- 'N'

x$text[1363]
x$intention[1363] <- 'N'

x$text[1364]
x$intention[1364] <- 'N'

x$text[1365]
x$intention[1365] <- 'N'

x$text[1366]
x$intention[1366] <- 'N'

x$text[1367]
x$intention[1367] <- 'N'

x$text[1368]
x$intention[1368] <- 'N'

x$text[1369]
x$intention[1369] <- 'N'

x$text[1370]
x$intention[1370] <- 'N'

x$text[1371]
x$intention[1371] <- 'N'

x$text[1372]
x$intention[1372] <- 'N'

x$text[1373]
x$intention[1373] <- 'N'

x$text[1374]
x$intention[1374] <- 'N'

x$text[1375]
x$intention[1375] <- 'Y'

x$text[1376]
x$intention[1376] <- 'Y'

x$text[1377]
x$intention[1377] <- 'N'

x$text[1378]
x$intention[1378] <- 'N'

x$text[1379]
x$intention[1379] <- 'N'

x$text[1380]
x$intention[1380] <- 'N'

x$text[1381]
x$intention[1381] <- 'N'

x$text[1382]
x$intention[1382] <- 'N'

x$text[1383]
x$intention[1383] <- 'N'

x$text[1384]
x$intention[1384] <- 'N'

x$text[1385]
x$intention[1385] <- 'N'

x$text[1386]
x$intention[1386] <- 'Y'

x$text[1387]
x$intention[1387] <- 'N'

x$text[1388]
x$intention[1388] <- 'N'

x$text[1389]
x$intention[1389] <- 'N'

x$text[1390]
x$intention[1390] <- 'N'

x$text[1391]
x$intention[1391] <- 'N'

x$text[1392]
x$intention[1392] <- 'N'

x$text[1393]
x$intention[1393] <- 'N'

x$text[1394]
x$intention[1394] <- 'N'

x$text[1395]
x$intention[1395] <- 'N'

x$text[1396]
x$intention[1396] <- 'N'

x$text[1397]
x$intention[1397] <- 'N'

x$text[1398]
x$intention[1398] <- 'N'

x$text[1399]
x$intention[1399] <- 'N'

x$text[1400]
x$intention[1400] <- 'N'

x$text[1401]
x$intention[1401] <- 'N'

x$text[1402]
x$intention[1402] <- 'N'

x$text[1403]
x$intention[1403] <- 'N'

x$text[1404]
x$intention[1404] <- 'N'

x$text[1405]
x$intention[1405] <- 'N'

x$text[1406]
x$intention[1406] <- 'N'

x$text[1407]
x$intention[1407] <- 'N'

x$text[1408]
x$intention[1408] <- 'N'

x$text[1409]
x$intention[1409] <- 'N'

x$text[1410]
x$intention[1410] <- 'N'

x$text[1411]
x$intention[1411] <- 'N'

x$text[1412]
x$intention[1412] <- 'N'

x$text[1413]
x$intention[1413] <- 'N'

x$text[1414]
x$intention[1414] <- 'N'

x$text[1415]
x$intention[1415] <- 'N'

x$text[1416]
x$intention[1416] <- 'N'

x$text[1417]
x$intention[1417] <- 'N'

x$text[1418]
x$intention[1418] <- 'N'

x$text[1419]
x$intention[1419] <- 'N'

x$text[1420]
x$intention[1420] <- 'N'

x$text[1421]
x$intention[1421] <- 'N'

x$text[1422]
x$intention[1422] <- 'N'

x$text[1423]
x$intention[1423] <- 'N'

x$text[1424]
x$intention[1424] <- 'N'

x$text[1425]
x$intention[1425] <- 'N'

x$text[1426]
x$intention[1426] <- 'N'

x$text[1427]
x$intention[1427] <- 'N'

x$text[1428]
x$intention[1428] <- 'N'

x$text[1429]
x$intention[1429] <- 'N'

x$text[1430]
x$intention[1430] <- 'N'

x$text[1431]
x$intention[1431] <- 'N'

x$text[1432]
x$intention[1432] <- 'N'

x$text[1433]
x$intention[1433] <- 'Y'

x$text[1434]
x$intention[1434] <- 'N'

x$text[1435]
x$intention[1435] <- 'N'

x$text[1436]
x$intention[1436] <- 'N'

x$text[1437]
x$intention[1437] <- 'N'

x$text[1438]
x$intention[1438] <- 'N'

x$text[1439]
x$intention[1439] <- 'N'

x$text[1440]
x$intention[1440] <- 'N'

x$text[1441]
x$intention[1441] <- 'N'

x$text[1442]
x$intention[1442] <- 'N'

x$text[1443]
x$intention[1443] <- 'N'

x$text[1444]
x$intention[1444] <- 'N'

x$text[1445]
x$intention[1445] <- 'N'

x$text[1446]
x$intention[1446] <- 'Y'

x$text[1447]
x$intention[1447] <- 'Y'

x$text[1448]
x$intention[1448] <- 'N'

x$text[1449]
x$intention[1449] <- 'N'

x$text[1450]
x$intention[1450] <- 'N'

x$text[1451]
x$intention[1451] <- 'N'

x$text[1452]
x$intention[1452] <- 'N'

x$text[1453]
x$intention[1453] <- 'N'

x$text[1454]
x$intention[1454] <- 'N'

x$text[1455]
x$intention[1455] <- 'N'

x$text[1456]
x$intention[1456] <- 'N'

x$text[1457]
x$intention[1457] <- 'N'

x$text[1458]
x$intention[1458] <- 'N'

x$text[1459]
x$intention[1459] <- 'N'

x$text[1460]
x$intention[1460] <- 'N'

x$text[1461]
x$intention[1461] <- 'Y'

x$text[1462]
x$intention[1462] <- 'N'

x$text[1463]
x$intention[1463] <- 'N'

x$text[1464]
x$intention[1464] <- 'N'

x$text[1465]
x$intention[1465] <- 'N'

x$text[1466]
x$intention[1466] <- 'N'

x$text[1467]
x$intention[1467] <- 'N'

x$text[1468]
x$intention[1468] <- 'N'

x$text[1469]
x$intention[1469] <- 'N'

x$text[1470]
x$intention[1470] <- 'N'

x$text[1471]
x$intention[1471] <- 'N'

x$text[1472]
x$intention[1472] <- 'N'

x$text[1473]
x$intention[1473] <- 'N'

x$text[1474]
x$intention[1474] <- 'Y'

x$text[1475]
x$intention[1475] <- 'N'

x$text[1476]
x$intention[1476] <- 'N'

x$text[1477]
x$intention[1477] <- 'N'

x$text[1478]
x$intention[1478] <- 'N'

x$text[1479]
x$intention[1479] <- 'N'

x$text[1480]
x$intention[1480] <- 'Y'

x$text[1481]
x$intention[1481] <- 'Y'

x$text[1482]
x$intention[1482] <- 'N'

x$text[1483]
x$intention[1483] <- 'N'

x$text[1484]
x$intention[1484] <- 'N'

x$text[1485]
x$intention[1485] <- 'N'

x$text[1486]
x$intention[1486] <- 'N'

x$text[1487]
x$intention[1487] <- 'N'

x$text[1488]
x$intention[1488] <- 'Y'

x$text[1489]
x$intention[1489] <- 'N'

x$text[1490]
x$intention[1490] <- 'N'

x$text[1491]
x$intention[1491] <- 'N'

x$text[1492]
x$intention[1492] <- 'N'

x$text[1493]
x$intention[1493] <- 'N'

x$text[1494]
x$intention[1494] <- 'N'

x$text[1495]
x$intention[1495] <- 'N'

x$text[1496]
x$intention[1496] <- 'N'

x$text[1497]
x$intention[1497] <- 'N'

x$text[1498]
x$intention[1498] <- 'N'

x$text[1499]
x$intention[1499] <- 'N'

x$text[1500]
x$intention[1500] <- 'N'

x$text[1501]
x$intention[1501] <- 'N'

x$text[1502]
x$intention[1502] <- 'N'

x$text[1503]
x$intention[1503] <- 'N'

x$text[1504]
x$intention[1504] <- 'N'

x$text[1505]
x$intention[1505] <- 'N'

x$text[1506]
x$intention[1506] <- 'N'

x$text[1507]
x$intention[1507] <- 'N'

x$text[1508]
x$intention[1508] <- 'N'

x$text[1509]
x$intention[1509] <- 'N'

x$text[1510]
x$intention[1510] <- 'N'

x$text[1511]
x$intention[1511] <- 'N'

x$text[1512]
x$intention[1512] <- 'N'

x$text[1513]
x$intention[1513] <- 'N'

x$text[1514]
x$intention[1514] <- 'N'

x$text[1515]
x$intention[1515] <- 'N'

x$text[1516]
x$intention[1516] <- 'N'

x$text[1517]
x$intention[1517] <- 'N'

x$text[1518]
x$intention[1518] <- 'N'

x$text[1519]
x$intention[1519] <- 'Y'

x$text[1520]
x$intention[1520] <- 'N'

x$text[1521]
x$intention[1521] <- 'Y'

x$text[1522]
x$intention[1522] <- 'N'

x$text[1523]
x$intention[1523] <- 'N'

x$text[1524]
x$intention[1524] <- 'N'

x$text[1525]
x$intention[1525] <- 'N'

x$text[1526]
x$intention[1526] <- 'Y'

x$text[1527]
x$intention[1527] <- 'N'

x$text[1528]
x$intention[1528] <- 'N'

x$text[1529]
x$intention[1529] <- 'N'

x$text[1530]
x$intention[1530] <- 'Y'

x$text[1531]
x$intention[1531] <- 'N'

x$text[1532]
x$intention[1532] <- 'N'

x$text[1533]
x$intention[1533] <- 'N'

x$text[1534]
x$intention[1534] <- 'N'

x$text[1535]
x$intention[1535] <- 'N'

x$text[1536]
x$intention[1536] <- 'N'

x$text[1537]
x$intention[1537] <- 'N'

x$text[1538]
x$intention[1538] <- 'N'

x$text[1539]
x$intention[1539] <- 'N'

x$text[1540]
x$intention[1540] <- 'N'

x$text[1541]
x$intention[1541] <- 'N'

x$text[1542]
x$intention[1542] <- 'N'

x$text[1543]
x$intention[1543] <- 'N'

x$text[1544]
x$intention[1544] <- 'N'

x$text[1545]
x$intention[1545] <- 'N'

x$text[1546]
x$intention[1546] <- 'N'

x$text[1547]
x$intention[1547] <- 'Y'

x$text[1548]
x$intention[1548] <- 'N'

x$text[1549]
x$intention[1549] <- 'N'

x$text[1550]
x$intention[1550] <- 'N'

x$text[1551]
x$intention[1551] <- 'N'

x$text[1552]
x$intention[1552] <- 'N'

x$text[1553]
x$intention[1553] <- 'N'

x$text[1554]
x$intention[1554] <- 'N'

x$text[1555]
x$intention[1555] <- 'Y'

x$text[1556]
x$intention[1556] <- 'N'

x$text[1557]
x$intention[1557] <- 'N'

x$text[1558]
x$intention[1558] <- 'N'

x$text[1559]
x$intention[1559] <- 'N'

x$text[1560]
x$intention[1560] <- 'N'

x$text[1561]
x$intention[1561] <- 'N'

x$text[1562]
x$intention[1562] <- 'N'

x$text[1563]
x$intention[1563] <- 'N'

x$text[1564]
x$intention[1564] <- 'N'

x$text[1565]
x$intention[1565] <- 'N'

x$text[1566]
x$intention[1566] <- 'N'

x$text[1567]
x$intention[1567] <- 'Y'

x$text[1568]
x$intention[1568] <- 'N'

x$text[1569]
x$intention[1569] <- 'N'

x$text[1570]
x$intention[1570] <- 'N'

x$text[1571]
x$intention[1571] <- 'N'

x$text[1572]
x$intention[1572] <- 'N'

x$text[1573]
x$intention[1573] <- 'N'

x$text[1574]
x$intention[1574] <- 'N'

x$text[1575]
x$intention[1575] <- 'N'

x$text[1576]
x$intention[1576] <- 'Y'

x$text[1577]
x$intention[1577] <- 'N'

x$text[1578]
x$intention[1578] <- 'N'

x$text[1579]
x$intention[1579] <- 'N'

x$text[1580]
x$intention[1580] <- 'Y'

x$text[1581]
x$intention[1581] <- 'N'

x$text[1582]
x$intention[1582] <- 'N'

x$text[1583]
x$intention[1583] <- 'N'

x$text[1584]
x$intention[1584] <- 'N'

x$text[1585]
x$intention[1585] <- 'N'

x$text[1586]
x$intention[1586] <- 'N'

x$text[1587]
x$intention[1587] <- 'N'

x$text[1588]
x$intention[1588] <- 'N'

x$text[1589]
x$intention[1589] <- 'N'

x$text[1590]
x$intention[1590] <- 'N'

x$text[1591]
x$intention[1591] <- 'N'

x$text[1592]
x$intention[1592] <- 'N'

x$text[1593]
x$intention[1593] <- 'N'

x$text[1594]
x$intention[1594] <- 'N'

x$text[1595]
x$intention[1595] <- 'N'

x$text[1596]
x$intention[1596] <- 'N'

x$text[1597]
x$intention[1597] <- 'N'

x$text[1598]
x$intention[1598] <- 'N'

x$text[1599]
x$intention[1599] <- 'N'

x$text[1600]
x$intention[1600] <- 'N'

x$text[1601]
x$intention[1601] <- 'N'

x$text[1602]
x$intention[1602] <- 'N'

x$text[1603]
x$intention[1603] <- 'N'

x$text[1604]
x$intention[1604] <- 'N'

x$text[1605]
x$intention[1605] <- 'N'

x$text[1606]
x$intention[1606] <- 'N'

x$text[1607]
x$intention[1607] <- 'N'

x$text[1608]
x$intention[1608] <- 'N'

x$text[1609]
x$intention[1609] <- 'N'

x$text[1610]
x$intention[1610] <- 'N'

x$text[1611]
x$intention[1611] <- 'Y'

x$text[1612]
x$intention[1612] <- 'N'

x$text[1613]
x$intention[1613] <- 'N'

x$text[1614]
x$intention[1614] <- 'N'

x$text[1615]
x$intention[1615] <- 'N'

x$text[1616]
x$intention[1616] <- 'N'

x$text[1617]
x$intention[1617] <- 'N'

x$text[1618]
x$intention[1618] <- 'N'

x$text[1619]
x$intention[1619] <- 'N'

x$text[1620]
x$intention[1620] <- 'N'

x$text[1621]
x$intention[1621] <- 'N'

x$text[1622]
x$intention[1622] <- 'N'

x$text[1623]
x$intention[1623] <- 'N'

x$text[1624]
x$intention[1624] <- 'N'

x$text[1625]
x$intention[1625] <- 'N'

x$text[1626]
x$intention[1626] <- 'N'

x$text[1627]
x$intention[1627] <- 'N'

x$text[1628]
x$intention[1628] <- 'Y'

x$text[1629]
x$intention[1629] <- 'Y'

x$text[1630]
x$intention[1630] <- 'N'

x$text[1631]
x$intention[1631] <- 'N'

x$text[1632]
x$intention[1632] <- 'N'

x$text[1633]
x$intention[1633] <- 'N'

x$text[1634]
x$intention[1634] <- 'N'

x$text[1635]
x$intention[1635] <- 'N'

x$text[1636]
x$intention[1636] <- 'N'

x$text[1637]
x$intention[1637] <- 'N'

x$text[1638]
x$intention[1638] <- 'Y'

x$text[1639]
x$intention[1639] <- 'N'

x$text[1640]
x$intention[1640] <- 'N'

x$text[1641]
x$intention[1641] <- 'N'

x$text[1642]
x$intention[1642] <- 'N'

x$text[1643]
x$intention[1643] <- 'N'

x$text[1644]
x$intention[1644] <- 'N'

x$text[1645]
x$intention[1645] <- 'N'

x$text[1646]
x$intention[1646] <- 'Y'

x$text[1647]
x$intention[1647] <- 'N'

x$text[1648]
x$intention[1648] <- 'N'

x$text[1649]
x$intention[1649] <- 'N'

x$text[1650]
x$intention[1650] <- 'N'

x$text[1651]
x$intention[1651] <- 'N'

x$text[1652]
x$intention[1652] <- 'Y'

x$text[1653]
x$intention[1653] <- 'N'

x$text[1654]
x$intention[1654] <- 'N'

x$text[1655]
x$intention[1655] <- 'N'

x$text[1656]
x$intention[1656] <- 'N'

x$text[1657]
x$intention[1657] <- 'N'

x$text[1658]
x$intention[1658] <- 'N'

x$text[1659]
x$intention[1659] <- 'N'

x$text[1660]
x$intention[1660] <- 'N'

x$text[1661]
x$intention[1661] <- 'Y'

x$text[1662]
x$intention[1662] <- 'Y'

x$text[1663]
x$intention[1663] <- 'N'

x$text[1664]
x$intention[1664] <- 'N'

x$text[1665]
x$intention[1665] <- 'N'

x$text[1666]
x$intention[1666] <- 'N'

x$text[1667]
x$intention[1667] <- 'N'

x$text[1668]
x$intention[1668] <- 'N'

x$text[1669]
x$intention[1669] <- 'N'

x$text[1670]
x$intention[1670] <- 'Y'

x$text[1671]
x$intention[1671] <- 'N'

x$text[1672]
x$intention[1672] <- 'N'

x$text[1673]
x$intention[1673] <- 'N'

x$text[1674]
x$intention[1674] <- 'N'

x$text[1675]
x$intention[1675] <- 'N'

x$text[1676]
x$intention[1676] <- 'N'

x$text[1677]
x$intention[1677] <- 'N'

x$text[1678]
x$intention[1678] <- 'N'

x$text[1679]
x$intention[1679] <- 'N'

x$text[1680]
x$intention[1680] <- 'N'

x$text[1681]
x$intention[1681] <- 'N'

x$text[1682]
x$intention[1682] <- 'N'

x$text[1683]
x$intention[1683] <- 'N'

x$text[1684]
x$intention[1684] <- 'N'

x$text[1685]
x$intention[1685] <- 'N'

x$text[1686]
x$intention[1686] <- 'N'

x$text[1687]
x$intention[1687] <- 'N'

x$text[1688]
x$intention[1688] <- 'N'

x$text[1689]
x$intention[1689] <- 'Y'

x$text[1690]
x$intention[1690] <- 'Y'

x$text[1691]
x$intention[1691] <- 'N'

x$text[1692]
x$intention[1692] <- 'Y'

x$text[1693]
x$intention[1693] <- 'Y'

x$text[1694]
x$intention[1694] <- 'N'

x$text[1695]
x$intention[1695] <- 'N'

x$text[1696]
x$intention[1696] <- 'N'

x$text[1697]
x$intention[1697] <- 'N'

x$text[1698]
x$intention[1698] <- 'N'

x$text[1699]
x$intention[1699] <- 'N'

x$text[1700]
x$intention[1700] <- 'N'

x$text[1701]
x$intention[1701] <- 'N'

x$text[1702]
x$intention[1702] <- 'Y'

x$text[1703]
x$intention[1703] <- 'N'

x$text[1704]
x$intention[1704] <- 'N'

x$text[1705]
x$intention[1705] <- 'N'

x$text[1706]
x$intention[1706] <- 'N'

x$text[1707]
x$intention[1707] <- 'N'

x$text[1708]
x$intention[1708] <- 'N'

x$text[1709]
x$intention[1709] <- 'N'

x$text[1710]
x$intention[1710] <- 'N'

x$text[1711]
x$intention[1711] <- 'N'

x$text[1712]
x$intention[1712] <- 'N'

x$text[1713]
x$intention[1713] <- 'N'

x$text[1714]
x$intention[1714] <- 'N'

x$text[1715]
x$intention[1715] <- 'N'

x$text[1716]
x$intention[1716] <- 'N'

x$text[1717]
x$intention[1717] <- 'N'

x$text[1718]
x$intention[1718] <- 'N'

x$text[1719]
x$intention[1719] <- 'N'

x$text[1720]
x$intention[1720] <- 'N'

x$text[1721]
x$intention[1721] <- 'N'

x$text[1722]
x$intention[1722] <- 'N'

x$text[1723]
x$intention[1723] <- 'N'

x$text[1724]
x$intention[1724] <- 'N'

x$text[1725]
x$intention[1725] <- 'N'

x$text[1726]
x$intention[1726] <- 'Y'

x$text[1727]
x$intention[1727] <- 'N'

x$text[1728]
x$intention[1728] <- 'N'

x$text[1729]
x$intention[1729] <- 'N'

x$text[1730]
x$intention[1730] <- 'N'

x$text[1731]
x$intention[1731] <- 'N'

x$text[1732]
x$intention[1732] <- 'N'

x$text[1733]
x$intention[1733] <- 'N'

x$text[1734]
x$intention[1734] <- 'N'

x$text[1735]
x$intention[1735] <- 'N'

x$text[1736]
x$intention[1736] <- 'N'

x$text[1737]
x$intention[1737] <- 'N'

x$text[1738]
x$intention[1738] <- 'N'

x$text[1739]
x$intention[1739] <- 'N'

x$text[1740]
x$intention[1740] <- 'N'

x$text[1741]
x$intention[1741] <- 'Y'

x$text[1742]
x$intention[1742] <- 'N'

x$text[1743]
x$intention[1743] <- 'N'

x$text[1744]
x$intention[1744] <- 'N'

x$text[1745]
x$intention[1745] <- 'N'

x$text[1746]
x$intention[1746] <- 'N'

x$text[1747]
x$intention[1747] <- 'N'

x$text[1748]
x$intention[1748] <- 'N'

x$text[1749]
x$intention[1749] <- 'N'

x$text[1750]
x$intention[1750] <- 'N'

x$text[1751]
x$intention[1751] <- 'N'

x$text[1751]
x$intention[1751] <- 'N'

x$text[1752]
x$intention[1752] <- 'N'

x$text[1753]
x$intention[1753] <- 'N'

x$text[1754]
x$intention[1754] <- 'N'

x$text[1755]
x$intention[1755] <- 'N'

x$text[1756]
x$intention[1756] <- 'N'

x$text[1757]
x$intention[1757] <- 'N'

x$text[1758]
x$intention[1758] <- 'N'

x$text[1759]
x$intention[1759] <- 'N'

x$text[1760]
x$intention[1760] <- 'N'

x$text[1761]
x$intention[1761] <- 'Y'

x$text[1762]
x$intention[1762] <- 'N'

x$text[1763]
x$intention[1763] <- 'N'

x$text[1764]
x$intention[1764] <- 'N'

x$text[1765]
x$intention[1765] <- 'N'

x$text[1766]
x$intention[1766] <- 'N'

x$text[1767]
x$intention[1767] <- 'N'

x$text[1768]
x$intention[1768] <- 'N'

x$text[1769]
x$intention[1769] <- 'N'

x$text[1770]
x$intention[1770] <- 'N'

x$text[1771]
x$intention[1771] <- 'Y'

x$text[1772]
x$intention[1772] <- 'N'

x$text[1773]
x$intention[1773] <- 'N'

x$text[1774]
x$intention[1774] <- 'N'

x$text[1775]
x$intention[1775] <- 'N'

x$text[1776]
x$intention[1776] <- 'N'

x$text[1777]
x$intention[1777] <- 'N'

x$text[1778]
x$intention[1778] <- 'N'

x$text[1779]
x$intention[1779] <- 'N'

x$text[1780]
x$intention[1780] <- 'N'

x$text[1781]
x$intention[1781] <- 'N'

x$text[1782]
x$intention[1782] <- 'N'

x$text[1783]
x$intention[1783] <- 'N'

x$text[1784]
x$intention[1784] <- 'Y'

x$text[1785]
x$intention[1785] <- 'N'

x$text[1786]
x$intention[1786] <- 'Y'

x$text[1787]
x$intention[1787] <- 'Y'

x$text[1788]
x$intention[1788] <- 'N'

x$text[1789]
x$intention[1789] <- 'N'

x$text[1790]
x$intention[1790] <- 'N'

x$text[1791]
x$intention[1791] <- 'N'

x$text[1792]
x$intention[1792] <- 'N'

x$text[1793]
x$intention[1793] <- 'N'

x$text[1794]
x$intention[1794] <- 'N'

x$text[1795]
x$intention[1795] <- 'N'

x$text[1796]
x$intention[1796] <- 'N'

x$text[1797]
x$intention[1797] <- 'N'

x$text[1798]
x$intention[1798] <- 'N'

x$text[1799]
x$intention[1799] <- 'N'

x$text[1800]
x$intention[1800] <- 'Y'

x$text[1801]
x$intention[1801] <- 'N'

x$text[1802]
x$intention[1802] <- 'N'

x$text[1803]
x$intention[1803] <- 'N'

x$text[1804]
x$intention[1804] <- 'N'

x$text[1805]
x$intention[1805] <- 'N'

x$text[1806]
x$intention[1806] <- 'N'

x$text[1807]
x$intention[1807] <- 'N'

x$text[1808]
x$intention[1808] <- 'N'

x$text[1809]
x$intention[1809] <- 'Y'

x$text[1810]
x$intention[1810] <- 'N'

x$text[1811]
x$intention[1811] <- 'Y'

x$text[1812]
x$intention[1812] <- 'N'

x$text[1813]
x$intention[1813] <- 'N'

x$text[1814]
x$intention[1814] <- 'N'

x$text[1815]
x$intention[1815] <- 'N'

x$text[1816]
x$intention[1816] <- 'N'

x$text[1817]
x$intention[1817] <- 'N'

x$text[1818]
x$intention[1818] <- 'N'

x$text[1819]
x$intention[1819] <- 'N'

x$text[1820]
x$intention[1820] <- 'N'

x$text[1821]
x$intention[1821] <- 'N'

x$text[1822]
x$intention[1822] <- 'N'

x$text[1823]
x$intention[1823] <- 'N'

x$text[1824]
x$intention[1824] <- 'N'

x$text[1825]
x$intention[1825] <- 'N'

x$text[1826]
x$intention[1826] <- 'N'

x$text[1827]
x$intention[1827] <- 'N'

x$text[1828]
x$intention[1828] <- 'N'

x$text[1829]
x$intention[1829] <- 'N'

x$text[1830]
x$intention[1830] <- 'N'

x$text[1831]
x$intention[1831] <- 'N'

x$text[1832]
x$intention[1832] <- 'Y'

x$text[1833]
x$intention[1833] <- 'Y'

x$text[1834]
x$intention[1834] <- 'Y'

x$text[1835]
x$intention[1835] <- 'N'

x$text[1836]
x$intention[1836] <- 'Y'

x$text[1837]
x$intention[1837] <- 'Y'

x$text[1838]
x$intention[1838] <- 'N'

x$text[1839]
x$intention[1839] <- 'N'

x$text[1840]
x$intention[1840] <- 'N'

x$text[1841]
x$intention[1841] <- 'N'

x$text[1842]
x$intention[1842] <- 'N'

x$text[1843]
x$intention[1843] <- 'N'

x$text[1844]
x$intention[1844] <- 'N'

x$text[1845]
x$intention[1845] <- 'N'

x$text[1846]
x$intention[1846] <- 'N'

x$text[1847]
x$intention[1847] <- 'N'

x$text[1848]
x$intention[1848] <- 'N'

x$text[1849]
x$intention[1849] <- 'N'

x$text[1850]
x$intention[1850] <- 'N'

x$text[1851]
x$intention[1851] <- 'N'

x$text[1852]
x$intention[1852] <- 'N'

x$text[1853]
x$intention[1853] <- 'N'

x$text[1854]
x$intention[1854] <- 'N'

x$text[1855]
x$intention[1855] <- 'N'

x$text[1856]
x$intention[1856] <- 'N'

x$text[1857]
x$intention[1857] <- 'N'

x$text[1858]
x$intention[1858] <- 'Y'

x$text[1859]
x$intention[1859] <- 'N'

x$text[1860]
x$intention[1860] <- 'N'

x$text[1861]
x$intention[1861] <- 'N'

x$text[1862]
x$intention[1862] <- 'N'

x$text[1863]
x$intention[1863] <- 'N'

x$text[1864]
x$intention[1864] <- 'N'

x$text[1865]
x$intention[1865] <- 'N'

x$text[1866]
x$intention[1866] <- 'Y'

x$text[1867]
x$intention[1867] <- 'N'

x$text[1868]
x$intention[1868] <- 'N'

x$text[1869]
x$intention[1869] <- 'N'

x$text[1870]
x$intention[1870] <- 'Y'

x$text[1871]
x$intention[1871] <- 'N'

x$text[1872]
x$intention[1872] <- 'Y'

x$text[1873]
x$intention[1873] <- 'Y'

x$text[1874]
x$intention[1874] <- 'N'

x$text[1875]
x$intention[1875] <- 'N'

x$text[1876]
x$intention[1876] <- 'N'

x$text[1877]
x$intention[1877] <- 'N'

x$text[1878]
x$intention[1878] <- 'N'

x$text[1879]
x$intention[1879] <- 'N'

x$text[1880]
x$intention[1880] <- 'N'

x$text[1881]
x$intention[1881] <- 'N'

x$text[1882]
x$intention[1882] <- 'N'

x$text[1883]
x$intention[1883] <- 'N'

x$text[1884]
x$intention[1884] <- 'Y'

x$text[1885]
x$intention[1885] <- 'Y'

x$text[1886]
x$intention[1886] <- 'Y'

x$text[1887]
x$intention[1887] <- 'N'

x$text[1888]
x$intention[1888] <- 'N'

x$text[1889]
x$intention[1889] <- 'N'

x$text[1890]
x$intention[1890] <- 'N'

x$text[1891]
x$intention[1891] <- 'N'

x$text[1892]
x$intention[1892] <- 'N'

x$text[1893]
x$intention[1893] <- 'Y'

x$text[1894]
x$intention[1894] <- 'Y'

x$text[1895]
x$intention[1895] <- 'N'

x$text[1896]
x$intention[1896] <- 'N'

x$text[1897]
x$intention[1897] <- 'N'

x$text[1898]
x$intention[1898] <- 'Y'

x$text[1899]
x$intention[1899] <- 'N'

x$text[1900]
x$intention[1900] <- 'N'

x$text[1901]
x$intention[1901] <- 'N'

x$text[1902]
x$intention[1902] <- 'N'

x$text[1903]
x$intention[1903] <- 'Y'

x$text[1904]
x$intention[1904] <- 'N'

x$text[1905]
x$intention[1905] <- 'N'

x$text[1906]
x$intention[1906] <- 'N'

x$text[1907]
x$intention[1907] <- 'N'

x$text[1908]
x$intention[1908] <- 'N'

x$text[1909]
x$intention[1909] <- 'Y'

x$text[1910]
x$intention[1910] <- 'N'

x$text[1911]
x$intention[1911] <- 'N'

x$text[1912]
x$intention[1912] <- 'N'

x$text[1913]
x$intention[1913] <- 'N'

x$text[1914]
x$intention[1914] <- 'N'

x$text[1915]
x$intention[1915] <- 'N'

x$text[1916]
x$intention[1916] <- 'Y'

x$text[1917]
x$intention[1917] <- 'N'

x$text[1918]
x$intention[1918] <- 'Y'

x$text[1919]
x$intention[1919] <- 'Y'

x$text[1920]
x$intention[1920] <- 'N'

x$text[1921]
x$intention[1921] <- 'N'

x$text[1922]
x$intention[1922] <- 'N'

x$text[1923]
x$intention[1923] <- 'N'

x$text[1924]
x$intention[1924] <- 'N'

x$text[1925]
x$intention[1925] <- 'N'

x$text[1926]
x$intention[1926] <- 'N'

x$text[1927]
x$intention[1927] <- 'N'

x$text[1928]
x$intention[1928] <- 'N'

x$text[1929]
x$intention[1929] <- 'N'

x$text[1930]
x$intention[1930] <- 'Y'

x$text[1931]
x$intention[1931] <- 'N'

x$text[1932]
x$intention[1932] <- 'N'

x$text[1933]
x$intention[1933] <- 'N'

x$text[1934]
x$intention[1934] <- 'N'

x$text[1935]
x$intention[1935] <- 'N'

x$text[1936]
x$intention[1936] <- 'Y'

x$text[1937]
x$intention[1937] <- 'N'

x$text[1938]
x$intention[1938] <- 'N'

x$text[1939]
x$intention[1939] <- 'N'

x$text[1940]
x$intention[1940] <- 'Y'

x$text[1941]
x$intention[1941] <- 'Y'

x$text[1942]
x$intention[1942] <- 'N'

x$text[1943]
x$intention[1943] <- 'N'

x$text[1944]
x$intention[1944] <- 'N'

x$text[1945]
x$intention[1945] <- 'N'

x$text[1946]
x$intention[1946] <- 'N'

x$text[1947]
x$intention[1947] <- 'N'

x$text[1948]
x$intention[1948] <- 'N'

x$text[1949]
x$intention[1949] <- 'N'

x$text[1950]
x$intention[1950] <- 'N'

x$text[1951]
x$intention[1951] <- 'N'

x$text[1952]
x$intention[1952] <- 'Y'

x$text[1953]
x$intention[1953] <- 'N'

x$text[1954]
x$intention[1954] <- 'N'

x$text[1955]
x$intention[1955] <- 'Y'

x$text[1956]
x$intention[1956] <- 'N'

x$text[1957]
x$intention[1957] <- 'N'

x$text[1958]
x$intention[1958] <- 'N'

x$text[1959]
x$intention[1959] <- 'N'

x$text[1960]
x$intention[1960] <- 'N'

x$text[1961]
x$intention[1961] <- 'N'

x$text[1962]
x$intention[1962] <- 'N'

x$text[1963]
x$intention[1963] <- 'N'

x$text[1964]
x$intention[1964] <- 'N'

x$text[1965]
x$intention[1965] <- 'N'

x$text[1966]
x$intention[1966] <- 'Y'

x$text[1967]
x$intention[1967] <- 'N'

x$text[1968]
x$intention[1968] <- 'N'

x$text[1969]
x$intention[1969] <- 'N'

x$text[1970]
x$intention[1970] <- 'N'

x$text[1971]
x$intention[1971] <- 'Y'

x$text[1972]
x$intention[1972] <- 'N'

x$text[1973]
x$intention[1973] <- 'N'

x$text[1974]
x$intention[1974] <- 'N'

x$text[1975]
x$intention[1975] <- 'N'

x$text[1976]
x$intention[1976] <- 'N'

x$text[1977]
x$intention[1977] <- 'N'

x$text[1978]
x$intention[1978] <- 'N'

x$text[1979]
x$intention[1979] <- 'N'

x$text[1980]
x$intention[1980] <- 'Y'

x$text[1981]
x$intention[1981] <- 'N'

x$text[1982]
x$intention[1982] <- 'N'

x$text[1983]
x$intention[1983] <- 'N'

x$text[1984]
x$intention[1984] <- 'N'

x$text[1985]
x$intention[1985] <- 'Y'

x$text[1986]
x$intention[1986] <- 'N'

x$text[1987]
x$intention[1987] <- 'N'

x$text[1988]
x$intention[1988] <- 'N'

x$text[1989]
x$intention[1989] <- 'N'

x$text[1990]
x$intention[1990] <- 'N'

x$text[1991]
x$intention[1991] <- 'N'

x$text[1992]
x$intention[1992] <- 'N'

x$text[1993]
x$intention[1993] <- 'N'

x$text[1994]
x$intention[1994] <- 'N'

x$text[1995]
x$intention[1995] <- 'N'

x$text[1996]
x$intention[1996] <- 'N'

x$text[1997]
x$intention[1997] <- 'N'

x$text[1998]
x$intention[1998] <- 'N'

x$text[1999]
x$intention[1999] <- 'N'

x$text[2000]
x$intention[2000] <- 'N'

x$text[2001]
x$intention[2001] <- 'N'

x$text[2002]
x$intention[2002] <- 'N'

x$text[2003]
x$intention[2003] <- 'N'

x$text[2004]
x$intention[2004] <- 'N'

x$text[2005]
x$intention[2005] <- 'Y'

x$text[2006]
x$intention[2006] <- 'Y'

x$text[2007]
x$intention[2007] <- 'N'

x$text[2008]
x$intention[2008] <- 'N'

x$text[2009]
x$intention[2009] <- 'N'

x$text[2010]
x$intention[2010] <- 'N'

x$text[2011]
x$intention[2011] <- 'N'

x$text[2012]
x$intention[2012] <- 'N'

x$text[2013]
x$intention[2013] <- 'N'

x$text[2014]
x$intention[2014] <- 'N'

x$text[2015]
x$intention[2015] <- 'N'

x$text[2016]
x$intention[2016] <- 'N'

x$text[2017]
x$intention[2017] <- 'N'

x$text[2018]
x$intention[2018] <- 'N'

x$text[2019]
x$intention[2019] <- 'N'

x$text[2020]
x$intention[2020] <- 'N'

x$text[2021]
x$intention[2021] <- 'N'

x$text[2022]
x$intention[2022] <- 'N'

x$text[2023]
x$intention[2023] <- 'N'

x$text[2024]
x$intention[2024] <- 'N'

x$text[2025]
x$intention[2025] <- 'N'

x$text[2026]
x$intention[2026] <- 'N'

x$text[2027]
x$intention[2027] <- 'N'

x$text[2028]
x$intention[2028] <- 'N'

x$text[2029]
x$intention[2029] <- 'N'

x$text[2030]
x$intention[2030] <- 'N'

x$text[2031]
x$intention[2031] <- 'Y'

x$text[2032]
x$intention[2032] <- 'N'

x$text[2033]
x$intention[2033] <- 'N'

x$text[2034]
x$intention[2034] <- 'N'

x$text[2035]
x$intention[2035] <- 'N'

x$text[2036]
x$intention[2036] <- 'N'

x$text[2037]
x$intention[2037] <- 'N'

x$text[2038]
x$intention[2038] <- 'N'

x$text[2039]
x$intention[2039] <- 'N'

x$text[2040]
x$intention[2040] <- 'N'

x$text[2041]
x$intention[2041] <- 'N'

x$text[2042]
x$intention[2042] <- 'N'

x$text[2043]
x$intention[2043] <- 'N'

x$text[2044]
x$intention[2044] <- 'N'

x$text[2045]
x$intention[2045] <- 'N'

x$text[2046]
x$intention[2046] <- 'N'

x$text[2047]
x$intention[2047] <- 'N'

x$text[2048]
x$intention[2048] <- 'N'

x$text[2049]
x$intention[2049] <- 'Y'

x$text[2050]
x$intention[2050] <- 'Y'

x$text[2051]
x$intention[2051] <- 'N'

x$text[2052]
x$intention[2052] <- 'N'

x$text[2053]
x$intention[2053] <- 'N'

x$text[2054]
x$intention[2054] <- 'N'

x$text[2055]
x$intention[2055] <- 'N'

x$text[2056]
x$intention[2056] <- 'N'

x$text[2057]
x$intention[2057] <- 'N'

x$text[2058]
x$intention[2058] <- 'N'

x$text[2059]
x$intention[2059] <- 'N'

x$text[2060]
x$intention[2060] <- 'N'

x$text[2061]
x$intention[2061] <- 'N'

x$text[2062]
x$intention[2062] <- 'N'

x$text[2063]
x$intention[2063] <- 'Y'

x$text[2064]
x$intention[2064] <- 'N'

x$text[2065]
x$intention[2065] <- 'N'

x$text[2066]
x$intention[2066] <- 'N'

x$text[2067]
x$intention[2067] <- 'N'

x$text[2068]
x$intention[2068] <- 'N'

x$text[2069]
x$intention[2069] <- 'N'

x$text[2070]
x$intention[2070] <- 'N'

x$text[2071]
x$intention[2071] <- 'N'

x$text[2072]
x$intention[2072] <- 'N'

x$text[2073]
x$intention[2073] <- 'N'

x$text[2074]
x$intention[2074] <- 'N'

x$text[2075]
x$intention[2075] <- 'N'

x$text[2076]
x$intention[2076] <- 'N'

x$text[2077]
x$intention[2077] <- 'N'

x$text[2078]
x$intention[2078] <- 'N'

x$text[2079]
x$intention[2079] <- 'N'

x$text[2080]
x$intention[2080] <- 'N'

x$text[2081]
x$intention[2081] <- 'N'

x$text[2082]
x$intention[2082] <- 'N'

x$text[2083]
x$intention[2083] <- 'N'

x$text[2084]
x$intention[2084] <- 'N'

x$text[2085]
x$intention[2085] <- 'N'

x$text[2086]
x$intention[2086] <- 'Y'

x$text[2087]
x$intention[2087] <- 'N'

x$text[2088]
x$intention[2088] <- 'N'

x$text[2089]
x$intention[2089] <- 'N'

x$text[2090]
x$intention[2090] <- 'Y'

x$text[2091]
x$intention[2091] <- 'N'

x$text[2092]
x$intention[2092] <- 'N'

x$text[2093]
x$intention[2093] <- 'N'

x$text[2094]
x$intention[2094] <- 'N'

x$text[2095]
x$intention[2095] <- 'N'

x$text[2096]
x$intention[2096] <- 'N'

x$text[2097]
x$intention[2097] <- 'N'

x$text[2098]
x$intention[2098] <- 'N'

x$text[2099]
x$intention[2099] <- 'N'

x$text[2100]
x$intention[2100] <- 'N'

x$text[2101]
x$intention[2101] <- 'N'

x$text[2102]
x$intention[2102] <- 'N'

x$text[2103]
x$intention[2103] <- 'N'

x$text[2104]
x$intention[2104] <- 'N'

x$text[2105]
x$intention[2105] <- 'N'

x$text[2106]
x$intention[2106] <- 'N'

x$text[2107]
x$intention[2107] <- 'N'

x$text[2108]
x$intention[2108] <- 'N'

x$text[2109]
x$intention[2109] <- 'N'

x$text[2110]
x$intention[2110] <- 'N'

x$text[2111]
x$intention[2111] <- 'N'

x$text[2112]
x$intention[2112] <- 'N'

x$text[2113]
x$intention[2113] <- 'N'

x$text[2114]
x$intention[2114] <- 'N'

x$text[2115]
x$intention[2115] <- 'N'

x$text[2116]
x$intention[2116] <- 'N'

x$text[2117]
x$intention[2117] <- 'Y'

x$text[2118]
x$intention[2118] <- 'N'

x$text[2119]
x$intention[2119] <- 'N'

x$text[2120]
x$intention[2120] <- 'N'

x$text[2121]
x$intention[2121] <- 'N'

x$text[2122]
x$intention[2122] <- 'N'

x$text[2123]
x$intention[2123] <- 'N'

x$text[2124]
x$intention[2124] <- 'N'

x$text[2125]
x$intention[2125] <- 'N'

x$text[2126]
x$intention[2126] <- 'Y'

x$text[2127]
x$intention[2127] <- 'N'

x$text[2128]
x$intention[2128] <- 'N'

x$text[2129]
x$intention[2129] <- 'N'

x$text[2130]
x$intention[2130] <- 'N'

x$text[2131]
x$intention[2131] <- 'N'

x$text[2132]
x$intention[2132] <- 'N'

x$text[2133]
x$intention[2133] <- 'N'

x$text[2134]
x$intention[2134] <- 'N'

x$text[2135]
x$intention[2135] <- 'N'

x$text[2136]
x$intention[2136] <- 'N'

x$text[2137]
x$intention[2137] <- 'N'


#SALVO DATASET ETICHETTATO-----
write.csv(x,file ="test_etichettato_R.csv")













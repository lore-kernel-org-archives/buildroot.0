From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Sep 2014 15:13:44 +0200
Subject: [Buildroot] [PATCH 2/2] docs: improve look of sponsors page
In-Reply-To: <1411218824-31293-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1411218824-31293-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1411218824-31293-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

This commit completely reworks the Sponsors page, to improve its look,
put the current sponsor in a clearly visible way, and add the logo of
all sponsors.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/css/buildroot.css                |  23 +++++
 docs/images/boundary-devices-logo.png | Bin 0 -> 13305 bytes
 docs/images/calao-logo.png            | Bin 0 -> 15386 bytes
 docs/images/circuitco-logo.png        | Bin 0 -> 10750 bytes
 docs/images/fluendo-logo.png          | Bin 0 -> 9098 bytes
 docs/images/free-electrons-logo.png   | Bin 0 -> 9968 bytes
 docs/images/google-logo.png           | Bin 0 -> 12005 bytes
 docs/images/imgtec-logo.png           | Bin 0 -> 5276 bytes
 docs/images/mind-logo.png             | Bin 0 -> 10214 bytes
 docs/images/synopsys-logo.png         | Bin 0 -> 52426 bytes
 docs/sponsors.html                    | 169 +++++++++++++++++++++++++++-------
 11 files changed, 157 insertions(+), 35 deletions(-)
 create mode 100644 docs/images/boundary-devices-logo.png
 create mode 100644 docs/images/calao-logo.png
 create mode 100644 docs/images/circuitco-logo.png
 create mode 100644 docs/images/fluendo-logo.png
 create mode 100644 docs/images/free-electrons-logo.png
 create mode 100644 docs/images/google-logo.png
 create mode 100644 docs/images/imgtec-logo.png
 create mode 100644 docs/images/mind-logo.png
 create mode 100644 docs/images/synopsys-logo.png

diff --git a/docs/css/buildroot.css b/docs/css/buildroot.css
index 95e6e94..16e6269 100644
--- a/docs/css/buildroot.css
+++ b/docs/css/buildroot.css
@@ -11,3 +11,26 @@ body {
     float:right;
     margin: 10px 0 0;
 }
+
+div.sponsor-main {
+    background: #eeeeee;
+    padding: 2em;
+}
+
+div.sponsor {
+    background: #eeeeee;
+    padding: 0.5em;
+    height: 12em;
+    display: table !important;
+}
+
+div.sponsor-description {
+    display: table-cell;
+    vertical-align: middle;
+    text-align: center;
+}
+
+div.sponsor-description img {
+    height: 4em;
+    margin-bottom: 1em;
+}
diff --git a/docs/images/boundary-devices-logo.png b/docs/images/boundary-devices-logo.png
new file mode 100644
index 0000000000000000000000000000000000000000..35d7a93197183b1c0654454b9410bc4d360ef29e
GIT binary patch
literal 13305
zcmV<VGX~6wP)<h;3K|Lk000e1NJLTq0089x002k`0ssI2hAE|S00009a7bBm000ie
z000ie0hKEb8vp<R2XskIMF-vq6bvZ~>;=j}0000PbVXQnLvL+uWo~o;Lvm$dbY)~9
zcWHEJAV*0}P*;Ht7XSbt07*naRCwCmeRp_ORo4F6=bYP1dVw at TAfYDoP?bJ_fS`id
z7<(W6ETewT=%}OP&o(mZSVl$BLD5k`6a^vl009CiKp+VL((6rf`@N^^-yi3ebIv`t
zB|*RMJ5L^-%c;A(d+oK}wf5QwCf@=w2Zj(w$cs_k6zzc`elNNVU&jMo$UZedKdX%f
zt{>24_(+&1sW5$ke;Zu(|6{*uv3|Wz<1pQf!@>X$1hTN;UljB@>Q5a}FudZ(8XFI|
zpuj;|RdgO>6tV=u_n=<|sgkdt;05y+8zBf+$o@&?C~=HJJc#=GX(V$64e(&61{|iL
z+uhS!7-PN*#c;%OosEOHrQ|B#J_s)Rfx}4yX|XX5T}MC&^R0mpglj+?1;m4Z35Nh@
zpJgKs`XSV}Hb!!I#eD=Q5*G$bS`cFt05vRp1mj4?H3|R$y39&y|CKBpS#?AweSr4<
zkZnC4*0PXA(b*g*oOtcC+JM7+1@&tHP|?Cv@=;!L_=F{vgQgE;=yIauS5YI;WhiIR
zXMIiQZ%mARgBJ7H<tHeFqSPqDP2y7NhWjdU`>!O39-tzrBNA3bFoO%FspRIqO2OaI
zO!}3J7X|c@>@>wo3bDT7xzj6#p>GO<yfuaUq2TsYN$@{Fg;A0)2H`jk_zH?t*yBD}
z6!^EB@&5-vKPYDuzRkUz<(u~+5WwLS2GlpW4X^;Bg25EY%|VeUvcZdp`_i8n|L+2^
zZ1J!cE`8;Uq)m<@Kn)i5qi<FW30%SX0QgGPyQsu%5T!PH#enjc5 at Q*w2tcn at O&*nf
z)r at hIM-5GkHIgL4mvho438KBL`~KH9R8%+Mfz}RxGgC~UM1^}EMbMR44AwA4J`#`r
z5WvM at hanDxTC}*s{edjygQ<+XBw%KK?w@X3K5N1VhGA%$W?A;~3MY&Sf{2gF$ViH>
zsBS<5A=`d6Av!P?SU`99uoe7;Sni7m0Msf)LX3eV5XZk3p<avKY;y=zULkfNyuu)>
zCq%2-;*k1A#QK1+IY<(%T{83ahi{}v)YaAHa=9?Z9LI4SclmHY5Clb0dSfiZv7u)c
z1x2WpDg{MSBuP<-KqP;jVHua3wmWGTP5)MW*1%5#fioIH5nuue#|+!>{Jk2Ll4Usn
zAW7nH>$kkM=@%?{p+x)#86H>`U$}3oZ6A#=Dwwobv!L*uCvLUdZEc<12qBK+TrL+c
zUkQR3cmyECFpO5KB}p>$?4(vIZd^PgH)~LW(O}T34LXfRrBo<96|p;9J!WfjSNECo
zO()M?sH|ylGtB=6CIR&q!D3o~KeTE^W@@7FmRN%xAt_u@;L8yTMk3(wG7|R@vJpH=
zAwLiAuf*t~X)oTl+TpO9OeTdw;cz&tR;xy%NlZ-CYPAZ5qW^Lf37U=nVYfTXW;4cN
zrX!<H{mzqjs8!+1(A?4e{oZ3AZQgzI?8WF|g!%=xK2kRQ1u+uKNQPw{PPay_^qr;|
z2CxVhDD-#;0$d0qYooQsP=rlK0bnF{9T5b&=bE{RvHG^QHj*T*R;%4^PfJTnNlBq7
zYCwdK)9GYcmiIjp1ff=|0e~batJNB$HT<I*W9YTo)vB1VUm2Vfci*aovnP&v=+#e)
zj#l<vK!zpaLR<}IXrcZHX%wLVMi`->nu9zih63U@!YT>Ka}$yikT@)d5tT(i_`dDC
zedyq%>laM5*=!ug(KPLFII^>|)6&ug3alK*b#-;Mw6wIfwKX?4H#avsolXE?7~01e
zf`>!H0j_w at 8zTSQ$f4=)Jazl<%+!II+fhhjFYpqQRK)v-z5in0?|{2P6)1|kBdek3
z4@azlU@7H>r5B=`(;~W!3M|mnu{j2vroG*QF}7N*DJdyQNl62%swO5TvMkGSTzh*v
zNs_#Rfid8~4wsVS7(fcv{U at qE{eDlk*+x-hQoLc-_)#}3njyR)Z^+<P^QXP~+4oGu
z{00ivO(BB8MBx-jbOy`SNct?67tct}wH>j%l)uv>5K(mGM}Vvii1G<gYNOL=!<T{z
z?2{2$X)Md~1eQvrN=Zo>aMMbqQUQR?W at A}4At8acu>#r~3wxSpTx7>!dG*Clx9;`*
zchk?sW#=xu^6<^Vd!`rU#_F}5-IgdsDhi2REZ~iVg~tF05W;-#`I{cg4F?o9vJgwZ
z$d805up7>36QdUSM-P%2y&j?A2^ztnK8>Q+Xu~VARG^&KX;c_vj4{iy27`ge)_ at -@
z%bH9krBbQa>t*Ev!hWHHkZ{(LR#-t26iF~F$G at Q0V*m1|gLhvuKPMwqU>9pu3Po_t
zgF;EA#>W};8UQd`9c`u_mzxn{7YW=-LOAgf5D5Y8ZFVFSNkaI_O(ep8%1lj+(d(RU
zcVnB$;dYC0jO9laKuUr!DbC1o(B9qC*<%d?TrR+B@-(qltxSwH7<6ickj>$4H}zT_
zE(x4PzzyQ&jWy`fljB{q`$AJE!*bDUv?#<0N>2WHbVP)ZR;#^Ce2>j$v)k>dsi`DM
z0>&5uJeJ;OK+>QNE|42X2qEw*{Vv*VbvT9hboE+YZZ`@5ih?2v$L6hGIBnMWQRyiO
zDy0GdTyDCtt!rQD=}p at Y9Xnmiu&hKn3`&Um$CJ0~)GD5b*J)JW6&?9_bCJ_cd+Zzx
zSI?gK$j!?vcBhBWCWt5h@$ZV7dj2Id3i4jKe~sPY1OUBOy=ljxkG2#kDeCsC=Ul&V
z`pBW_YLyaW+|b&&d3VYC-|lK`>*8awL>?v#09dP5t(Y@;?b0g?a<lYWH30NjY=_IM
zU;AvU)9q$h79c2>qM*pJ!!s7o7(aFF at DW1>#~E~d3$Ps5(QQ6<>iotX#XFBwx at ktz
zIlr5h|J1F^tacXw#OO8eeOvV9j>B;V-Q%|`S+j6jN_<RZZNr@}eza!cv}t39Io%#E
zoFs|YKHs+cc$M%~!!wc}yJ<=G;3PNA002c%7Mo-B)Bg;uzv93#L=eQ~pjrWdVHlIi
zq*AGP;mXO+RoJHn_&6`wfyrXba;$J-9y2U+WOlmno_(dKO=hcPVjG&C^2|M}ZdyEx
zBnin36Cb0`&&|5~+65nex9k6{-`w2MjeYtvfL^P*diErRzyPgnXr)LJfJO-TVDy~y
z)GH>A62A70&wt=eX at ns;K4#A3(Y{Mnb&W#@C%y65txK<%C@~gC4ozP?bHc69zEfG-
zfRHaB0P&C=o{{?6BeyKSa+0L{*DaVjtswVsd9~f?;z1m!E9*4s=kHzh$W2RRIRv9l
zlarpZX3_M|e%SxiKR2~@_6Pxznh-l%P`h16Psi%DU%vFf@22JZ9`Ee20KmK{qlK?+
z>Fn8ayh<pKCymU$Y0-3HAuDSeLh}Q^b`+o6?M4XsHCG%?0Sl-67_=&bMir~qrl%yV
zSv37$&)ln2_`!6f{M_cEqY{=pKR5H+H~zSG>6H?&3J;Z1@!*=ppTGFf(DY=4{GuLX
z>~zs$^@j6 at S|h+10$p^%Gd71qcxlYA%r9Sl<f>T{WQ#F=ME0AH-!>>Q4s-r!LI6B0
zJ>}CE9*}_5ccdl9U$<ata(s*|SOEZI&Y)GJaIUho%dYsxV{3U$DOmZ{O6v88ZxBM0
zA_=G4{Yy!O)h?Ro=1v-=*Q$gaJa$;75UecAt^Z-aRPDh6{#7&ubAa(>hp$?#&dkj8
zto^{eKteJ^kRZ}FM5E4|GDiQz9W2Wkb(&E*86$`KC9Bg#S5#ko<n>Q3Hn$1&_dyA9
zZ$EWser}fVJv|m%b6Xc8h#`ZMg&g~wDPvxF=;k|~`=`a%^s+64{kmEZ%NzSD!Z0E<
z&zvwabc@ZMGG@t)@t<zp&0!B=u2CzWz3aMZ`MFYV+eO=*t~jGEI1mx9P1~LBBb7CG
zT{DjtdmY`qJr+B|vI#MU?6hQ~&JWO43#M+_cYM>1L%x_>niiFR<($ds$?=rmHwj7w
zrPHX&tLyiaRxO(~UNDN{CXUG7d!mZhX|!tP$RUG;uj;iqel9K#rrA<{O%VrYRR;PH
zsu`HWBA!Lq${dziPZ-b(c|+3jhNK04#o=^+x^?#xf8Su|Wg+r?9d5s7?#%Hbh at 7dd
ze|i0Phsw{9B(dy at Nl)CiG9@9_clFu@)3)p>*|g)Jm-&^mV|a56M>52Kw+<zT#pc*`
zq at t#wB{eZ_;nafE#8~0gWwR&!XXjyy&A}_Nb0?3!amg&n8 at 3-jxvls_hslyRWbpOB
zn?7o2dLUE*utx(!P+4<n`=RohOU*wXIC<)PL%Ye$a$I7pVa1%u&)#)ydP=<S!Rr at H
z+g at DWZLxX$WUR=`Jwkvvi_PJpnQn_+rJ!1DJ-bRyEt;0Epgd3}31a!I@q173DlE=P
zOO{aMJ4;TTZ|Vp}5KsaG=C_IM_YvisNVH?W5iRC!P{hS#InJopEtxfG>%ODBF3%sS
z at o^8XSt7i%qucz4S3cT%{51dHbsK-Q+MORfd!O*0TbIxM=|E|Z)eb^bMowOOrxNc^
z=^JQ<`P189y!W3SybZT@>6QO{`Yx^7PtHspl at p`am~D0hpj9hZ&MhPe(YHSPao<C)
ztT$U7e536+T(;qb2lK?zOT_JCbh@tT#{XW|V--#AojsP1Ht!yunfk}I%X}wijLS=k
zH~8=>>#^zTwSKnkz|qsSb|+0UOjoZJ18gfkdDqH0V{+1cZ07vJF-nT!<2rIPQ-`IC
z2-A(*i&@dzMVv16tI1T~VYRz@t#%*~i?L3rh&5;d1IGmhh2tRncci7&Yt=U`nRUaW
znIHUT$DjZCMUS_wCygF1(dstuE-5ZMCp@!dcgX{5mIxJw8RJK$rzG}R>t)A`I5^a+
z9t5Q)Q6OH6N-F>L-7h}Z-M70AtzIyFu|T6uiZjL<bPa7?fFU8qFnf~7j%jK)z4YNX
z79a939IdQ<=c}LJe)0}!IR!$&;dD8i2mmx{#iY?WBZs7=r^Lq@^cuBl)KJlsl at Ozk
zH|Ts5V4#c9<z^mxbK`~|_k&<{BmkUmY(H@FtPigMkTocAOiucVvljuun4EN#k`mOS
z`(Rm32#u5qZrVs)peBpG-DK&t*{u#2UuTU<nU)lnJvcE6X^QbzJ4-(N<VVnJShIQV
z75Ohe_Im;mEEl<7QF_mT(leWO9HePRuhpa`#!elZdxfAc2?E`B{h}U=?WK>tak$(B
zg2Mdak~b8esG`MTTvofIsH9woSG7u!mz{R%eEmSoMKVzZ2Tq*f1aEb^nPaDGgm|SW
zQmLSLrDIT1Y<60*@bO;`l{K}SyvnWT^);888I~2Qm4V(1gHC<h)w7q(n2<MQP<nDg
zNb6GxAQQdCA6xgAe)01`Sy$T+2TrV-Uziwc;Lm7O%0<)iPn^9NtJf6_&lCxcy~p|R
z+z9-!A-mzlPquxx?V#P|cGHa8OQcg2q1R~>lVWC19{Gps7bbZN6#8gr?JOy+0;3Mv
zT9Q-s00<$3F^8jZ%1HcM?|;4B$M6kGh`nb1v{xVfy^wEu=%%ZF+;{XyWeq`)>B$Kq
zvVvw>yG)YzI^A?*Tc_kh$#F&m!R=8Tv at ZjjHxRIHn!%i(%x76vVp)5>i!lHs#Tq5%
zR82#R%jHH$$XEl$m|-|EUPY7axV)^_AGu}b_>n?7CA1qC$rCzo;N)3`<;1=@PiyQs
zUUl-^r3Hm!e5CLEDWm`P$=39gIEfVhYG(;6qiV>kH^iY4TT$CkUS16vHIN7}0B<f3
z2v9fFH6A{4`un2eA3uN3q>)3yR$HZ1fKi9^D%=ZduNjUb#3ld=^lwolNg$TPJR8#3
zZhHSeJ95%f9=vg>fRa?to}7RD^m&XqwMr=gio{y?niSH8BSle=5s#;c-PA!;2nlK8
zsd6CPxd62q1&t5 at 0GyXK=wHv=J89HVsT$g2>F74=H0q4hgkaM`pa$=9)AI8vLM}JG
z<8b-Rak(0A%MZ^?9h?-C6l)MFuN5^7RTrDWSn7NLQP^MvwUPpz1~e*Asgy=tLRwNn
zT9VqJ1A+jJiqR-5PFCOhxApBNOC&u57=z0Kv_sH(Vr4*JnuOH{5Fm+P!%Z{0N-89`
zjm#dbQc)OVr^_uouT`srW{tOuSQp@kwmO`_3Pt!FY(bQ6QN1F=bO>gY4hTZmYt<xy
z5CZ<s`vw9bIqMdKMy<T_ngtTD{;==()sMV7;l?Lt-SO-b|JWGScq0kI=O7lY_~+e{
z-xM8fYVQ{C<?8AA!-ot?6sjNJ7L|ll1~3To5g`<GNvf!0T<*J8&3*3f6)cN8y3Omp
z*zxJ+JuFE=oT2o@xg)1)mtQeHTpu7{-C*wl%<>Y2r(k)(<@*s<#)Lj7QaZsYl}eHz
zISh?$9b$3~We!e~&}JHyYG}GN(5Jqo0|!~PniywPDkyNcgi;@Z;}^-Kw}~**4(3gG
z329w0e277->9N^`G9gB<;r*+D=HcL^xU0pEhAn%J-Tl`Oc&8Kqvf3S?X11U{9vOxN
z16*qD+E;pJSVoFh{3(~snkXb~I1cYTdYWdqaPpP&3U|ymS@;AC2{HP_7(+_DaZFD7
zv-hl=Iwl9qHXsRLxcb&E3EFH9S6yRAad}N~S<R)EE~lGTC`hn%Va5r7y)$4$GCtVB
zVV2`qVGyTYt6DsBoaDAk&FwBX4S)}qpObnV3iD$PI-wq#mK;BST7l&8+WJ=hD$TNX
zr%UWD8<G at n^usq+f5pVneNYPg0$6TIt#7EdbeQTI+k}^v%$hK6#1NtU)+njDQ^v@R
z8H50*#>Wm56Q4iqKkfx90O0r-eI%2cj1KRUtYUC)+<wT^YxQ~)$R#rht`hXo-qNb`
zP3_^uke}cb#EV33o~soK0ug`^a2NmvC&dW|{mJV3w>E71{$P2x*$M<oiZ$G{Y&J<-
zz}*cBJ#Z|>UVlv}D<&Mz%3_~3p;0T7;taPeoqNYM3nhBgp|UDo$2xkd=3-O(5P^NY
zV$RfU`;Kq?X&>*lG3wQKUArJVO(b7`I#AlxYv#Y=bh{f`I)n~|q3NmjuU`DdXIsrS
zyFsV9W5t4{0d7(xqDy532^X&Jo-^GR+wP;MgaK$OrQ*#$-hTf}A5>jvq#4$z)84pb
z)}1RC1k7&)?=4UV$lZ*TL?75PQWMrJoE{a&j77YjOx)|9(yB8Tnr4p6<EPm~v30(A
z@A39-GlYX61)fkh3=k1q5g>-;Tr}fm*mjfo)2;hU&RhVE3Oc$+Od2(HY>w~FLlw2R
zJn>fD=?jn$0|bD>)zNEP_wHAEg$Yz7a4fG6Aix*{<~U9eOpQVzReFBPm|=gsb*01U
zR;v_)lHz8J8#!_GFv&f8j-4t#d4_-1)N6k0iy!~~$J>P}!JALqk&}_S`)GxNq^?~s
z?apgOa5wc at H*77kc at 1{6)qc4A+ at vugUhKgemrfazTie(=EIoBffSXiYDb$y7DWcn)
zTXr8_yX;Egbf2G_we_v1ca at ZP^;kydWJ;oKe7-#%uwA`YyVE69-0!(|ep833vgT5p
zL3igh^B2z?AE?tuTv#mB+kB+Tmpcwk8#_FZGVAKK9w<8(2{}Z0;)y`4B!`%MmDJA%
z%X@k(HoNOoU1RB~^8iS#RTYjM_u^wW4feVan>u?QdgZgastb^j3{E$&TvkRZNl|sD
zj#=BAz!>9EUU_X5V-91PRW6bB;pDNolgH+UxZy%m+p}+PH1%5fiG*RePq*w^IK5!e
z41X|`QLlaau2oOnah=3z1ON=fKKI at iC#o*^*)Es+rvs(;UB8$TE2&fRbA?E?Ih;C;
zKaztYLM{D85!Tlmu6po9)xWpxzhmV*;l=nE{py9HwH1=}hQ2afYHi<h?6fe#W>8Yx
zhtJ$&wmE_Y!GsOg3!6RitDQ%lzHLQXa-8J+mc6BQeq|t(kB|WD395{g{-ns0<<;-L
zzj?#wKb4lA1(gB_B1W%$=+5Oc3q10MVY$sk$4ZOKAvF<PZVKavZdv@<s}KGAl?NZZ
zc at d$YfMdOC7Kb^EeW?wE?s*Ks7Am1=RNcd6XYYLWts at m@g(rKh_WS?(e$kQgfG&}~
z+TnD+ at cx${f4h at k%Z|K%#bs5W|FAp6cQ<a^x1;!^*x;iEX0;UnU~F|bU;NkC2TIR`
zxa;d*iZ|~rk&=l3fT6qB_Rmc}`Fwu<ajVntVC7jY at w1e0nhhLpA+mVzSG#&`oA(}*
zJm_ at M+ltF9HfJQwLin}gNON;wP%6Qo0gW114s1?PkUe(i-_~vVVDmm7@ALh>6QCf0
zAi!c at HgC$S53jkRVA!-VLtlU9 at o7^hgV*-N7&yTpr?|^7M{!1dBs1pjl8Pt)zTuXq
z-}D6r2mx2$(((I0t$X3UO&5c!`9(*{Z+rG1FMarp(@i76k}V8ib2$I}&KF<(d?4^C
zr;C35)6M_&%7 at MET@sh3kGND&QuR@*R(W#~dFrka^TY@tg?J{dZ|S)0nYTA=-7Ty9
zfAanA$6w!2Ti+~lc_bJSfq1y>JY4=?udZ)w>k52!=aGur{_?J19XtR)YC^29PlVX@
zp9!+qO_&dK{novbRdk0dYYs}4fl&Tfu~R0Tm_=@8>AXodFP?6;IxaM{eY3Nqx~|E^
zaiwSKs$TeTP`q*ZmE&D*x~8EGG%BEJP%4(so~Tk#EXUF`t5&OK7EUPMQw#==qlCj8
zV2%q%WBIURu{j=n^`rEZ#DrL*L9f-S6 at 1^*3~jSJJ9{jh-MtO1T^E|#E;O|@c{@W^
zZEWrAe&PL1TlXHFT97wkL{3gdie9T>Ij-GguB^FGdb;-LshZ|?6AD60wRLvi|I&Lu
z>^nNIFn>gLhFYcQw%E(6&hI*0zOVF@%S~_Hd$g;^!g4GCkOWzF_JYsIudQ!-_MI>M
z<RwY$I$Xwaq6K0*50?P~PT;n<)FO4cU1)B5=;e>M>^?es(&+r$Au)Qb)$Tl1Tfh5Q
z<?f@WdabryC6yco-f4sol%2hZy{oS|fX{y1fA(VYl35d`jv1a9XLP#UwT*3u%Fb;+
zR94^GNi)o$^0R!Y2m)19U-EtTOkLBn?|qH2XNe(65(iJ73*oKxb-|E9NfOz-WnXDW
zw>iQTti1jj4dcSH1;aB|&zsE8`>PjCec;9Q#YfLToYCHGe(m2sEty%sVQ{!;KnNI4
zq0#Wn2u-s9n8Vm;Gyp;HG(YcnL;#$}$oG-tSQf1O1pUE(c2FdtR4SATk|Zczt>QRf
zSjOpcyWETfok*x+1T;q3+4E&*&+D~nqh3pqB*x%yxqHl3hGoO1+Uc>_H~oBI+rDE)
zgN`Cemzy^AT3j^4-?qD?V$ab^-q9=}?i*UWUi$EBq3px~>n)E|R+m&(hh=T74#(EL
zM}IkdGTx|HC=_mn=`mX!-f;5bvZ_PnRe~&U2zw#LfAQGq+T&;HlH-jkg at VPb+3GM`
zo%{!P94Y_hNVzv7vIu5%O>HlJ^qsG)5uzwJYtYLNt`XW>$Io2&Zuhas;Yansm+13e
zQY29 at EaU3=g~cb%ftvxnuB^Jg&D2X0ghvrXh{2r0P4m_z$6>(O;c@{YJ%0e0<1m1{
zy%l_{(JV(hTy}>9OgIqV5n7T~yHnz?m$XR0+GW3uYOy=b-gR0MlfgG>gbt6uST36y
z3iOf(t%1`;H+OV{oOX`|30?d_2>g;a{(l_T+S!AIOOUaYqrtufO0sE$aCjSR*7&@)
z9$%Z6HAvvXWj1Wv*Vt|f$Pj}=><<G-w74_ERAK`9ljFd%UJzIg(+sQBP_cS#E6ajL
zgF8DaD=M#_H<2PK1~VAr)72M2p#*{eL|`BUUM-PIfCAK5F$$&o#sqF7gQ912QSdWZ
zyu2HMC@n4$MC=Am5Gc4E9ej5lBq!1%SjZoAM#e!CAMy(hu;`P>pQ8%Pjl at Wcq*f`$
z=Vjft?8<BAPLcQ^_LQDk|NXwGSY9eB$;!WnAQ8u5447uv({;^X|5OYd28sfkBReN8
zCEmzlJRvvhY*{rJ0o<nbpZ<I1_`EBoP6U9Wy@&P`9|x at t5D5gyVa#$YfsoV<i-Ywm
z?uU=IpC-8slrai+6M~SPEEU5cE)L9A0s+qkgS9t72j(-AAh`)EngKImMD~W~@68Et
zZl7;#d*Q?HJWD?!u2j@1hOmM>R8jlRS36y9rlz6w$Ae`pEnT43f|~(1efQN at s+9_a
z&~*z7zy4t#)76YrsHMH<rawG0|B6Bap>4YlSxjco>46}Dq?|6=>2&KfDxS~6L9=Q5
zfuSHtwMwB>P)dp<2oeKu9P4y5PN$o9UkL>>3Te7UqIgI|xJIp1P?XuT%0MO!wfE&X
za6N=%JDmtH5HKr8m at XwuSflhdes)A4NQH$!w7(Ay>dOjSp4x_%=8kR&Ufa5Q|MI~%
zM=EQh;d7(GE5~8rFkp<8)ZRmtdy9^HYNl2KNr1&pVD9?s=H0n+4sS5cFC2Z#@@b#E
z^D#E+KyNge9ba$y5f}y(%J{4_v)#qGXyCx*pq(_W)hGkODu^o<onL&##OvnINJ~jb
zPfpNk)Chsa>bTI{R#|;%Z)ruv*^ABXrpO$1(O8)P0ASFm|9sC4gOXxjS^v%Hng$e%
z at JAqyyF(}-vl)(bM~8rvCj$#vuT~&RHH2|E6$XXNc;x?jyUBdMv3=I~5x$Gnms+0v
z;G3^@mPDmj2=E$#oOjU-SnWX5fCxVQgJ(P<6r)yU4@p?MXxh`aE%i}`294^)hi@`>
zn|}UjkKJqsgh8POEj4yj&ZBqT at Wg8$cht8411t|ykIx{G6TpGZwrIx0o0iUI815Bs
zi~s-=XGugsRQBwJ#$Kx(W2{jr3-YpmH)F!%x2 at b?dg`_H-~N2y1ca6dkxl-R`^SwK
z`q-^20HCF#=ZU|65^TE1a?}I at Bs*H<cP|?#1qMZW4-zM-#2{xk^tF5yH69|YvCXu%
z^voL@x0P2n^sP=*g!Q_9{^SI`+TwIOoiuMKQVK<!PMwh&pPM<TaLmx`!AU|3jA7`(
z$%&u8`SixQQ+Mt^X0ccZf*6}O^v31$axzjITf0m>7AMP%$Q(ow$mOEt9Dp*z9AV&>
zDD62`amO=nIh-yIK&Mfsr^FYI&0GDuSyxOPGcIrFBd>n+>6W6<gr4kXccJe;-`KWg
z_mNnGZs*~X!cLS-@yMH`NQ?>@*@(mKx6?0$6@^t{#pOi)89@|Z3L*FYh~PL_R{hzw
z11+6BJ4;R#9X*Ajbx}(Bfd~q+dj6Ev^QQm+&3K4XiX;QQmjJ+L;lvo*?RK?NdFOSD
zf4^+5&EY@@j5;mDay at 3tAMdyZApj1$+_c4RchZd9nhkLq`zI^}0Hz)*KkoxTkJ;AT
z)^)U^W=qlGS0256^`e=tJ$Cz<^YzCnYeIBaFm#5{dYjt1ZhrE0ty*d7wS`cNk+-xM
zMZFWnfEtM5R08A~MWM144n(m^tLkol{(YA7jBVVH0T;Es6&Qvr0jry)`FH??5W{ht
z(}_7wtx|9t?(VfP97iD3Yq5G_v^kFBFan5nX9R^prWg&aU4MA_gHbsdV}@rveb?%h
z54|M0Aul_9SVjs#5_Ju2r)%qd=Tj163_7i;$I@-KNa9X4YGqnVg3C>}c62iwYt-uy
zfLf)H<aYsp)Wn$FAsKN7ox|<A)ZAIu*y0v1v&qRw$<0brP~@eS&hm2?WT~GCBXd&X
zV=NBm+4GH!?OpJH;=mZV0UC=`pzIGkIyyQ4ATcp9*a{7s&8AkX`Q$<hg@R!iL=ZNc
zt+lmPqtV1CBmf4MWjKrxfX!yp>2w}+5(GsMvdn;VphZThbak8G*s%GN7yoPg$ehu`
zGJT-T9WwaO_gp`H+{m<)1ORAi>pE0c_1wE()HSpLz>2xk{&3^c<_^>9$6o0%i)7~m
zH!NMdY|f5DC!c%w3k{+A&l^vwRm!K<ZP+7NZ<C&q at aXSX&Y3cHaB_lPt9H{&M|bac
zI}bgzZUcWqMoQwJ?^!)(N`6La5`j=_SI at Ci)z7{A<tf3KnLT;*pYFPT%<!y)7=zvE
zYHII#=ZhcT^RA=plRglZsRe$CLYNx|Lah$mqP1@dco_Lg5Cq3@_4V}@i>08Tz-%`2
zs6_~w&1SdTot&K9+}zyO)|Qcxp-?LMeB4QiiEg*sYPEKDb}AGKo6V-tXlR<&>-A={
znWkyG-OjQsMNtgH0DwxR(&==8S&2|&I+^6$ffHw(F50Nmj2n^7<264o`@LuGFU-&V
zVeipb*MF;2D%LETb>mgD<BW#8pMSfhy}PpJQes at ph@lx1N97b9sql@9A!*607S0$o
zEc5-Zf3iEBiLo*HdD#Y?#+R!H0ZbS*^zEnbE6mTeIh?;7DyzNJ9Bb4T<PG($zst!O
z^zNVUn>V#!cS*&%&$nWLYvxT`Id58GjPZ`=-mYtC1%R=`v;O}0odqMZHy0f~P+FCd
znt0`;(HQk_+g%)S3yL**KJ_P-Y~h9b3*0Do7Kf1jtq|KTVazZL%d)3WpB^-5(5X|W
z;^N{sj%#ggH5!c#4Gpoev4BuZYin;$55q92si_V1^+`!d27`gm=vG!%W;7bLS}m{F
zavZ1CYUAVM&zw19Fc=tyNls4I>-9*wwF3&hq$$v?g*@u4wYAffk(!j67{^btPv5<&
zFhBRXe{Oth;}2%510lSn=*YUK?z(zT;q5CHzVxrJj+9p&Jb7lt+^MU7H*??dQw+oL
zugV{uRgjl`?qbuPW0jZ#K-lJRDkzF!IsS9$DGAR%cynQX?%rdSkG%5H#imx5n<hw7
zqf+vVlMo^v`~8Y}Qw!ewY|Gz1`lh?riUGdcb@=6nZ~6Vz^B!Dt)uXR{i~&~6Ei4$3
zz3Jxz55MwZSC2)hAaxqG!$tR3riHr!A+f&*iFe_M-psn(TcCxDz{MCLq}S_XVq%O&
zqs3y0iHWh<Y~9`6$;rtnDJfd5*5Pn44CAodl}e@2XiQH}@9yr7iHRWyqPe-*Y&K_P
zWaxCd%*;%NVG<G&cv)+=+x2>VQc{vmr{l$Kpt6AhVR2lg#7L5L4R9QGy4)m5 at c9R3
zPZ_&-=EP&CYCigQ2cN44W7OE%`S!*i5JK~&=BFgaupE59`-siqTyn)^qu!J9mZFH6
z6UI;!x&6TLs=7uAIn0mo1=Ghbnla&GQ`;Zk_ at tuxqQ&lXGpy6)Hkqw9hZ6v1P8hZ7
zcQdOmG`;uLc2lpFFK1g<&$`dIVvMI1<nj7Re2jrN94%Hm#@OX%Oubfz(<SYF6fqc4
zw0qQnZ?9P_%=eBYyj+-%qmW-mp}56?@Ne-O4h|naoFqw-BpnWiTCHXn24k#LDghuR
zCB<g9lO)LpSdk>z)6<icl@%Ks>vFk9jvPr*6iJdcn~fyNv17;bkMIIJDJh9z7=yvU
z at 8rQ}NR~_=LNAeYk&HMQw?KzM2A$STGdyA at jT)xYsLRgQ8T4AEQbiF6132BZMy+(Y
z>8!!YS%Z>WJA1e7Klap}tMZ1V&7L&oyIn^BAahXC;+Yc|hTVCjOjgF|HL95tMj?c@
z>@KM|cTwnlN8SRD9hMnq)EAYMt5u53)C9h!ZkmaU(VKd$+3BfyL(-bsx+-ff*&VLC
zu3K2&+VSsgdpk^KH%$lMaC3mbiUjDwAj}ypb=`@K2Nb0wM>t{<CSradWIz}XO#skn
zG`vN{|CeDHhGms16<|yt#G6ezoh~OQho)&>G3B>HP^nZtql$+$Ns{~zkj<Eaf@wKH
zNJRm2lo)4BPKdGCoEMwh03baj2>@<gF>meixjq68V;~8FBnhR0(x_Dc(A8tzQ&OIr
zHF(XED|x);4M`g{EOYz8(qpG;y<aB$UMmD~F$R83;<*bAtS7gt)YCsGIUWF3%$d4;
zcA-#)@n7$;*z{U82H3E5&)8v^x2~A~w})?e_~vDwY%cnA>#mwht$hJ&ga`<RX)KU`
zgkX_JKkPgd5VsUydqr9)D$pwzN$3m4m}Xg)VE_R0xq1b=b@F?^@H-$NFOGe<#KCj)
z3FT|h;Vn{dWt7{(v3UxL>NZ=-&t1gGvjU`~{M?zk22z;E6EFZYx0^1twDT|8wEe(M
zOXtj)lAoLq+hegVnKc<>yt|~bv&Ssko(cuU`}3S`CNMIK|IIH$t*E|mqN+|<LB7Gd
zdTiAfTlf}x<hAw3&z!&cs@W4p<vexgwJYWo-u>J=#nPqcs1I=QKZ}F<La>j7 at zQzN
zUl|mw6b$W};mzuBx^eJ$LO-t at S=cScn5JnyjF9uJ48X!QExwb!-x9FOvRAyW?9Ka*
z!tyEsdo=TTE));ka1{WYs5)QY(un|B><$3fvggRU&$ouI*Wt2r=Poo(7&UDE^l?Rp
z%U8~ycB#4J=Yyrl9~vO^_#lhT-q~vbfb^8aU~3R8HYWfSl~nq;tq>i*aohfl+x9P>
zIpMkc)=U~R{I3t*yz~!$wL9HW$W(+Pnrr>TMqt$<(cJA%JRd|wi&mnC+z4E-MM=mp
z5cT#1yhnfstMA~v(N)5Kg(0nB!OF6%kIzB@8|7d*;Tm|JB8g}3y<y7O+^!zWs~>;M
zpFDT52>@0toMq5yv48oN%pc2fU;MNW0G3 at jd2~)@YGT~}(o<D+K|S3)X4~nSO8~I+
z%1Mc_MvyCWU1KZ8c=?<uyj>NfN0Gm`5d2(x;{KOD0D!cVgkc$jA_a&q4-pFT2^_E{
z5Q{C>up4;E$l8b&rVk)vKzOEA9FeNdGK||z`-CWe at Uwp)WQCGd0^dNEm!@fwBoRUs
zMInR)yF17?gxl?w%rb>zbKigFz9(+KhU4(_?|*sX>;)b%+lxzU>st!*b05BGxsnPq
zKEK^{*kZHKnlSpwJFd0Z96#<mF1w(WZzP)Kwill;^;!$_^Pai)`dGm#NZ<W?j#gHj
zyO=j5?U9?W_N?v3NCZ;^fIy|7guUu!XujR-4p;wN14x>hR+wJPM`il9JM+%8*mraE
z+DM2{4PWFyIC3EPdPBj+IH9nLIgVjjmSwRZ#g!1I60z!EnJpHvvK3?)hG7_`Qps_g
zMx$x&=stI;IT)$TuYw;xGUtigu3=b~B#4Aq<M6COlSdCvOG#+y=zi|qFFyKir|<sS
z`qo$0fBW8_?|bfn8wy4Y*?X+AsjW+)pz?;KWuzu;*t)y;q<?#z#<s4VN6N2TFg-Of
z?r25zFNaSAejOn|-g)V8`MEbXY<}sXTOPRKsu4poijI`Gc6J-}nlZz&PM*8){#QRY
zws*bo!B?NY`0yiZm*-^<E;>?qsiln~$)V{f!!rkev+MBo;u8Sym-}wWN=w>NT-MOm
zk&&A8!0JT+aP(B|rPj^?@MHODe-vm`;lPxSgg}%c0WA>L@{?{5j-<+~V81RDz48hG
z6t6NO6v_-_IgVi%&YQ3uizTRJ_LqP)m}%t$E6cKOw_Bl5AcRPg)M~X`_w97LY1#07
z0N_og5!vZ4|JPdK`O~%apKK}mZr7pm>Wh*`KHs{>>7t*$Yt_nm(^k%#=5)~%Nl+B&
zaJskcmo9euWb>};7EA|#Uk;b?+NYqjgi1lFlnR3M6wK+S-~M7-uf_KGt=G&e%%4}7
z at 6&2N{Pq{V-M8*Ndh4Io{r8>MEtxfG$*f5(H%$@*MUfce;<73LAPJN^WYEfa)7C7S
zWwzRR0{E*P2mkc;ziEc;D at KEhM(lTS^Xs^L+ZAK6F(BIHDjZm`RB)nTwsL@_C9(8E
zkIiwbkf;*y=A&zGUooeprG=*H<mBYU#6&kua~uZ<LBNbJk*ShNpQluVsR4W>7t69d
zLB=z(CbND1J%0&Yxa_Onu*^XPc|#0ZwN|Y{h~S;|7n at t#P38_$Z_o|~NKa0fGB$7I
z&~$@NW3 at Z#8rv#sF4i at +*~B}`sT9=QDFrmkmY=JWB#clh6tgCbq)77Q*$eHa9^n+2
zot9EKHa9nGuv(?)=(e1yy;OegLYt}A_w3-rxQU~Oj~SL3qu1J<t_w|V71i|@np({^
z2SPYCA%5J5>~VS7u?AhY*>?O)&GFOc1Cv=q2UaYVtbT?S%Q4p|B-|qqt|4ewEYKEk
zP>L<Q)`8HtRo(&RS#P%P(Y3d)nA6(Y>To!;I$c6S0>dyMmYuS~RT#DsTC)0<ZW9E-
zQ?M+{#>K_y_4-?$UiaPZqmigGG8?x>Lf}y(i4co1!$i9Gapbd>f+7(DhT#HM!y=zW
z$cJRe?hiu}h$KmtWm!o$Q>4x+Iew2ovVJTNhm2(1O-P0bj}ojxvp;xF9u&b)5nZCh
zehVzf9t;|d26LRLt1B3*6^KaWcbTBDdbxN1EliSRe0)42$j4v*Wb5AJk*P8=2~;CF
z7}mQJ&t>p)3(}XOAYbQz4H`Dda+u{98L1Y2b%Y#%kUt4D66m5H`Vt`#YafN<3WcLu
z5emvV27fHF?x1+(8VN`u1w{fvytNLO^WcT6TCG+nRTrDvUwHrP@An>ybQ^<y!3|%w
zH}_LuqbN%hO3q>VoxlCd`#t|d!HKF!1LQ)d*Ys*5kpMSb<5T{+dGBmDnLB%JZcIfz
z*GA2y5fmcK-PV1jM?d)Hm(z9iT>rLKj5tc|w?ky#tovZ)$3e`030S?{t3MPSdyyIn
zg?#}l0u)v@;84my*wz}qTBLSkiA={h$Y(|6l*d`WQI0YEpE=L~`Taw at 7K5yg<ogFp
zQeWdB5*qhevdSd|MZw}#1MwQ(@$1W%fdnh0yj$0RAZZN}8<QwV!(iM85;*EU{-2EF
zfmEVG!c=a$mvj)8AT<)p21guW6Nxt=s3w4-F|z{n0S{!w#FjV4Op+JD9}^>&<=AH;
zMCg|5Q!p?>Q7_QG+()qJ@%}?I5F&xgO0XnB075t**@b96M3I^5Q7Ei3-HA{@G5e;E
zAt7Fag^^&{P)ICE5fnhO`OQyJ%i at UpDKcIBS6g`6Cn_o2Q+<zL!5G9AlWf;OWUOiw
zrWFnqi;enfNJM>5Kmc%Z at p`^cO{vBsh at r;fUqY!YVXP5~cv?p?B1)RR2lpjC%daG5
zk!S!1k+{KgugSd<i+V#O9Rg4kBt at g_ju419dm#d95P9POBWYYA;fnjKwo34d0SJC$
z5;?&MC=grzwLbof$Ttrm@18v3$O>5%A~=YJSsjJH(XT9BqZNk%pAD=6gkz_D&V3|k
zB=Jc>K35T}1M=e`*?C&X(S!x7H#8Q7UBM!VMMQFf7WGMjh at PUv?I;8;4y8E>cNh?X
z(v#N~`;=WQ7w99H+N6po3aC}!vm6d;&Y^JZ4~iJ!D9Rfo{-i*zJftQSqKSMvvjmz3
zSkirx$vqer3E6n*Ad9Xd&%*_PQLt2zvS5um68!%If_z^F*6b9M00000NkvXXu0mjf
Dysydb

literal 0
HcmV?d00001

diff --git a/docs/images/calao-logo.png b/docs/images/calao-logo.png
new file mode 100644
index 0000000000000000000000000000000000000000..c01ecf675282e86e736a7ee3c24886727946e156
GIT binary patch
literal 15386
zcmV+#JmtfQP)<h;3K|Lk000e1NJLTq003YB003<W1^@s6UIt|500006VoOIv0RI60
z0RN!9r;`8x010qNS#tmY3ljhU3ljkVnw%H_000McNliru-U$>8EhoCMW2OKA02y>e
zSad^gZEa<4bO1wgWnpw>WFU8GbZ8()Nlj2!fese{03ZNKL_t(|+U&h~ykAv$@Be<*
zT6^#Bbmnt%GLwNJBoKxe5FD7D1x15OD{5;+Yq9O^Rcr69BwUBq-m3LiwRr7IFIrIo
z&LWCJDo8<OhLD7igiI$n^Z1?i-fR8-So`}uhmeWEmiBc|Uf<W5V4uC8@$-D1=UHEI
z&hh^~{^LH>f3*h^5&0cn{RNko{D*pg;DzOI&*}Hi`p^06IdK2a172XO7ZEKYMG@%|
zk=Y{Bn|)o(ekZU_UN}#9VZ1^9Q|AC#rxx(p_Cd-gC)f)dZaL8Fpp;qs1h8L_O$l}b
z^I9I{bFUfYvh~(Ij|UeKaW9bI{?jR-5##64(%Db>jTU>E!5wRmkx093#egS at jsbxb
zO~(`*TeqyJrS!zGJ=A<NU*P9^h8YK@06X*ghZF1zDfkza0uC3O8xK9>a};6DNl349
zusBri-r0s9e5{-M-**mWa^&f!L`r}rAb=4|?z5XY{s;THq_4utie<cJ+38ZXQ^6L6
z+LS{-*+pUSN&a*~SnJ%slVD!-3OK;>TMg<e!Cjt%O~>Zkm+oK2Z<$N3(#PT(M|kOO
z%ZURC-QzG9A#9D9oKs|XZ=SwoEj)bh6v3|sXnS;o<NK#rSWfA7&?Zn%Q?@zHL!sgJ
z$tn*6L%(Z9yhuV&BcVBa7zK1|)W;p}g1mCy{Kq_Bd-rM*`Z@82G2T25FAWTBsV3c4
zr{EMrQGm?_6!HP>3rY-{5Q%c^I-!$aEIf^06EgUjZ&UomeirN);e^pTr&eN4Oe{SK
zJZTg+_O|hprv};Y+{}AB^8NmoQh<nbXw)?dcg}3>KDV=#@6txcO%*QQVR>_pVNQ3B
zC^D!ip?ZIXBo=n%0!$%CPgjmb%i0*oN9c-B?N1oCipM)zxbOY}!m6MzJ%tC0?M&Xa
zm*Ousar|$0bIIr=r(0orA>xZyoXL+qdIJ;w9{;N-;3#mu$k}<rJs%U?n at hOA8D7GV
z8E5HN5<ZCGtZqY83@}lM(gEyC82!;0#i5klr*v{(87@7ihh%XJ$^=NNvHb~pG(}R)
zuv1i%07(O^ju>t)v3u4m`j4N-o*zHV;vd}4o3{2bzZ&!X-gZ9mCm(0anl+94{V%Qn
zk#z<>^>#)4v0mlAx_3Tbr_9pNRr#xu;pEvNK}(L%D69$*3~8Tb{Dxr`@2wMd<S3uq
z#@I#knC!{Zsx)@Q(j|t;AYgLLQnDdZDlr*{=qX2(8qz|EiBb#0xdMY#%jhllbNs(P
z%9#V>Z0zXZ!~c8 at zdZJ}#Qz0C&;hP2NJAMu=@wUNYS$X<z15Pvh9bS6o8+%ciqmF?
zMEM*h3=pHSI>5OIHENl>W0JNf$LMX(!#NAscw8%CYe*y^D$!_VNQYC}^La)IapQ`f
zLXo7igId%=sv{soBuDBLQ!z|DupM>7ZJfMi52I+_|N0a8-rDuVK1o0KkYrxOkiP)c
zKUUb<MYu20g}HWs4 at AN#vkXy-LMd=cAu0f85T%fUCOo~9!6offI&vgEc}%D<PH<L8
zP$W*EqsSm3G6A#Zbuf`@L4`%~VF9Bel!_3E5CURrsJyI={q3Fn`v3lvvme^RwYO{`
ze&S|+0@R+5C%h;Nu?%v)3i#{-&EM@@!1sSR#3kD;AD(AuY0*e7kC6a$2oiuYxWFLR
zV67o>0fYf!0z?EolF~6 at QA#t_T421jm1<NZ3X2rN5>ZejZ}J$EL#YTW5sC<r04pIj
z6{b>QVC!B+zVIzpJ^BRu7Ibs*_wID}KRtwsI;27l5^`UZT+j-7iW+r=MxMOBgP$|b
z+{a=rYgZIn6*@2|rEpr~l)`BR+Mtw1MFFN1kZTXgwFKnyhA=YNSw;GL^6U=++`bx%
zHVv_C-xTu_hjWV5LKUIxppM`W92z7*DT5Akl=4O99k-O0cV5b!b7nF3sX;z{#XF^^
z5rUoz6RTc~*1wIBl?r!i3+~33l_=j@;WaI=q(z~1CU{YZ(x5yoCQ3m3_fBb00!o8c
z5C)hiAe_~TUff0Xw0Z1aK97A);~v<_?1y&IwQr2dRLn?Sm`I?eG>OurO8M)GK_noE
z3iPZ#jn;Qu%GN02qQ~y%@(o`noTf1j6OLT=??ujrio?D}<Hp_rchX1KmXwP+6=B}T
zd!-CY3=RcoL>W-p3tkkW6`)9+qn1J{0@@G+hNuvc%jL+ol`xBX89e1!c6GEdymcS5
zf4hl=`$lL at 9pg2}q*IhrMID6|jnV;12ejl%%zyO-47_wT11935Km09ApDR21AF2QW
zY0wZeK3XmAB}K&pU+QG=mVni%;+RrMpfyTs5RJ>MU6l40Q3_ECCk9a1RB*#7s$!|e
zidZzM7?ch$L5?WOlg}4vZ||VvxcTUptz>A~aZGOCM|kURnX|1Qsni)xEn`ko6HV$g
zLV(dBrD7XB?|2IvJ6oB(c at w|4dpFTDLXjNs at 5LN~GEQHB1qm#eYq^VA1dmu=*`f$?
zf&>O}8iz+bK1OS#;RR^KLnE(*#KFUZESZd{RuamwCLzEPpjAW|MC8I8#ay03u}HC}
zi`q+8vg?$S*t2sV9k<=hF+<}7sbf5WaVu0rV<jL63~eW#K<>2{G2-CezxY1Kc;qI=
zIpjs at 0S6{22d+WDWu%t?rvd5912!?tyjVCsAD~TuXx+4QL?NOO5zs=az&2ukmZVi7
zpyCYNwv*%b)R?HIOr;u2h!W40DrJCxKth5rN2yq%b6zin^Uh%3%9Tvs^APR-dM~rb
zCK-$^BTkq^NYNCdh<UF$pB=e?Ioo$~9?%Kon{ssr{QHkqK!a93j8X(RLtxjJ+S#+c
z#tC_0R-}EXaoUF%rEn;$C at g|)DnjFw at yam<6$I$xyVyhk8 at 8}=XBiod87#+)RxOit
zs3bzw3U%i#+nA6r%#$-Y@^gC`yWkw2?CN6b=G!@L;}guQrA%1Mm_W@Kiu2~6&st5b
zT;{TUPq7r}0iqXe4mgnBo%#J-S~@gxT&Ub8R#4q2oYZQ_M_%Zn8;D2yaFYm$)mUeM
z5G{DGK!et(LP)N&Na2->*}PyL_3z%xq8~m^@74kKjh1<;oX}r&jMpq<F-%#QOrcVT
z)CH(8N3o?u`^u9TzxZ|Z4UWQ1KV(5)AJuxyuyv#+q_lb!+e$^w9v|dPU_OxZcRC%4
z4wCC$e3kG7wQdEobC&CvzzjH!FKKk3Q3Qw>oG7eS=v1ihPiXB58EVz!jP~I~d+!is
z&|=U!Kw32Rq=?7%Ryk&0nd0?#aLWAoFn>N1vpVUY)y;TEJJq0w4pNj#QGrDV4s9Yt
zB}fobS$!HC_YBZ_%k8XQvY4^etLW33^rYnsKJW-9#&uRQ#vpC%2F7uc`Y8LKgo=o<
z^F>^AjAlENbR|M}E<kC8YQ}vHPGM_cw@%P50evlbjA#O-aLy-X<usxV&S`WM5EKLQ
zaZKlm`P|#Rl6a_$JoFUhZTB-bh2zqcQZ5fs4hnfFmPiW)l9m?g#S*n*D^u;QsP;|<
zmM`O*Pi*7#U3*x3!MXgVSVWec0J(_8!-FjAY~y}lzo#jD%kxmprWch0QtVRg7+<X!
z?4O|98ahH>P<gDcG6bY?3X<^zhEl>gj(Y3}v_^~a#hFrAr4VO42b4JUU_YF7D)p8U
zm9tLdwm<xHzQYCvw+s_*8KLlGo%RVwXSG7tWR>1(mH87>%uNjo5#~9?vE>S<jgCO6
z2n*-K&=}`j`UdWrH;282i1s*PK2vm2Bm(L$YBKI={a)6Jf+dkK@z;x(+>x-{)yb;>
zoh4T1G-3o%8qtF4E-|#b!qO$JYz(0qK+Y&kR=o-al?v6eWn#++i{{LNo>sy%B*_&>
z=_2MTD#vf2eEhkL0sR>eP;5ohOGr!}OFo{YuzP~m$q`EXhH2ZfiBop(<NUt8tp55p
zIs2mX*t2LZX`IqQjW&wpv!?%xM*%YsPaaqSEXaPgXC8mQ)xlit7+7#Dl}8_?QyY}=
zoQ#K_CX4e12?V{k#NPXc=-NER(&Z7`v?fk8QE1R&!KJv^QR%N??|P8Z8(+<6lqZ--
zskC*_M?eguoa^a>bw~<uHO_LZs0^e`0YT7Bu-MBhI2rO6mD!YxbIZVf=9d!|*_6fg
zgxU2PqZ2jKmZPSlXK?UG`>`&o_^v)A at 9|82TtuXW=(q~;doAt)pu^(!0`~w9j!;F!
zb_SZQw86Ng-6$}D=W~=o8U>g(xSXJ81r*K<+4`$p96Mq;_V{)l?}l<7lq9$~CK-w;
zZP>)hlTL$$vl&elni at M;#zuOm&b-H~XZ9s<4ks3ffh3FP4dkdOpiO~b&TO6p9$}2$
ziBT5z?ISA3^tH^P!T}>MFNg<-h^%$b+Uiw=e$^E9PYI+7xj8`pq(Xc@5Ife&>4mkk
zA1~9=V;H8DzzA)jMx#(leE89VQ`(Cs&=_qXh^W3|5f5*wa{Qf7u(GQYIy?N6k4(Yf
z7`$XP6DKd?Nh{>*mZ6s&&uz?VCdtErW_wT}Hfd!MU=kRkjsBK4cAR_+4j9j_?T)Mf
z$59O;HNMWicOoKJyQ6BZON6;7CjG1+52o0Ug4>l~eGMS%6l>Sgxi-q>RIM~$m;ef;
zh*p)Nj1N81fS8hnBW-ZTpaV^AVT7L7$<C>{$Y4zOq at z8ENEaVNWqvmUt*z)plOL<H
zfAKtS=4CucCnK44ADp#3x~j&4_%P-Z?nD#N`JX*M4>;UR%)x%QemyeXu$~S(Q`A41
z3IBu6xnXZXBCL=AP^@jsFU^e|vpc4}BV_drKVdG0)7lJL8AKaj>7sofK<SK@FlY%d
zd5y7#s36200V6~VT0>gbh-lKfL)8-o7xZv*_iMS8c?<xR7ow*-!%LFiSx4+pBYD#U
zRR=aA{DYk*i*t9d^Go1Xv=Ci3N_D3<E)nJvQKst~W1MkQ$_1kV=jSvFSLE4wQUNzR
zN1+%HL;<2gL>n-H|ExpA1URKp68dhK3J^4 at 4M9h^aYyp#Fs-{Mp|gd1-gp|{>bi)#
zS;>B%SY7<PV0RCP`JZzRc&6|@LijC6ufK*KgFu0@U@c-3NS~O+$$EtIqJU42{HnT_
zRR|)A9&+W~9KTNUfdS$4RMFn5nRi@{p=CLk9guI+1frXyTO$!WF^E>AqR?WpkR*s`
zlnT&64orwxP5I;^kF`!P^qu>8%}+N|J^NuE_|uP4W;yALrS>t0iQR{rWKew&&W8Lr
zl)nE6-TQaZGdN6FQb$`yrO?9uu!FbdVrrLO!q1sYz*m4CqNxG%vQLtHM5WAbQ-tH1
zxm|{V6GEou8ghA!$qK4Q0R|c+8ml}8(b;EFnSzu8 at pOfDk!Mdk3$&bgJeyBj#@}A`
zO|Jaf25$V$20n1tclnjPL=G|kd6=H=kqotA`Ojjn;aQ>}@#HP!@7ltwUwxm|eLFZS
zu5tpxEMv$4#5Jmu6HF?_u^rv)H65I?eGi)!cQ8DtS at BOK|Dzq|R26p8FuOyOE{PcH
z3dk1&g3!|lN;FOhPJ1HGD$oC0?WqQ3gj6XE0U`mS15hDaLbM4{iDKT9V-zQ1cE9(v
z{PL^6;Pu<~@!hk3pAUTPYQ77S`1t)o<bvlmJ)Px%qwxSS8zDDXq2uS*@$xMX@-|>a
z7*Q|=?KD~m%0Ze`sZESAx$!=hwYIQp&LRdDhwS)3nV<ahR^FN$XN9Ds+Z46Ifa4Yw
z7+4%KF)K&Z8lbfS6J;UBAVKKq2p#&mz<4tdrNHET#Va|KE at D&;t at CJ?LlNR!KrJ at Z
zYB02Gn9+aPz?t`MrmEqJdv4-pR#Nwf<%LngQJ})7d5Ai?i-;P4+;ELqU;S&|@#uYg
z#N=4r+Cg`*g|?_jYc5AI%270iTo4jzMT<?L*aGb(I)ao{-`~VXjpOtVMU(?qb_B74
zE={E^BnTBE2Bi(k8H6nMH@SX=YtRfzfimE<w|*5MSyB$1Ay5V#1ehRCOG}Z?)>alA
zw}{z)_<HU+X(?JlzWSk0@oJu=BkN>E>(`6^_s#)F(+^NPARLE|Z~hIJS0;E at ODl78
zB}!rlP}A3NE at S>IHnoHZ<O7nNU|LebLY3~07?lIGA&mp_N~q-x^&o3{;~Ouc#0y&)
zKb3%Q$~0S!x{;s-5d$hj5qjQ81=$osh$xN4pu&)_P@;R`Lc0IpV(y#MPV2Tl{?9+(
zz}fWE3zXKZIWQ!9<D2eXKikzLcku8wqeFHy7n2A|U;aF24(;VF`8H;Sc?!l5XoV3u
z#5Eks31~>8I%!xY%vZ=2Q!tJc1y;~vutwnmkL{Ii6kd(76UoL*GV6EKN>F%+iVD%r
zpjCi!0UG1ssny=2MB{Xb2}25nJUz>grR9oC*)=gt=N-T0L%+G7l|V00xDN?_7u%3W
z at BnwnL^J@=PUv{@QQjPcbOj-yWHHP+Y{Tk(5}Kh5!Q#NxN%B=<H9-{ANrD)g4OQV3
zk%1%(P+GD|*P|LIdfLjhH2c9c(UG5w(8{1x01~2`ecsFibl@BJ_`U$j;7mlW*h=rq
zPG{(xmtptp<-G0NdCk~nP6FCid0?W1b*dqk>E89B<a8v@IP~w2sOc#%w_VQ)94G3C
zP${(1hyMRWp+sS{&MLzM71c;g1#MFA5!z2SU`#e-C7G}dBF48BGsL5GfKu5Ymh%=3
zzUhJrKm}+q7;R7(->^|86MP0^@l$iwiXTe}Lt0x}XuIf at +@n%>d at FC?JHX;(g84uf
z5UgeG48hHO{Z2gKP!|`KgJACtjt>G_jUiBi5(_eOUqnzdtY3^lg%OETKul=r)TM?P
zhc&*EMF$WGvC%{VRy@~(7Hp&F!c2QZ)B1hUW$`qHB0x35kMdB|HRgu!N_7oos=$9H
zz^EL>6OTim^9s1{K3cc!Wd7bAEC=QRg{#TNzWgi5J|99E?g&u!(7!iFf>0%p$^<<o
zAe7AVT~=~SW2B_<z4$^&3<M!AiXe_D1a*c~g42Rk8izn=P&r5|5Nd-Ha89P1?u`kz
zMj>W3%1pN$MTH)Uia}K9^8tQ*5bOCPmni_W?<r^v&SWS`lP?8yyy9i-{^@PZ-~0rp
zoNyv_QW7+^3gn-t5<In&s5*t}oJG<*k4g{JdOh!xWJFx at d|<3OnhIEHQs=M at foq4e
znXsH7&LWbv00D&~2trg#8 at 4`53zoz=5~WD8i3PMki)N|@b5Q6sv+_p56;HfbJR$;L
zfQd6rG^8a!5n&_~tTN4pyh9 at r`q-Z-LmG;3zQq|3(!OX3`{&GI{_Z|bD@N?=+ez=w
z?q&7;n<-3A(wU|daENoH&M>J1_VjeKY3a#4`qB&8u^7hMpzM|5<@jtkA#(((RZV~`
zwbC~-K;5Q3cF%yFDl6ms5Ua;)4p3qsiWslfXs=rzZfpY@hM)!2X{b)6kP0~wEE+2f
z8p6kYC19=gNxIn?3lIW7`Je(H;~QuP&ww%`1c{YtkH~TY5~4(tZ*L=Ax)io<r=$&?
z!&CI^-px|yDChE!I8YW9J4h4KxI%sV6TE8cqwN3XjXbn;B|m%TAM?;$80$c)o{B#D
zYWRprB?s}s<9RHJ8BP+PSW`dgs3Dt56O>js$*{Zj#gr}-8Lre}0$MRt8;Vj22 at R?v
zfR2DP7V_2$UzEZrlNDXM8Iqg|P}X>qqqD+`5al#lf*Hxy_^_kGCY(hFzM{q;E}M3?
zDy!ZNx}$^P$#Iw})6>xcy|b{bMLKc?in%;F9T7wkQLaF~P^6`$m9A1dCj>bz+4cyZ
z_{?AM;al!v`BrH40Yc<x8POvupaYUuU&0e6;J39Jl_Vh%e9RWSl`21p?2Do-c598a
zbW$dS;X2(ZOr-`~;6qHHkrqQRJI81YdFx%*s_EgYMzuR#d>L$(c*O-69iSvcXWn2l
zb`%t1vykT0boxYj>$kc&$}Y|k6!TP^gIb+Z7-D*RshI#1282qZwMSWE3?|HFiYQSk
zw$hPrWnQhy>u&nLeB`^|;-m?$gy0480B3=E1fyqM$am6&-SrxkH1(dKj8DAyRiRV_
zD}r?jrvp^J71KK(_Lu3YT1Hcibpc`n&<5QSV0t6UqKR~X)n+;eH1a`K?W%0}R%?w@
zAzJyQs~gZ2gPw_ew82UPs+w$ST2H@3dkYeuBdql}MJv$V9ZZGV^G}l9lSmf+8ik<-
z11buLiY>H95vSk#EB^AIf52%Yjmfy at uK<6M7D(UuR(73!9yb8v4$s4jcnq%;4yJER
zJlfH at B2oJ+1_vf!L@;$jYBNCu8X`kbjF9$_GD4IkUQyb6lFN3$#IG5N_F+dmUwnxR
z5Yf1dhDI9ke at 3m4{hX{mXngIgG at mf7)%+-nF<7MtiUr~z8;6v}9-2n7F0hC+hs4Af
zf-odsDA5vzoN(7Iy#KcQnA7K#V4jBpMBV4 at B`ibBBYkw|3#1)AY at 3m6$*f+qK_eNI
z6s!r*VV<aU7Q+-_Uya@*qMAlcD^$jyB8BSBQ7(i8Mx*egTf<77HCX``WUOcQBEV!6
zgSYURxZhx%7my<hLoN$F4eLi`;5 at -jjMEy0(9udoLy!wlVWSTr2+D`IhH+&c at 6cfV
z@*hrN!XhOrto-4(dE;Ja%bt|O?FX2{SblIU6n?m!SvP%&*N+YHs-VCzg(96%u4(;N
z<Y^?CD8FANN+F?;v#m^Z&Sh-yN#;&PY@AGq3kGF$*6GqnsIf+4wXdKXbOb6>ssv~q
z_+>mov<jy~kM-7Rn^kg%IFE=BlhqBrnw}0ls>xT?>owTdPqC*53I$RWfk2XV;Y1s(
zP5kJND3o(q$Hr#fuTj=t+K58s3KU2BdCk^``Q at sWOdM(Q;vmaqzT>qUiZ|ZD@^Ahf
z>nfAHzonB?TiTc%<;ZJ|&V=tWPjHA&%1y7xC<_x2bS_}mgoC|~&IzHG2sT3~&IlNd
zG8!HDk at KhTe)$=GAwanhqXHBL<@{%dnK7^xdarTWgfxC&x8WTw`<btKd~H%2o51YY
z0ZW%saYBeAa1O~Tqeh3zWuD+eSeEOu-#27{@?-HqF3<c2@8I;YMlwF!e!zjFCz(=$
zJ04-y&#&iC(7d$N!K^}wjwnaL1OyE(sDXM!`G*qK%mbn|&KOh>61H`d%vucFYRn!}
zRO$vtRyC^t(Vh!x4&XY~+<fsgM26>;rxBWCDp?P}&P=YTCLiPrvj&|lIMLI at p@lfD
zGxp>*dd9}#*kjqIv=>;dPT(9kA!&Mg!^l)~A3<fIxM?&vL}`K`BsbW{ia|Icv#Ji9
z`vLS;DE<6foNq0w3PoB)FsP<=li~eFV!~OJ64K^P3XKUfr$bD>l|s)VcI>Uej+EA_
zCb4=3x at d$3?L$R#5;_}8$qFx(S-+;Sq?cL0_&NcZw(@39Kp|FqIHFOxJ0wl1PL}Dv
z^Der2x?t7G^eYHZq~nu>Y12Y8P>?A>GK+82JTvoQ<G+`HpjxJTc$nx&Kt~;9@<HvZ
z(K6J>%Y!_{ASBXZ69L%i{&VJbo?2+SYIbu<spieAT!DPcT&CI<lRRZvG^$9-LSnNq
zLv0Y1dBjZXM`ub1GXgC@Nkh;XZQV%LjT#`cd_m(f-iOBiST=;|5E3j?+jn5^ybE4=
z4s>->KoO)4J2FMyW_xDMz})!%8_%hlc~E8E at 4X=VeQamu*F$@OI!N->J0GJ%gl?@d
z0$Qvu?Ph4+C*CZxi^k${yI0hV*r^ppheWv+!tSMP?oVKIo!-%u at x*xMv$^l3XY79&
zv at tjWpHx*=aEU=>+ws0)&N^N*xyvRct+Ftd(GX4$Cs=E#RBKG!b_b_g2j{$;?O~2y
zQG`=5YG{m7;)qk4l{-xjP&fhI$bB>FpQce-i_;;KrOpF~wVug3t3#+I1>bDRF0L}+
zs;n6^)8Y|@mMk1)V<M8>SOe(<CP%JwA+-f7i8qeZzE>f2<yVYEVYRnr*Npwyh)EFO
zR6rmKZGA|>O>;U*{7{w`b{7B9IHxltl!YM#=lsx8C9bo7+fxKT|2Zw^oCC)#WkMTT
z6R<<$1Y?tsKwSjOjPTO<TKrs+h(b3fM5meIG_Fx=YhinbXG#xCRjY$kzUc|4GAzPg
zo03?EbAHazDQUW$Yuud73`gP%7Xjy7(`B9bTo9Jp>6o{IEwwJ#EG!&1B(ab>-5fil
z!SgEx5<<q;ph9o)k~MQ^cubav#Y`7nYI=$LX~;)}G)b5k8)fG=u4h>;4{v at gcLxD&
z2)Yi{U3+Oy1QLg}jgwolVoVF7ygXz^u9F#k5oc5Cahb{GE4eRv#)8H(`vM2^faExs
zoU at 4A>t!Yy)PqP91vEXNk#w1<kSr!DJsqyHtwj^$DHM7!$DG0AI}=L%MRF4bBnh)h
z)(hWeuu>_V(al-$r3}~rrOk}6qEXI!U=#H;t-sM31FR!WQYPXWgE!yGad+PXzxNJm
zOP64jqL_l+KZ at Bkh$IlB{BtSQeC7r<f3RF&MR3+(<2v<Rj^CX18nz}Jc>?cX3UIAZ
zdD}<0Bg%7IWt?G~P<PgcBxkXrP>rhB9e at H5oK;OVJLi0Y6+x-26V-Jr$qBEdZ&!)l
zp%&6w2&q9iUwL}r`G$*8zK{|;?L5u(d+Vpcel})^W=v5uLJ!Wz<x0KI{zo4t{O0v6
zIAb-u>H;1$Ip#TquB60UcF{hWK#~$WN7|UWZF;rxuZFR?8T04XVw0F!95b@=3~ua-
z80tBSqihbQ01L#Y<QRF+UvX`zouAd~j3+Vmnd8>tFf)rUCH{Pj22`EVs&pbqn*A)R
zOm#GiovMe2#&YZ*bWD}kUVqF002_8mL_t&?)kI;H!D&C~X2 at Y&h;e~eO4c1~Y{uK{
zSOUcF2YYHDYtA^`OuVVHRMLc at y?Yt^$7@;E+6q^^gI^U(bcm)<gJfqv(VhWvHA^Lh
zxLIUQQ!c7Wzc3@;2 at ZwAky=Y_*~#2|#d~<N2+4iVjg0f-)*Vn@)yvLnKFt@FoWwWd
zm~or>8}sS^X_Z~$COwbu6(o%ZNVD94;9Npn9%o`;h at ov`^lzJD$KD#d_Q#CWplUU^
ztl=V!p(~Tkefpk(x9|-4G+0hC(~X#n1$8K#v(%D=!NDPhzVJ_+*|!(2`T)C at A5W)I
zw8jqGKSAx$ZM2mwN#c7jUf`~A_`?BJYz98EQDa5s9a=$Lqh;?X#R$Sx8S**AnHYy7
z<D6Z;9@_^Mpj;cnrD+B^l}AJ~szYm2thL0cC9#&&SyCKv_H|-Y5^Jd^3AK8asl7Xh
zdgk+^rv})$W1KA`bsl_Tl4QzJNeyXgu-5ZCsS^^XNvu$}ir5)yqNzDW>=dyRYD!bH
zP<M*D6aTZ+QL~nbIALILguX9-mDLYE2*3Asww`es`^3<ZKs;7q>cK5^4^L99Buvy|
zYN at 4evuALY)LIhjzfQ7O>Qev8o-K8j)H?KzEnM{XALZQ}9;OEfk5q^qk}k~_Eo3{G
z{ku6u2ZYVZ2M_72wbVsOvwYyhWO*La8Th`@OHNWDotj{Bq at T*ZJlp$sQ68x>=d5Mi
zy>*mRPneCgD)KmNHjtBQaH;cWKmek%-_abJ##)z=fDZBfP*MvuTVrx~lz}gQjn%)n
z4c_%mhAw_R+qGeC>ZpuXssDBpy?gqpj3v|(Z!D5Zvs`n|p<D{qqMapm4wd at veM{D&
z(v;NM3@wF3)iURQ=POKhtmR9u=w{IGPdw|X2;V>Y*SnaNB+SbfJQi>6^jeZynMzz|
zl7w2~=Y1Morlg60G!9=+xWp2V4>3N_$K=2^;-_}gr>ZQtyM>{#G9%kZnW{i7j0l1%
zqI2jV#EL&c%&7oTd8`CJPpAMV5l#Y}3PB=-5T`V0?5IzU6W{nl&b{?Eg5yu%*UOIM
zu|4~koeSx&rpO~t(Y9kB10xkC%hs<eS&Pn+wunUlvDPbs6c?u;X%<#fR0 at h1n+hTp
z71v2?RcifvS@p>evI58bf4GLRHEW*Rc)H&55c7Z*V+dwedr6hb;4Ui5R`I#XVFo6u
z#Kw3JvEFSZbr1?tPo`sN5>p at 8$xEt}6lzs^m4*$QDdzJ$a^W%jx>EK0NzGfF5{pm;
z1RV#63;o|nJfWvufJ(C*keX?Ce`+rsKfRTYjE-aShIL`Uo%cLITU#6XLP$_|xXFZi
zQYVfbF^;t1N!FWeYVo{LR{dgt)MeGXpKm4g#+W({1%=cNPC>mMl5D=8czBrAx7^@<
zcBs+y!zn-}AQ%~-7fqCf9|0tbcWJrI$R)qehBI2&3z?W^B<1@+Rvplsz7OQB-{awd
z3H2V)_O#TpZ&%D3nPO=39`1Sn15B|oyUy}wP`GLaQajl98gS>WWbyq^@^^8<a1ihp
zKlm`$&svUJ?!#*1IottDbkF(p!u9KMYo@Q=M3YxuiN5YS&N|$_-C;w}AehP|y$Gt2
z?P=V-2WYlh#nIv)=D;PrRR>w(1Kf at Q_JjRADU0!)qX3w9<Abg0bBw1fZwmLoxS1a6
z`}OOQo{hMR|Aw<FF`oePk>NvM{TjbK at 3N=Ou%^#axUw;OrsW4b-*mog#P?_a{t$;%
zKmev*rBz4h1D4UWa^O;I5H&2x*+a#-8Hv3yPlVr6WaGgfTJ)MV2jNf-SpAuK)Bz9$
z=*v><p9}2H5nMHu)*o53rfGZbSuav#_uN=aU$e%ghu?xZ at c%#ZzQK{WYGoav@<oU=
zX@;3~?@??GiijZV)Zy2AXdGF_nl&yZ8@_wmT)x8{thL%rVU9tq1N$*Sem$qlUHP>e
z>W?*)bL8VB59DZ`z87#c&NjB_4`^N;c3tUcrlk*?ghPMgpmTmSPa4$1%w>$YHZA0t
zmLVc-z%qdo15{hcH5DzNc%n-37%({VICv510v3DXPF#UNm5CkjB+iW;;^7toJtESn
zkq<doppk!AM%Op4{_;Sj5h at N4*vjmgX9{Nwc(QRn{yCnxcqbx33(=AZY9|J$g@B91
z?5&eN3hV&tGoRl%=dQd`o>vI6Lx9m#oWsw^XA8lJhrvGfM9q`L8^Q at 9%mo^Gzw-xj
zgelHykd!pl$dd~7jgw^7_a1fqlK>I=%ozLsHK>=E1mzbDK99&3an8;ZjPvL2z1!m6
ziARNx0)K3AcR%X-4-w;E8)|O(lJkogP45-hp5opDjES#sXdViXDWs>BrJ><{)ueu*
zLORI!Ip>Ejh841*K=4l at vh`?|^wwpcuRc-;YK6Lq7`4_<0l4YLvOIH_7$+hoK)p96
z{k((I0VA+iU{hu#PQmdh_T!rw`lyJMe0-3a(r!S*pw3Pw0V0jO0q8!^yJpkU<KTE8
z5ZDL&32+xjJ{n+Hpz(JEFb)=l==1!MIZw|MBBBZer;ShWB~so7bZLJa!4`qd_%k88
zEbc8+)c>hKaQd at 7J@;@5umwm9t?aXw1kZ*#n>Gb54x|x+GE2TF#r*~TIGO>CT9 at K3
zOL1>+r|@=#`jGWEt{p6eSw(;<$-gBjmlcREcgU>`=gNe97H+Kw>s0n|O9v at m4Q^@n
zXRF83Ip%O2-uix8PjT;WC3;&C{V}pJAs|R`Ysebtj_JhSO`$g-x!O88!8xfr<of~U
zU9%{?BgMTv#9X0}8-comr8SaIbW at mpBqhwuDTh;lYlC=JH+xB#N)uA&y}&v<-G~Sx
zT%Y&UT!Q^*X1(JP`a?14b<Vk6&bhIEH@WW{T>7&D;Z+*>LN|p!gZ=&4`5$HH+)j<e
z4!1f}z<7r1-;At{@MpC204wvDFADO@XSGD_KlY4J-BZP$)woX$*5OXg6P%jC<fd_!
zsb1>f6kmVIx0ciMS5wp<-0jAPoO2^n#E&G{k1OOlJc+k#jOyEX7Kb6K!@;sXu&2MA
zJ=QT|6B27ZKjfS*&jC~ond1ev%K1c!#a&+^`M0OP?+UDOH>4BPo`|tu*ykqtXM{9F
zM24xHpW+r+*rSmz<BzsEqd;)djD-1v30K>gVB>}nY-QLT%~pD5ncXSwl1!*yxA3Hf
zQcU{h%PwQ)+0Uf}_bUAH3)|a>zVZ<J$}|5?_I#BD`%mISEEe}_pm?;Q=&+ia1M%6*
z84V+zs8^|Gt;t3P7J2#!u_w={N^d?;_y<^`J$TCDO<8AiLmRp8Y1pQrR40AY8kPqc
z(nt^JUC6VkfCBVuf!V-N8_~BF@?$?p;LdL+w{V8wI-Ea((h2h0K|b1dFePVUZz#px
znL&}oew_Asc|h|B7FUPbtohtquQ8R>vCd^{N)Bv_v$f_;m1YQK=t$!j2eHgE6tYqw
z<pleKFY)?*gZwNbU(dglZF3J^YA~}g)x_Tiv%r<~7A*E{9t_BBU*-+_@&rG@C)QbY
z>aTXJm1z|2k6yr^fOy#O<`+tv$TD}dM;53fjHcT;P+ff?_s21NZA{`^b2CN&!qDe{
z06m&@0#zO}|5>7eyhgpvqb7N91wD^@moT>gBfy+G^;gXh4u?i#&C2*)B66jOoGl_s
zL}W8VXFFI1)D-%rHLP$e=-I81I~1Z5+?$s24=q{ISZDgsy at l)8aM<?<FsKFDmo=dL
zLhc8o7p`Pyp~SD_IyDzFJv64!l0)VI0qTKi9B(hZfi(v`bwosDy<Dc($$8Bhq(E?j
z!kv{3EzjD@(5K(YO`jhn`Jh6KLR5mgcmbbnZ%`7(cL)w1=5Q#?pDN_94C;LEuWNOJ
z{e2B81*wz1+i=b2?`Q949PSv8FF1A&<1foDGpGoj5{x+18J}b0F$W{nL`1rzFyG-`
zo>{~bnMd)JuVAZH?DJ57XOO#L>dbTbSyE at 9UZZMLf44JWsCzxfJtFXkPg?Gczt4By
zxLz*PGc9JlT&7EeCtl7?AO8pLo|{=_U`gMSg)jk*v$%`1*Xt~<C5x>m4p3fwkh7*a
zmQFdS9-1$q#HW at yTtm2#!@b_&-ehqXJ7^^NFu}d`GHx(H*`a=rU=xR%JITm at Um$Ir
zzHFJU{+H0vIz{ax3g%`F!yjfm*YhUh8Zq1fwRc>?)`x$?FDA!WBL;1KIqWJ~{9Vt+
zI8X4&8p+o+6cX$wFXyIHiv-`FBggG2GuD<cd`=DfhYseBQ#%9rBfzA%i+u8sy9FMf
zj_D?&p4{sMdK1#Ou42v|u&(O+`(UBCi?MTa5>#jGwV_F)hO4gST>UAt;hka$9gHZe
zzBgl#3gfS{)Zxx?xR?BdCsqIt)~Wtjqb_o|a~1a0{Y>;k=zl(e!o$NNE~0qyQ%t@`
z;m*kDth-~<?>B(L``(AT?z-pLlAMV&*00B1xQ6ltZ{wyLzsTv;3d^0Np4z8DGPh37
zyYExn at v#K^382N|-d!QNEas`$SDiNJ{NJo9<i{y)0QiH{qmr>4`ftC^n;u%j4R%I=
z7ej8+l6(-{*_#+T7I at TC5WX;uv7eohki|~R6+ph;v!UA#@rG=Y;RoNeZ~0$qxWP72
zjjU5`e0phx`e{I0nfPMhL0~+^eq5tI1MW-*s~z^#?Np}#m!b>cg4C0C_ovv80i!Qe
zCER2Q*Q{}A2UOp%lI_Qwz;)FsW3?)A8e{F)v=Xj%w<mSdA6eYn1i2+^(i9y@yCW&4
zC<Jq7h<;y;{Yn;gF0nW#$V2CF%wua<(L8V8`Ik+o{nV0<SX^<6`X$0zNwA=tpq#Qe
zV{uxP3q(1SLXb{}DA_Zh-fFFsQcI<taMK!hL;5sG>8`fp)OJ|p4(rMC3xT;AT;7#p
zKLGM~7IvjzQfNz|9nwIsdo=R76!%BKQyHOn)BxmJyp5GVEo&3>e&#Rv(7s)qGt|fA
zr~jEN&R@(vaJ8Ad{fAyF;V*t#=<K7uEWveZWI`}oPG$DK+u2^r!l=&hzxZ-~?G#+?
znwc~k0K8IG>6>|?#p2XnCK~7 at KYKR$R)w?n>1e3DucbM!lqZM*%ETeS8#sRKT7H|%
z>?_PbHzoYp{|*>;Zu($95mAe1ZyjLjm;}2JkQUVLQz<?9J}#Vmnnz_HS6(T>b=PrL
zrQ&||d_vIE2DW-(<o7<pSFd>w;p7-gMki)=n5J?67ZzZl+z<4#23P~EPhiCk2O{oj
zKdYI+%*+zk3e!+iSPN`GUCVtI7-cPN0Cn!#wGJrLx3<iN1H5<(Lf^#nJw28wX9bh~
z`}>3ynT4)LvBvMgI~+Kf0;aOw_tUn9oCA^3G2mf$1CO#ESf2u?2&{*-B7Uuq=W=A(
zQUB)((4$cN`>)gUjZbmaM?TM|{`hqau at 1*$1l&u+4nlI|@Z0Y-@>D32P(c&pPm7pK
zN{$-;8^?JlmXK!~&_hZ at N+*h8BC6z=B%oTTGrwG;Mx6obfMGs45;Vn3SQbIysF6_3
z4rR>|u)CxwO-`4J-X&5Z>I{(5gJyt)wIp1fb>akJtq3<@*qC($S7qboW8~RKL`V*Y
zFjA`0K3Qj!GOS5qg~MHKUl0#?Iu-1vU)o{nbr(|m+FHIp at dy<PIDSOP78d+0=JLmc
zSJdmw2^?_=ww+YtmX}TP6H;2=o$#S0Lh$iP{*g{Lb3Kkuy8eDQ@7=0ddigLnz9Qw<
z>^3KSTP44 at UszSKl#DJ<&hBI5 at 56V2d%meTYv&%`wMY{c2mCs49qcf~JA~RbnrjK!
zdCd@?T&yQ^Efq|yf=x0Cbbm_K)%e9<oXGb+yP1psTZuclmhG&~h6@_Phtj7s7rtGw
zZOIs0=p(<i&Koy4E*>az3=Z8blLHG!x#QI#-==H*4*CY_aJ4;5tFYNxJ)#1hSyDTj
z=_DTRms-m$q^w8SLB~Iq`3#Cv<|`gsruf;grTyO=r~OOH2R1_VN3GnrYK*M|DSz-I
zn0#Zv-*PYYu_~_`Nq9?_@bD`%TSz(Wf02B=&C#(+c&Nj%?;*>=t(r6b3|3ra__Gm5
zaa=QZ(o!fvYuypmgo!dtO$gOgQ_z}%7EY~0P!r1ImbjYuF~Si=tW#R45rmr4KT+kv
z|5;}pC-4-TrOMaQOwoS*D3?4XT)sr{3Hm5pTjM>WDepQ)F at CCWR}ASU$0-}&(tk<m
zy{?bH<S5=Z;JM_0XDFpoAw9E%We58HQBD&$?PSNJugvpddKe-^pF7CBKOf>He-!aU
z45L?Re(;rqbGBP9pr1P^v*+d-SM*rwYYbn*F#4N>KWu~fuQGgXSu58gjIWqN-JGy`
zo5m~+c>F5GW7N4FP0PLtfAqtYHLufrVSb*UVyF^OXOcNqa3MVMwjv(~#^@kr42vRV
z5j7@=mRh2n!dc%+`NZXYd<xpPFff`Mp5pQm#rqa3>Vy;!7WO+X=uu3(9o7- at Ae#DF
zG3{5!T=@1JchW<J9k(BT^5O-2FG-pBF_s<6txIuO(lKbK!Z8fe#y9~j?E2h%zC(pE
z_EV?8{`bMxQ-}Kwy!VkZ?;dw7da2@;xd{(os8+Mx+pUgyOw!9ZMLJNgYv=AiS<LOU
zQsGo4IfH%_{S`}j0+OvT!RZXr$p8TfmSQJ_IgKG9CBl&qlc!7zL#$$qn53jIoeonG
zR(*Slza$u4wsnd(|4_KHU1({u7*d1^;y}fg9F8Sa=)zDyGqr9BH@<EW+u4DIqlcl-
z`wbj6u!wV+WmmENp*vjVkzJ0JUvPY>FvVzRnSpl4Q>%qvx8&GBm3?$krN*xpR{3$o
za>Yi=O5=Fo%z$svMVSP3W|>=lC7ij{a?!OZ7v_cj;y(HpJDxm!h+8S}8#Z`U#0G3^
zaA|_AfTfR=W$1}ta^i-Vb&DK at AYu7$V*a7OO0rv1dCKy{r%PPJE>9W67VDsLhT~uF
zaJ+QA<+D>l=X}l1DbNFsUQ%L8^mR<Iq3U?YSKz-p#g&CI`WG1XFWkXHOB6rmOm>nS
z;=KcY7w at L}uK?Vh!f_*iR^nr?7yfaHa7W%TIws709M1iU<9~do&U;x%p7XJ^G4_ at m
zH_R6H=N0L@1OA0s>}4)7J=CMw-1|QR{_>Rp|1w8-Ah9Haj-?L>Z}~gN-`-Z{Eavz(
z(4+%MuxX<*Zbx_!w^I`i`U;x_f_*Tz-!XU4F@MxCi+12xAdgsut3!Hnz%Slp_}YF;
zd#7Uih48<tLVv}PkYGuex+>(WAJ%;GB;m&;#jaRr+hJM#Bggx$N%=UBGmHE9_wj%{
z#{Z$UBCI8*mHo%`a@{eLfFWdz)~905yEW#&4O%W_C;tbSWG*o^`lE#11C~I;c6L){
z_ZrLE^}?;hST>$s;PKM~3}XaLFz?|q at 3~#L at NUNi=TGr#ev}Q=&YXZ6#nDT$Vw{Io
z7(V#L8ei{$O_$~QYYby3>LgS+mnt<Z$`9I3DlCf8x!v48zmM$~M{J|SaNiKsdNu)$
zCS{^y3Px@|dlt8zZBYm%#yIKA|9^Yu78^ww#qr-aGhMdZ-EtMI1q)IP0wG*Xpuv<S
zKB<A25KuHR#s@XT_~Mh%$o7dB-h5FKjlO`FM=uEvLJf+dwt+|pVhgn0mR{&>yX<y$
zX1?RY%=AV}FWZuk_$A-V%s1zp?|iq(Ip;fn&AT3K!)6l|bO42&z^N(r{&`ygdwpw{
zB0>3wogD6MVGCIdO0kJDPz6m9!8Xm&&_+%mB=E8tH>Yt?LEg30x57ot*2}E<pr2P6
zq!JTNj65+qw<=nc1SlF|@zFBGQ;1^%D}V$-hCG_SLGWzQl#(SvmKb+=3{5>z+9<`r
zR3=7V;ayP_SjNDMEBT%^{DWqAz`%3DuttaIakGEVC-58@O0jV$V+i5aQla1SedQYc
zfL1^rSE#sUa2w;eO>F_*KINgF&U3M*m6kh-#q}P$1{IODCO?rN!x6&3L_G|;;G-S+
zm=h^rC(+M_dCgTEI61^i&t_?;vgvGAR9?~4iek7{bC%uM6cG9$XQ2ujJO_{EfjfUS
z(2ZUMstnepGki2);tpvX>A`I?@T?BbA6&=p%HP7Y>mp?E*pJ6qpO%veGK2{VP1Q|!
z$1_-a#^L&|0+(Y$=*uQM`h=%U;R+G1)8((s2Bt at KDEbgy9NdzBzrb%7Exv4oLw`Z-
zA1);(cv|SIQhdE%@i}p9l4$l}V4!bn`nwJ8v>OyEH=(!+bl}t}zB&!jUQP0h at Vx6s
zWZR|CbpTGS^SHob9F77n<F=X%^$ESVBiJ<Jl18XTqp<r7`r<-qy|AMoP{3DqkArPM
z+re&r?SjEBp|@Qzyv;&_Nuv1yyH^<U6n&InQ%2i+9-scAdE=&L!!^xjQ4saWCk*~P
zYVk3v=;X<nn<I+ClvhgC)Uf)}g;d(+J4~90GtA0Mu)f7*$r8x#HMq$mq=}H_bzD-R
zQ(Z;7%h=E@M7CJmAj2SnP=~=6SQLnJm#Xs~YcqLDmc!ugr8HAP4-vAQKuDrFjKvuq
z|1r<<iW1tkzrY>7!DSx?mxwpsW#d-CvMfxZh&zl}3TXzdO6YmQqKg7+E*QkN#<&%)
zV}LgaE@ZLjbb>1JD0?MNng|(|Vel_YI~~?H3ac#8HHywegd61OCy7H6%`usgDWd2B
z02)Qa_Wh_SKSH5;Of+>9niMi(V+nu9QcBSgv^$9xxJUGe&8ZH9UOzDhX&{Rxj&KxB
z4?-9wUgsO^f`4K?N=F&Ig-JuO7gSF;@0!pg5t2Yhpzb5VpoX at fL&{(?ih3Xk97B)r
zt4C3d!FCKDMe{dasQA!)Gm`-rF}lyC0yRKn<QbwQg&|-_3QNufHH9IF8uxwJcCvRO
zq2u2ep>YmN1jDa0r4v4%qNYN6W9tOkGPd1>K61#E6qYc_w-TlZ<eB^Fu-Fx_2WSp#
zANLTdtPJiAx0ee*n#`P-B{uqWhOV&yAPd0ia(@M+CzmhmM|=A;{L42fGFN3|(EeIG
z3g6%S^HgCfMGnA<O2}70PR2OGiN*ZH9=Y7)w^3p-U%*^$VH6sp#8+s{QKLL!vxyd&
zlwJ@rKmCtM(7!>SUAKs|F31@$wb^<)NR-)t2F*p7aY%Q?^O*%G&usfw+yIOdZ0_ho
z3e-3RqFH*CrdH6z4Ck|QJk9$AnJlODJmtez4;&i(VUuwxM}3i7(EVr1T#)4!Y)cx=
z{iEh8&rJI>UAwW{^+PaoAO13S_TO`tZoUrT|I6IUfA~!y9(xNz)&Kwi07*qoM6N<$
Ef*adUIsgCw

literal 0
HcmV?d00001

diff --git a/docs/images/circuitco-logo.png b/docs/images/circuitco-logo.png
new file mode 100644
index 0000000000000000000000000000000000000000..8b315da4d8ff1b1fa373f5675d45599df446c321
GIT binary patch
literal 10750
zcmV<aDFN1rP)<h;3K|Lk000e1NJLTq006!K001xu1^@s6ug<_V0000PbVXQnQ*UN;
zcVTj606}DLVr3vnZDD6+Qe|Oed2z{QJOBVGph-kQRCwC#eF=12#hGs1-n-S>B}?)m
z*^=cQY=alJ!59oS+hdt5W0(m^2;m)=>?C0(5CTaclbJ9~LXrvFc?p?7fG`f3#KcRC
z1I9ZTVdG7*Woxq}Yq7SLdb{uYZdbKSt=`0hGiR{-oYK9zw{G34fB*mbtFB?1ra1dM
z`#aNqwzD8O`#VecXMbmZXUNZ?PC`X_+GRrsGb+T$h!DlaLYz8<3LznUIYM|n!WoW;
zubjI;9PsA~XEd6!ab-r~=*8h09IwZ5DoVd$7@Kf>8KoKLVVf;G9vmJXKHW>hu-=iA
zlY?#+i(oJ)`uqEZ&*!s_tn2l9MQ(0xyf1vl<MCK^`HQ0er!c+|jJ2es#5zVIk(g9K
zpX_$KaJgL8wcg%dt1Y$}4u`Eac;tK1^`Gx{I-OR(LVzRN;&VJ_fAn`{^NYq{?nhaH
zwr|3*8l?|yZN~r4<4BlBRoihXhj;KA3*ViMnVShOgAS+o)uwf#XlO`80UJ?XAw)xi
z5N;P}1!%X~2>>Ao at 8JNBpre^HKmq+ibajntD~R#ma^=+`iniQtxA6P at R$m7O1}qpW
z{IKtY0q-gN at YmDRBl7a{Ec_5RgM)+C82LYGgy&B^_0(v>{{Vk8 at xp(=@hX%e6gNr)
z*Dk^FZ_xRF!|^%d^Q;`o`Zo*kyBEh*D1|7*d=%F%#_?v9M^Ju`5<Uy63=)65zbswi
z8c4U_03mZ?Y9#)nXe&Tj48ngBT<gU7vt)>~D9QMn3wS;biMK2PrWDQjC`(a(1(<#b
zuzl*RK=}*X`2KJ>69d?Qpzi=dluicKOtOOeUNFa_s6Qbivz_4)C=jv>u(}WBvUD&-
z at d2*iz#~h}lK5Yc at I$ayAKJS|{8eX%2*ZYpCfJe^NpoO}T at D1;X^*8Vuy+fAtQ%1r
zX&5AKmwy<493O4}46r&MWo{;TN|;sxZWkJ{pGdIx4e28kO3j<9@P6)xF$nU$O`VX-
zE$-d3Tli<q6>BT2;0s5EeY8ZLLZZ(`N=xEigwv;!Fpxszhh7RPhs{VLNaSw<n4^%e
z$mDcNm=>WeH;%&z?dId!H}SsObmk at M*zrsUPU%l{j=>F`TlB*`lL+4;exFbL{o5dZ
zc-p_IogqvB)&b<1F@ik_z}ceFXjX)e`i+c4BoaN5d?pZmqB*AsTNfOFM<3uBPz;hz
zsK|Q(v=dIOhi40+J^v3ha!tCvPy>0r-VvOBHyPoF(T9t=P72sx|Lcg~@!!Of2<G_2
zC*R#G@;q+wY)!2twHz_T?1h814*<R-jRdpmJDtuj%FC!1(GjOYhS`QXKTO0g;bMjB
zG-e<?>rrac5xso27tg+}2w$&{Ya#qUlu0Pbesp_0o=7qr2GPGqwrmy-3a2xQ at F_h=
z{B|L3KG7=t;QW7|IZFUa!fBcTzu$i!q{^>GMn)zks&Iu|A{O<22xRQnePxHkVZ~w7
zG0lhhM`=rjXFQun`F}@FPR>st5atI00Sl(OP|#tDdXKwYuGghDO{yU>5x%@{htxL`
zg%7dPo0}`TJRVUBJe at I7okSpnfS{{dn#5PPZ4)J&WFql9otp~_3-16Db`t2EcwnI<
zCn6z9`ihE*z5~F1ONHH7kBB4TpQ%Kz%se&8M9I(p2{XXuzX}QpJ`G{9O__o^Ou;B!
zfa!xipYJgc>i`K>6~a{=vvH>7eMXOLs!yr}9ZqrQTf0OqH1Zi|<BzfVy<TzQ(MIvo
zxeG*BPL7BU3=k220Ad<|i1Pr%ML<vm06zc()<F}zi|d<*hK8)!R0UKb=WOzvh%-Kq
zoSh_0ICBZu{Sol02W&3@tQG>klX2_^gS-nEzXd_^22DgIK*$tIy7Pb3wL+mvt7M2Y
z+4u~Z4_YRUmjQ^o8x9{7-v5PWPWFUPpoPO8h?Y6R>8KQj%`MC*MjUF#wMG#U&DOLu
z3vd<T6tdH0Nditc19%4k;DbQma{!_XN7|Ss5lVB0h~czyqUwI%YRqQyp<IJ98EqcL
zrQc at r90+AH3g;b)Wjh1-zX|0Ct_}Q8+WcyIp3<Fy0x)d=EE{nBKX7zQm_|vggei%d
z)AUM+D1s&N=H}*hGfjkb(g_&F82$bIeLN@gDQ2WO+mHX<Oz%i+BOG=Ln=u>QGF8}2
zFYYr(qr;+=aQOIt1FwX^bo6B^L#-SG{_j9JjB#}Q<p at 8PV{x&VJo%%dsCYSy@e&M%
zqM0!)h>UO$B4}9j^&Jz#f$ccofvX#WHhV8YVK<CxfQaenpbf+wmF7%TT1O0(88Sk_
zer!N_SDc<{EXMV(F&u}YL)NQIG+bw3p91F~%1`+o9B*rCYPuT?SB<vaB_$=>^78V2
zn+m~rCLaL(82WeJ(W6J_gRp$4>y-B*xHk-G*AK>g7ssv4hrzA4<oyzqRVd{oyflz>
zGJi&n at g&ZxQT`gGRE}W`<WW2_hQ0>nRV`9;5snwcKo|SzFcqg~bA71uI*!}fH>pke
z>^Xo<+3@ginKEh8NqjJwAB6P;&VwNQ9cbeTykH;*Enp_n3N$(h`v$Ra;VRHdg>bpO
zV1O9sMIs^4M?ee?w1WF~qwW at 5->656T#;}x{LsH(PSP^q^)fJSCHmq)A&yMk3lcxj
zfcv2V*W>?946M9=!ViUVL{-%f#I)*<LUiOyppNEl1Gw?~g(xbjLJuz@6PQC=Zhz!=
zYhJ$Z#+$;21_$r#Y-w3RLQQ3_OJo|gwY3br?L$$RDDCLz_&f;FnPl?C&<G?{RaNy2
z0O4zIZ-3^*i4)gDBKVXuN5!IST3(~tmJ-xJ+ZVR9wEVQUx3^X%(xv>N&MX|RhyA=2
z at 4E@lo&o_?0ulFjc6L?)_$fsvn99h{&#$YfsAvEoorJkE7gG6ac)lRjbF{6A^C?rN
z1R%NBqkj?h9sT(0wzjsr(WaS7J4!RgR#{p3efU^!L1Kq!A^{E`>FMdY6VKZ5tScLH
z6614&NjP3nUS3{?{yy7pcMSY&`xa3QU(TAmj6 at 7EapL#HjG3PjK3 at SuvvZ6VU_H`G
zF=!=fF2Vgzik&;Yjypezg+^`S>&uo4$MA at dl7OM`i&|S-zlAX`MxVV(ASL;gojP at j
z0`^KUz$pm3H5fNTuubD5{BXDogLp<%R$eWG>0{N|n3gQ#(T}4uKRh6YT44S7at43^
z51pfQgf9v56p&$R^{BTEJa13q<Qg*DvI)|94G4dQnyHkMjDLb8e7y}46bRw^hK7b;
zfcWxM)?yYDLX<RlXwQ)KnHXjRQMl7RFS7}qN}J)FW1|*yq<T&<s#Nh&<@D410!-X&
zGgUUHvfrh~ifH|h;GKNdo^2+mZuW2}Y${|kL=iJm8AW1(TusgM5Rlgi=3Ei(kw_-z
zg$VJBSdLbV!C*G^czwbc=CpyxLm$7lZ{NP#sDZN$au7ejC(CEMySuLhqkbE3Oqv7c
z7{!q>qIZj_Ro at 2(Ut<j-8qL-a6&8cojHqzfWs^2ewnT{Jbc8PnbC86efP7OTFrD4!
zJa+8Zm%;HRs$PQnHgzPk4v2mp80CimP9DRB*-o;_BZ<kB%tBWs#6CvSAX}Ogrly5V
zWsj$NP9uC%#qy<NIwav@WSR${IfQ3Tt^cO9j>bpzlJKqfqMZrw6P(1E&u55&!be2a
z)N2K$aVRt%&z%x4qEz^oFIyp8=<~2)6u~in8fMLn((lR&KZ&h(b#+xkyFLc(Tnd;y
zCYd$~;nN}I3-Ss+DJGO%Cmq`H421G8mVXTd37XqBBS@93q<T7u&q)<sb*u1QCc>vm
z#~@1*)xM_2Ey7Xl0Ek5}hwg=TsHC%&?X0k#H<YL$G7-KORWW2+hSX*vONk#}Cx8+p
z^Wo=6*H_t}h!Q4x&Qm6*Hq{vT>jQ3I-MwApb1j0;ce$7{`A#(I65}OKj*aF&jz at Fz
zEbW2u`arCYA31X5MiqK}zq9r-k3S!6eRIy7IYVgc$2yK2n&>2SO2vfIPl0fYvNCVR
z5IzQPw~<Y)e{mL+YF%Wo@yXc{eU?(0E13viXOblCT9TEKB`yM?S%UM6pdnT(;z~yV
z$tK)%!j}@C=0n;=Bs!s~BPDjWgii(qvx<`^PYOAU%6Dc%_?E=i`>q_?@esa+3pECm
zfXglN8RaW4|E91zyyK=7MK7Qg`UwAc at uea!IKpVu9S08{T&*-?I-*yw$uth&+kfcL
zp>Hl&u;5)h^XIXI?|`|Lm-iV!_8d!Pnb~r%5%Vz>;Zx$<9g?GsP&R}wCs?9-{9X}r
zx at WU7O{j68HpRk)3%QCX7n1%nTye$lX(WR!st84wm@34l%n&k`>SqR1$Iwi%xWrH8
zpz7l$Q>mCdj!^~ERPWSG9hzjOPVg%CDO(#~joVsnW=8ENf!hd#h;TWtF!S;kfmUqd
z{Y+s|%ag!Se37s)9gboU{e$#fIA at R!H`@3zCG}Z#VbV^3Y5R at Z+S)x-TB8ZyZkr^$
zzKc-R7bAQ#J-1o}A3Z&0B9Nwz9guOkOzV0~C8s4`jgXQOel`+cA0!c^%qIenuaKsW
z0drwiYisMOWEvusd7@^JmG(g?(46o%;b&v&7%>%L^@W7b>!}czhAAw<*Ox6OgM*Tm
z%0`wMow;CsC(S063X!E>BSLt7z-IT{+Sx90A)TYSdAABW?2$-z(wzihjuzQ?zuS(!
zINfgBU{B9&&}jK8JtLj=<XDIo^}qCe(rUlX&dzftO`7xxTzY&o;d?ySg7|A=M4v&z
zGl_B}xLpK88&SDEcFkaZca0TOr(G$d9(ZY5iJ!^A%O(X^bH3n{Pdo`}-o)@Dq`Mc4
zP{@0IeSKb(>i}H0T0@(TX#9SE7!u-FFfBN at Fv3t8h;0%~rXDR)L`X$dx<H1$S<*sE
zP@6J!Qb}IjJW?qKl3wEB`*dSa5})U#rKO^vfKf)<ro6m7C+{^kH?QjH>6w%%8dX+S
z)(i*nS+MuuVEM%QZ~S at VfHN8?4ZGdTP{Em%L<$Dq5uxC#psN!yvgLuepN3BEdHKA>
z!sYea5AE5rnnFvhpG{{Sz-C{Iact%yCir(N8yXreNQ~Si(h*FalH<pZuO3VI4(H|Q
z(gYEXWRUhK!y~^GBf}3v4D65BwOPbZ2@u!8l#H1qzEZ)dOr2~TF$IwM^XESY0Q`G#
zad9VzzP7x){I;B&oOa&F{~k!YbBIhOEmE~rSXkH!oA5yp%P&FrL#ln5GT=ae!*Ujp
z_De>Ip9lkK>e$rvWaCrgRx`HAq*yvBrzAelCDF637r_K;z|>LL(=R{>+?43c=s#+P
z{QUeQGiJ_w1YFwR<nf4ZIHG03SZW%u3^F;MhDG#$gn;~-7!K6M1*+u$f-55t+keiU
zD{=z?cTabBh31>2WFZj!e^ypjehK|*V_l4m8x}mafB*jF)MBaN!TBJVJQc~pnNvk1
z?9aUF)ocVN9u_(N{T8vyX(WRthTRsjR9`q0b8>;dOb)6>_+}#Ek0SyR2BAI=q<$V;
z-NT&_@Y@eb^(G0G&%?yAL89cRBQ}}YI8t3*{Tn>{1b0=S1mbmQ3u`w9Xq0eFhy_PE
zx0y^GMZ{`SO~&!#6KbglUol;xpOH=z>V&T%BXZ0p#uJpd7*X#?=VwqLHPqMpCYP1<
z_i>j9_=0GpK!hS9izU(lboLGawMi5eX;Y4%4~L!97|Cb;Pc-TQJl*LCpZ6ey0 at J2V
z`w_;|rqWxWf$M5&YJPs;z=7q;bWCNk;T at hagb$Q>K&Ez;Z<CttMTzNg<}h+&5w{9s
zLeL9`&5z!Mzz`#rNhb%AiSU*5Vo?rTwi2KBAmMvw&z^lRxVmTN%$Wk}Pa*##fzi>?
zA*3_uOxLC)4w^K@^bb^Wmg*xVAb{@!07n>wGESRw*+_g-#?h^FGZvFf*%$q~Qse4>
z&ELor)rk|evgtLm$)+<`8gt7S8X7Y8wY7<d4!$Q!gTo?hw>u51{Y(PMaG5UmBx?p$
zN#m$|#$l;37o6IF83Rb#=$O>Dwm={-S=se+3lTdsd8P7O()lW!Q;G*MwNCbeQi2vY
zhSL_mF+BVWwDNI`J4Ys`Re at RVH%5Xx(ayPy?3jiH7P~@Fru0{p5}|wQdNd+cq3Hs1
zW&i|vf+0(oDU`~iB&J-L!O&hnNxx)8N at rVLUEPg4cI@~Ce1%!EFFrhf1#IG%cJ12r
zIDj6N65LdTpRTV`Lc7sN&y*=sxc3XquAEHclW?IEXlUBeCQGJtVxhxRr6a5VGo>Xf
zt$}lEc6ktlH4Pfi6(iaq(1DqOPFU>5$jA$L`R!;h4~2rY9OZN1rZ>>iQad!N%jp~f
z(GIBna#HmN#O>d<ZQCOl%V$w4(63pr-5=b#b?aAk>meCD=xYL>{bMA)>2&NyCu=d<
zi6T=FB@~_w)8_vH0LK7DsIzD#C@|NWg0}LDW6c^dCoZkjR-H>sN6uE_OKlO<pJi4e
z!<USGvz-YOCh!=BbZE(D{VwYH0L;IwudlxbjC2eL$?5FuoC4FwH*em&^~|rK2~<>6
z)PuV9c;w=AQ5N<MT4zR6Q`4Q(r%#^*v*}J~B}1hQr*bU$4!r9Wj!`WQBcsIE%}ZU%
zE9o!iOAPgVGWe=oe>&o<OEVzk_CRGtc(X-B2hf2`lS>8%GQ|jv{1`suz4&(kohwJf
zMUeb1qsZfVc+)y@|FRX~iBqP$11Gg6U6_?ov9`9hX=~T6{UKogFefizx90*@4#F}O
zJU9+8)*ysV-B=sn<6R?$0vCcyCt9<v8N(=Hj~Ed%<4#Oe#_~BuZY at AIDDiF5k;@e0
zPHO7tar88%jwyFyGj#-#|G4v(meW4e-`~F;TH!XT$aD^_nq38ui(6V+iuJsB#bhK(
zFjxnOco&d$TRNwi^_d?7X1W!cWHq&lLU5|_5m{(Ih;o?k($b4<Y7QXPvwFlw*P!}1
zq@R&~(kdotWyYszrJ7swJ2qRLa5@^{u$E*+D<bR`Bf;r$T2T|&fPn|^7#R*ks;5tX
zYS;GdH)pfd6x!0=+}!L|u+0>n<~Sh0n&G=WIhOF<?l*<k`=;pcTPmVqTXq8)C3>wH
zTPsfob}<9_+%6=NMe3^x0_hP31^7&aF9&Suv%cy_vq#e)A#nW$NZfaJ at 7_J1S|OVm
zOPxUVv;|)0Bv^ia{(CT8Mj+AM$@-AQ_O_*qq at 0cb2HF3^XuDo*JE)Gj`cLJn$oqyq
z7R5Z0@NL-;K8nj?B$5czYt%q;bDtKyz4L?#0cgCBH56neyTdSH#d(X0=vZx-HEY(J
z+qZAONG(drgd5%APZyHqY&U$sKR`=t9Bbp-Y!S1#_-Wzw)mi%-S~gmE`~`y%GExDj
z#SxY9>I{3p#3jBiowC_KMk3gjDA^JL$Nqrud(J)g+<yVVM!6Sbw(aZvBr&Oe@_zvH
zAb|Q`>V7u1b0*uKjvAfn+S=One!u^1MwIBd(PYDQ2asvY(r+3Civ%+=<9<hyiQHC_
zA=-P}<`Bd56YOB19RKqoH}8P87v}q+6T%8YG74DMbaz>%=+Y%iz5xHMPcF0>H+~We
zg$Iu?Pd5Ya-yOB!epHg0$Fm=v;iEX7vNnt*@zajWwonb)?NO#I#C%@Uu7}`K6*a4=
zB&;gwp3#aSbM})Gf5Mv6U}a_HZ<jA${!107*6rm?MWs3`Cy|5>Y0@%h&YUNKuv26v
z<&$LFW@7s)rC`R483(3KoAwKwa{-8$J9n;FwQ3b};_c|SJ<~hXItP_PomhyQO#P7>
zm60%m8wuP6bGD7iW7L8+Td$Zj`5xi(whFGX9xtu1eVZM0Zx?s%+%5)OF6OK5TC!xx
zJ*B0k1B9h6NXA>#=CU(q&fEpU|2mkddzAT^m{x4&=RGT`tM3thf0s2NN`H1z<yns@
zQ4!DNv?RXWjF~zX;WG$eOS9FTuBwc58IkD<IGZzwu4F1dNeXoTqD70oa{1+#zeuS{
z0I4{8rlJ^4&(5S&fw}YNOE10j0Z8P2{;wD++x{yJppaEnRn>OcWtZJoR#x^l`zU<`
z)mNul{GIL{+7wb!VPKh|TI4HPe<aMDfk43M9~=~pfdOm#H5<c*C}xgtqnKX%MNyD{
z+@ci<%e1r-IZZ2!9&#Tgrip{GFFk(Dn$ks|p1k0K3%)#c>eMzh=JCK%ZAru5`RAX%
z>6~-UxqEPMa95%QFxDFj1%+8u^pxRtcZ;UxFNqUvmxw?>&bHZNMJ1-imYc~XiXpiz
zw2g`5 at O3Te=hPNOWQsZ4bmuk|@usljsJ5M{>gvvt)GjAMsJFv at J`Q_-bz@`WME%*s
ztjvVAJP9cTT%H%m&CPxMiYu<@fA78b?rvykIFA{jiG9%9O*V-}zXN8|8;ch&{sCuL
zxjt6kaYE*?IAr=m+Bm*O_(n2Yn3FlW)=2fk*xU;iEHG$l4WZ9la(v>Z#v@!e$}O)U
zDDz)5=FI64jg9w+_V$%xXfT$NZb(`&bXqZERsrAVb{j&j6(A%(df+|ryYm)Xodxke
z3H&reyL}Guyb7kCUB^wL`Id<HNs}gZfZ$((7Jd}IR|99R6Mu2ScPipwgCOEye!<Hy
zB;PU%3RW9E-Pell?sLG^c^0?wMXX0hmiwT4e641#zd=kWdkwn(u!u%P5J(#|Y~|os
zXQuQ~ay5RwggOok*ptOHHq&*ve$<D0rxG0?B8<+G0ub#-X#@7d?z;zswH9W?Er$;u
zUf$i^J&mcqdOv7pfT)Kc&5r>QdqJ4bQWEKV=d-<@o}LIK|1;1gTT%Z?++W$++By$y
zR-z<jV737VHdI_(+yv=<0KUgMm}0M#l$0E0KNZodNi-?>i^ve!2nD%**hqvu%^W;i
zoQ)5Pew4xNa*}vV;9&;{nmg!SQ-4T!xcv#WMo#VqV at l<Iv#k7DapJ_sjsCuQVqjo`
zCDkJl744II=KETO&)0006mP{bzBZN=@QITh;@?iEB(GhzY}sxQ@KyWv?YpI=rDZ{T
zdwT^<pk%ZJ*wYN$5A$#<oaFxi?EZZ0*s*Xbfg30Md%AnAV-L9Ufr4C7X;>857%VP+
z1kTKJCfEq5njuDpD=`@E*dG!ucZcwL4jbqZ-rOmQi;uzJ7Hi5XL~&^aS4zKJR$Sc3
zNJcs at 9rw6t(E*h^F0b`Mg8o*j_O!?WVGjV2BZ|;<kAB^{b@9jyKN<iN!rFyEsZkKq
zMySNCIG+JWwfu$~ZkXNM+e=1ra1k>AdK}WR0f6rUqqKr3dq{XBc&0Gy*|R6kU{KFY
zf!z;c-Vb7VVaJXg6}UDL#5 at Ne;))<@7AM<<bZ1))U0q!V@k|H$&<>_MK}VKhSQ5M1
zQY0i-Hu1ec!)w=Gdu<M`8Hp>_5|Y&1OxZvik;Hw9fRE at Umt68)jAt78CkbvinaUY#
zH<*}TZ#b#6b}1xw-SipaBhAMctG1#&)`Vy<*aGkS2>^7hXf-R$88bO2RBg at g(4=uX
zJB7zxZ?v?wh at zq%QCfObXj_<5?5^nR75{2D^_kiZ!10%W#RkB4%GFn2J)K#WfKe6G
zPq<4QaDNi;=2k239zTA(apA&+$H1fmM~)mx8ySid{wuMyjv|N`_VmCU=pPjS41iZt
zO@%^@5KE21>)+xGhhQK^nQ$M4mluw>KxmzvF`G>;NH~~ZDDq+UxDDgyMTLdWWnr!u
z7#z3bGPUfy6E!t8cc}26{!22+!Sn%cnI|@F+7!=!A%VBGwFwntCvozt8Jyu=v0{ZH
ze8z=`0LVS814s2$5WbUk7y1-pLKjmW>g(&Rc2ou-+j;%<*DVdAOMiaFLw>>I1lm6V
zW_lZK{vO91AdK60!$fw6s6{~F!+ZDc6<{i%9AgqZbB%WH+-XU%`Sa(;zXC%<qMfy1
znm_4#<tUga^GnVYQ<!i8e}w%~gs+x9f+>ET*hUh6hyp9hF>T(w*&3I%-3Z2f3&#k8
zf1zr!MMTlq<O53+I?yDFig#FMRwV4?R3<tQvMhwAX5AkgJ#lD#J!PylKv<%mC#FxI
zz7sHe5%{svt0^ck#$mvupSU at A@Sp{&bd!l=2tQYgpC1l|#W2cURCR5g;%AW&F<U0;
z+~3(5ts4#o2f+DHSCosXE~ng2CuaJ5xxGj1-nNbVK48q@Af!q#Sq?>_`9fqX!d1)W
zs;jFzbsJ8_p-C*djm?M$>+o43M<IA1wxLygcLg3vWNMePrAwCz*yHf!tM$xDO6}0D
zUAsnY-$!W+)hQsonbK<!g50?*{v3P->%5|(Vicjt82liZW>A?dDzQx^iIL#hCytFw
z#!nfsE^OTRhEg(}I)uK2Km=6nRy(|Y=+Gf6CyD<<)mxuN;`3zkEnBu&0ziEhhwmbR
zELpO|s;7SzNC_3zdGpOTt<`HhXTqLJ0;5)HrXPp%<@JqX?Ti|c7t6Rjy>{EQd_Ob9
zG#JpollM%`oTk|}&d|RM9E5S~Q5$BlsAZYsS+Eqh|DbBeW|T5wf(8qjMQCtx*C%>-
zjmX6PGENf at 2Sk*PEeQmJ4S2jl578*%A+VH#M?gc>#&fUPc_Jq<yH4F_;u-r{S662d
zl%C?NEmj|uv8V{&+U`!y)asK_G8C!e`|(Hs34`w?p)11Gqams;2}d^{bYDcZuTOxH
zNTI>3u``w8=+UFr`_=Y;Y*&Th62DW$_pq)qeUfb`t7TwX*V)JA%a;qP`~wFL#3Ms=
zpp{?3u at Wz^r7Z?vn;SN4u(TPayo!VCLPrt4!sQ6A6`|ig;);u2IBuFgPL~+Lv+Ji$
z5xI7UxZ+5owYxGcgD~-j=U<yMb2MS2d>qUX1#CI_2*1ZN`#1&)sFf>MT79F5N%*Tt
zMAjwjsDTwTQ#dhMk at cuKnZHFCKlIQ;NuxS6uqIfJCh&)w-OzQgyePaQ!pmi04u|0~
zj0<qTzBdx-91KcnA(5T$j;~3jE1e7AwNiSk52Pt#qI4#4Dd$ZQED?h`%quPgqO4uF
zDD^0D<cccJka9<bNzycI$2*vF9{@rp;{Pcq+cK@CW#RitP>RT<GiTu$@2Dg!&<;0I
zvObUiA~>!-C?*M-oLM1{r%<np>tRV?9535ep;BrKN^+j79m)7EMNG<^(W5_!^ANJ%
z?AH(weNqd<vcDCm!;e9n!1ZP>-lu<~G9I;!XIZ$L-2}kxB*rxS+H0 at HVWJp_^?)00
zO*o7;PvV{YegStYYu0UZn6si2<8 at OAz(0(dvAwMf_6_Y^bg({_iL5eA$)r}eGb+y8
zyML@hj`vnin<hT!pG^y|F?WMsF!>Gu^a%jqZ{(gNSJ|xjSa5eB;0cb5 at Y6llU{I6s
zKQq!9+H!#m{EQ5d8=<DTtZpUheHBDi!l;H+>D+%Nm!GsroS5J>6h8=ypSxLr@)h+p
z6%`dRVynC!#`*VA7Ng8V`5dnQn7fkUnJSc3lvE at t?!qQwADdG at pNM@4MD3JjoIae+
z(Lta2-Wed^Wgtig#&QkLzYY!JP!d_zCA^+QSxva%`ls~RxqOc`UOjXuiQS=Kp)sTC
zh)cwFQd11zML+yZ4 at N)!9`Cv~VbS;%{PYj{c`4d|5cOATIr(gs`58G%GoVaH{kzfT
z6qU21a{OgBD20I?@A at LH-Hi9TaO7@gvpC}`-|1Gc<l0$^0Xv3ZkEPjCEcihe&Hxvu
zlaZ|ZMvhEsVO{HbVu6IUB>Z^y{Tc7ip(XzCFabc?he1Eh+;-T94}<G3#z4vC`MAdw
zOnU)@-$82C;re1)2RKp+m7*L#*+@ijUwnS$1ce_Xdj*Bkm|y9mEyR~`Tf7$e`pKww
zwQQ>geKC_HdlTT?cAP1~p8;|L+G_m2147F2&V7`IxW-QlT`u3%fU*<iLR>pv#5RFq
z*z-?}R^WUI3bXclWPLK-5MaPbkAB>n$jzr{t<dTMk?hkxIhuny4S4@UC?A8`U5)xb
z4>9Co7&SOwE at Ge5VaSXt{13_JDAJbUKDFy{9D5}!*q^z44+=wlTTm8DICA020lc5u
zC!}jGIWBZL at B~+dG3}Yc2jlQVy)Vaoeh$<Dm~De#+0N}8Wdx01pS)1SwqR7>-sDH+
zxF;tGe>U!O9Pa=Ie_(PXn1H)cRimvdC36nq`m1<XGp<iU-I<ahNE0KV?-!^IQO*;w
z57YIcKDR|2GSX+rT4v4%F7b&>ls*7&Hh_C8I(Iz=TLEI)g5xCI`xgQoz-Yz!XCc`c
zPyPt*f13-iaqlqB|1XYLkQh;?8~1zhe-8nVI{$=gjKkJ*zkFQhCn;&Jl;ZqB+%H2t
zB7h$I-=c7VfvM%x<fFY+DBM;sK&ejcLVFXE_*o#c4t3|D+>Z9i1V55nTzBGlGw$Dk
z^KO(wBxaPAjQykj$2d+(a+F+ at 8&R%gTX@$O at UC8*x8oXTq(&$eX&Om*1wjZiaF3Gy
zI-Kv|c6~tF47C3Rv`>lp4vrNlUql^#dWX{XbNmbs8IFCxJ03z?e}{Iaq2Koa7Bjgi
zED9z2C+Q;sA4hP03F<9Dv2u;rXZkVRfC>GgN%9^1UjwtSU4BpOb`*YJxEarOp?m at 7
zm*F`RV+f)RZY_8V at k@A0=W#X4g<Q0OI{i4OIn;@|pT_w3>DKA^|2`4>oDdmtDnI9n
zag!b@(FVWBI9t-g931cB3_i{uMH^k57m#oksS4q{d-rb3e*eHFzMK at H1jvDur-aBy
zr=P?B>j2anfP_Cmdi)gUJ)HcJ5}B&}*O0(Jp#;Ie=1_v-{(2yD8)M1%{|yZ0D|{Eu
zcgbCS*GpTq8UUdr;I<Dx(o6{2l2_`pj`CfMxrXTA@EQqUMQj+OcQ9ne9js%&jp*;Q
z{0<Zu3H|#N#@Hp>dsUhVlW={|l0K)m1niX(mBiMMHv7=WjSLIonR=Q8a at nCWLrj^$
z*n+ll_?1W0oe$zCAwD2?IpE%xx8j^@T$=$8Zj}0na!$F1m++t|N1p=P^l2PN0K=Qm
z)~``_tsK+urFQizxRCMT7j>ea{L0}MQU3v$h7STK%+r~SHuOCt_sWlK4 at g*Y5ZnoQ
zSUKkWk_xpeVAq6aDI^Y{KSvmqLO*Hie;WN<2bexD$NxuM|7V<%DLYXAT|E0e8C2MX
z|6jzj|B5zVWBLQ?yn<tUCc-3a7@l0TXwe5t_|mB>B5?wUKZcnTpfgFpqT{r`+fm1+
z*{(L}h at X&~c?RWf#ip#sjb;l#Y+h^aCDfgixM8`U<2vqYOVv*2k&;VAYy5tHv09O(
zh1j~OPEr3ZwE0u6R?|Louo#4PjFUCm#-bgAu`hM7FF|S)^eg@;ZH#deN*K>@f~*Yp
z`3)}ao=_xBJBMUeYgc6Y2PzFg^9ks)?1M1)868?ks2`yIM{sQ$H+)jsie>{G-CV#k
zU at hYbhiS8OAI@PJDJo~yrA#C4$M|S$(+2?U1dEkvg?jlYd9fu3hML&2VO$HqO!XMc
zV<?3C4fvlXX8_L@pp7OOvC89Tm$)U0^dpErPKM>nO=anj7vQ-8=_4`7P$a)h!~PJq
z1gc-*OGZ{4a<^zNj)&2I&KOge<WZPNNB;rTzY_Hy#l3Ig`rDa8m+RNBx8_?uh;Jn%
z+W6Mi59oLifYCxpswP&5JdykhDh@4rDHAhB6&Koh1%s|Zo9E)#g#RfOX&-X``IkTl
z-$ncXi1YVoO9KfXlV*?gV`z;8gMQqPHon1aw(<Nf`f8{*18r8}+Joq~z7W(dnT8t(
z{hH6>oPGuWujO8yc=jp0s}A=*&ks>k>Y@&bdA;;aR9jJzd?hlq*ZC-)!820<D<7VJ
zhW-MbdrDtie+U21#s9_VC$$>)6FpzvqXx{!y&F+BN<w76J!pq^_8Qc^9`GWucc72w
zVT|)||0Qh`SrW!y;ryc*%R#g=jkY}g-z80s+i|{~ZSwQ0I6j4T+PF1`3=Qwb^S9v{
zE)*#S!EvT{pO)dNU|>o{pcU{BbeK`^IF9GaXWqawOA~f9Hl+5<10!)VlG>v<Swdk_
w;za+}tXX5ti2tR3#@R2Aoc*1NzyB}507_+qH4Lc@VE_OC07*qoM6N<$g0!k-E&u=k

literal 0
HcmV?d00001

diff --git a/docs/images/fluendo-logo.png b/docs/images/fluendo-logo.png
new file mode 100644
index 0000000000000000000000000000000000000000..b4d02cb668cc4e17d667fba42419747ff9284a63
GIT binary patch
literal 9098
zcmV;5BX!(~P)<h;3K|Lk000e1NJLTq007(o001)x1^@s6{77cj00006VoOIv0RI60
z0RN!9r;`8x010qNS#tmY3ljhU3ljkVnw%H_000McNliru-U$>8DjY=n97O;CAOJ~3
zK~#9!?VWp=WL0_YfA3nms=8+wM(%Rc1R+KcHGvp47ki at 7Bt9k@>;{YnuP_N3lVdcI
z2vis1g-D(lL8B8?@J8%5nhQ$KF>!_{Xgo7YqKt|_KoJ;5uER`s)!uu3=a0RrXU}F=
zcXdxQNS<Ev)YH?|ReP<y)_T|XeeZYKGBf6FLeP;6pe=)3Y)VXH`2;64reC=AApYg!
zhqJx=AcySNpm)D$W}-K1G`-Pn1$wyvSTj=m?51Jv`mKiJo`;~>$XU~DfH^j7xS6vy
z&(J}%k%_Ryl)M>iqs)r2bj+9pEU?m6+GC_?KEO$mF)1-A!-9~^EC^(paNz&^pacJI
z=e_rQ_+n;uWwcxa6Xcd6HINL<FkHM~r86_kIlMFSR5%BD$Vu!|ulm><&bs_n)- at HF
zA2-|yV3U|lYMpPhF<`8KZKXY?nj7j<W@xI@Fw7+N!FB=I>+iYu>>Z at 5{+PySPDqU4
zyU at r;MsjjD3oZrM!}%U^>D&wTz@<3rk*Bj*wgd7m34-P;E`RxlJ_>JHHDPjwF)a&|
zGE5y!+QxjE2?>&wC0uEbrIyT(Gc!q;K-Nx$m}1=RBD}2yugS4)lUb~B`lae#+{3SW
zF9J*=&AT+zB9I|0DyLQ!u9ykD;d~2gsgQ0m(%j?SIN1~ZbaK|29n%gvhE3u$xe4n`
z2F!934qI8omG(bK!rAT}?TzuqI68L(_j- at FCN76GNSL+Wyn&v*32QjKYtm2yv%HL6
zf-(0pE9|*EcR&|s4HC7mkdv4}PsqKD-qSZsZXa7ky8{qxa$~;kxj2MmXk`gk+W$C}
zQU<1J19v{~28Wx0kQ!zw+jBEBO_*%;*&ihB{yxV2WO)POkOMiu36le-Jzj|mV4f`N
zVi|;<2Li6qB_tW<PvPLxFNa(ApD;<b$!{F948xFCY`B&7KMQcOEr|&-rY^|HUjys_
zS-|oX!?C{;c%~^xjL%<l1q!dkHE$=A2UB4LT0j;ki#caTFjoLf9$ZQ?;s|o262Yf<
zx`c2F`LjMez4ee$V_iT<beye7xRv%;1)ORcz-Fxnw!TZ~H3`1gBbbo~p`=OT1BpzX
zf{7HK@u^_R?_Z6-_Y9nEBLqh<H>W~A4AEIimIiP}Kx9F9CtT)eq)lWk%yy9TQjWdw
z3f(`szs7M!J9JjoZ>2rf04MOMlVIixTWeBA at o&9OZk)uEE(E<YVBLUaO}sZ`0)r47
znUl56L;wQQ6AlnO^UKVv9w&EqBY7MNmIve at xPY7|&jK_YKJgHQtPq|d1mujM9P=q8
ztMJN^{Vw|*_7SEg)&fjoDx}?(M&Ui^6t*3B0MS`kg2#hJlB;`v*jD{~`S-g2FZTK?
zZSPuHh&-C}FJs)pR4DAUxi{UEp3@xX=r-t8fslf_4%Y(f1%h``IL?w^IBL_E8)T8l
zXh0`3wUKRd?D*<0(mLcb`0#l0bOztZ$ZeFwXIOAl9f6AMW#4C)8+bYLJjMG4xiv99
zN9)0}O}p+ElV%v}IXT&2n?nRXbN6HO^O%xkaSZ)Mumz(59(E09W}&=@k>M?0+gpi5
zT54Y_ZRvpPuL<DFYq5`2%BfHY1%P!P!1U_Ii#hVV9D7ZVFynBU16L3wA+nbt2h#|N
zQS5CMl8qGFZkh?1#*8)RT!%|fBj{F~Yhk?>KFk*Eq<{Ek>#Lq-D*kT)Cx_Pv<SC9_
zIK7naejkzj^O{LRGTeu3b870CY?H?@V>pLFTm;wue`!$`vyh<-peoqn`*~Tq^*^@)
zg?$UQIPLkPCFK;QNkRG<-t_7u<Ds`FxHG`b1oEEHh#-UAksUeaeIe!EAwK<K%%X(s
z2y2I^*2zRZ&4in<v1ijwK8eepfY~h0r#QcgkY@{{0wMa$<SH!8B0oy#exBLu&#<)*
zJ}^Bs&G>}PNot`O<TAXcuDUQwS=0g7bHFo!V}UO44KurWDgCUp#e=P^aR5&QegS9z
z+sy3W_T_kz!l}K{ceD=EPbC=-z0>1f4$S7{xyO${=mOp_8AwP`qFG9wm-JJICIgz(
zZjs$_6E=m3Yh{<7LT~glczXg_D$HhZE*VIu%mFUUA~y;cUR^SI94Rzj#F}6Egzoy<
zt2k`z-U44FvP~G44Y?p|frI<!h$J6>CO{sg_AumAh`@Tt%<igy$pdEt|0`bekAU~D
zfbEfQRdWG&9`H92a9;!VE#PFEylE_le;R=wUF2}58@59TkJKfdY2up^Y^g^+$AZWC
zf|_)RnVIM~qn(3Aafx8s$!?%;S54{Pzd6x+!D-+=MdE)Nf`Bk*x0UU<xvlIHa3f${
z%o4KTz;e>eaIQy|{w4>UbOjGJ&d`4A?t_hH8Z!(OO}Pc;;1u9}zylE&VNUuFxu)^6
z0eBqnIp7r)Ntpw!_*oCQ6&r5fs*`0~I)bf#5bj$W&NP;9XJR${=-r^xyX5yfyax%S
z7D+SGhgqQ}iehtFLIJ#ZskWg`!B9rZLpB~vQvo)48BExex902q1E2gJxo#%}H)pF!
z_ORgQ-FBP at Yanu*nk3$EE<rR=o<evb`#tj$@REZ}TU?=pcHEG2usXhu01gEXkFUoM
z`8pgpEPj6#u%-q~eIWONX)9pccM`5*t6AAJ+V^e&!ySS<&ES=Ruw#_O86osvU=|2C
zTmlM!Jgx!siV%`Qx)rz54zhx)FEO4T8_QtAnUoi-;Tc~eyXPesKP-H7(Uz<dCz6q6
zvsmaAs%P%;^hk4u$O^i|0u9Zu<)#<#d!IOWJ?p_RS=%kbe(QfO18xKUdy%hOfm?uk
zfV*pel<#3TuYm2*Vke`pz`>&vg_{`U0b3(1b2t?NkCd28aK*tK3Z~Mm7_3}DNd`08
zp|o=gj&QfGl_O-FV6rI{l;)O1_OfrY>$+1Io&6kXb`;)aq#?y84R8&d<@CB4J`t!%
z2pO*7NJENK69_m<P?B=XJqf2 at YWsixzQaDmDWOnrC*#B}m at ikJ_*;Ni0y`I}R`w-V
z0^DCizGx|%WEn}Dfqxse?}f%RY+sA{|DeCm_uV?eq;kNiyylCUoB2L7?3(R^^p=jG
zZO}F=j5cqaloe#nEjM!iS6{-a!~Y)R7!ric$g^28HStY{1&6GQlPAjqQloG^(7?2d
zo9;<C^^yiR-J at CDPK}){7z@z04sz|`0b>zp-!rrOmwJ*e6*OgE-cp#-y1x7Gm9JOl
zk{G7XLH at +@dqaT6ne9FRD{d33%){Jg>#i{$*dowW?yCYo>r1)H+{|6OuFpt{S;_TN
zT{BnLXL)=sO0Y*vyc+E==X_Sj!6wNzdFaUWf-aBazsSPN2>wR0you#03Qe3c<b+cI
zwa9`aafXuv=kQ+KxZQK=2S#-Lj~s~@!8h1679xby)}o|@;sKN`7HETL=ta`j{Y|!L
z`>r~MvTw0Eo;p8cb<-^%Df&$AT=YhK&y}xTcOPW{Rj*%}2h9hzy8Ei}afWJSNkz)d
z?f=qPL*4rI`z(X8^1fB?Z_xN2c?qXd-nWo3mI=J<8cdyFY6D!a-rt^zYknNdo{A5%
z1oK$vpG7H7f!vG`Qd*-eZoa$6=^q%?^>-DFL<$f3JR?`Zr$&F^64m~prAu{VEu`iQ
zGV0@JouvIsEZPn;n;r5Rtw{d#-5K}QNZmmvcmp_6(&2!Qd&5QM_J?M6Z)KC`HIDrd
zfw;B=+6T?77r)yCj*8?`f79l`eZXyIHd8lml?^*cy&M6aB<XP_1~>)omUO$BbqB14
z%_GSNN!WvcBP1OV$M53L2Y?>|57bEcIZ61)11?&00-3c#UuhI=FGJQ*pl!zV7r({$
z^Ik!!Ptgm<lV}zTU2sjDZ(tH3WVA*C-`@rkmo#+!9hgtZOb~K>F6Cx6tqC`7Q~8i?
z0jscAS}bUWu_uO9MGpnu4x9))2)q}#YRF6dJa9o|O78>CHnShpsXG-S;W at zRz;6P_
zl-wM|F??Op7lDuU{fi~(Pz_Z(47eozG~iDq{Ri+=;H**~<#q>foum%}U#hd+`s!gx
zqL%;m65ur81<@^29{&%4f0FcR;M%IXS3QWTDspA6jsac@{5Eh>Jlx9dZs0$G&r15N
zncZEHoX*Tb^2iIgex!3pvNj-0ldd3II+9H~Br`0?xB<KPR9JH*rW5caWMpJ{id>Fw
zw%B?noO)@dZ{OJjP at eS}(U6beVWKf^(^>3S3&m2F7%MG>xEORI57O!9J5l2zJ_~qC
z1pj9jp;8_Oj714|AF$s5u$9MjA+R1euw=*fC65R82c92aza#05X11lTMpo at bN&5l6
z6vqOv7I+b`A-Yh?2VB3uBY>Ah;Jic9JIpLCk27xA#LTji>Ub>ht_T8G8GpZ at qkz`~
zuK+HQbbfq)?sGL at Q;j|PTHrj2C>1JfC#A#k`M|FOXGuB__(JJmvwcLG^k;X{pj~XR
zeo(QFcc!fY3Q=cj2kgz?7MGmCZ1dwJ?s%N_aIS%K3E$i1n7Aa-*1HPT24_uzdPQQ7
zBPE*>IcC8$?PcS#g?%no1HMHQ9|H{gFeF&|n<|tx1jE>qC5h85Z3HTWKq%Wb at q3q2
zM8A}!*)&D;MHV;fX}}3_JkN=z_e+552h2~1s$73wUkpr8MDhgSo4}Sh)+2%607l~&
zJaB$IEdIKNK*~zLKOMLnct)x3EJ~Pf0K1~Jdk%11JUGscWB5@?6)f9~Hh_eh1l|(I
z*?;dg;LFh+<l-DX7dRk(=I4Mbfe!GO<!kQ)8!m#o-={h*##$!WcwVrT9l;G^QYI!H
zwEqh?`7*-ce}}iH<Cx()cZyRlZ8UG#MsK&htF%CKQQIUBHqHSK5oF^a@*%t}RyrMR
zfbV8#8?J0TFUAHe_0``D=`ar3iXD~#BUM76#^$*wp8WmxS&DG8J1S(uJAprll4MN;
z;fJI8_Tw5g+DfOsfZvb5e;xP};M&UY4~#(g;}Y=SEa{)k?3MxS?Lkr1E`x1T1jbh?
zezs<mfPWs<+CPhG=B_Ax>(;JJAe|o%f&M<ZF^=~tpjVlzqk%U8XGXPtKi~pMx0%^z
z_FyRk!ODI&;oO`vZ5cfM{pkI|M^_LT2AP3vF(sx+(3A;dl1Y#P&B^c4^rz$U&3x^~
z7N=Y~;=i>GqX}|&0w}~8D at i3b<gvfpY$)euS*1+-l3^*%>AlIfs$tNyNdH|m?z7e}
zCF%K5jqJA%n%OC4c6*t1>q|p3dq40xU^ZU==PF>WwosYdF9R<%v#(SSC^Ne!Zqf@&
z-#ZHUt?GT0=I6|)I`{wfKHx=Wc8!_k{cM0Z_E|H#68KeMiXy!3*a$W%Dq(f~o(H_K
z^yh1V7Xp7DiL5<9YGywG{&$q<cf`3G1>Pm;XZN8WZvJ)^<R{xno(_2tfN3%lNW%EO
z^w7C{_zj=sJKINcaHd{iWT@i7TzU(ojd~>THc2z_ch7JtX#@BHaM`eat$iJ7Q98X(
zFP-k+0?t{;muO~Fl1?nCWoJwJYcspQ<{o`%UVjX{&dlzpN~+2{{Z&+7pA^^P#gZ=T
zGqk189UY}qzx^NJ95dTBA30=Z_euJLsM`KoNeYGm#EFmKIVjH4t-x7kc3V{v*7!27
zj`Q?^sBIh at 38OdtL;!BGnEsTu61JeI7J1AveU)R`#mhPU((myD9mW6s=t04pqZ#nM
z7I~p{?d^tkr44d8 at YW@Qb}R5PNxh{?$VY at E-jkGhYDszsxHN)h4`=d#_K$Jn92!-@
zUk9eEY+{MIbiluu*^N~-yT&npucRv@F=4>dfTSk1=D8*56o5Z3gRRO4Rt}N-B8&U1
zsPgsQFjd>uMTxks)X%%k>^p<TU(^5Paja*=ue?ao1~dDvd(<~XaSQH}tMR(Za==Yb
zW4ewf(d}N0<L4P&opJ8_Z{c}oZWl#q*)W`mvzTGH`P8u?K>HB<<W|Xy8|q1sEeycD
zz$eR_wBkT^6-W3tfsOGV6N)q!s#JXyq;*dA8oQN}eb;APT}_hi^Gn*urbu4Q0kXz<
zUXBQ{XyaW~>L=8YB>{ML36wtuJ~7AzG>=B{$&#9XT%7x#fXc-ti804-ZR(j}>veKt
z;_5q(WQO<9bjM-#AUiTgYs7KhhX1w^!@h9YVSpugW#r2Nw*JK36BneMY`c&h)sLgR
zt!@Dy?N%xO at Ux`@;-=`p&H9olf=iJt?Vt92hxWEOKmB&%0QIU&&vyrqHg(ZBfjv{5
ztU_L?#Fz at WrtFX(6h2k~U@mEE^-!(MQ44r-sh_U^Gj(&iK)mNQk)Zjhc%7#LpHCkB
z4FQw3DYVCNOp6Vhw>^P-4t)=!JcV8E0X!oljTsyxgv at x$dw)Q0Hsy<-Ix5@K_qrFZ
z!a1G(R^W|h_TVr+v>N?g^K7U`O|r%DBysWk?Pq{5l{QwHB~2=fX&(%aD*<YxD!C$1
zeR)n7pxny<DTA%=>@I`ON5J*lEj3asR8`8FL*WM{KclL|jHES at aqR!?yCq3)B{r72
znl+{OQi at EHpN`iV**B3U3yK#rvB^(PjlqBL(>%b%tl}xm%-lyZ;%VXNSwc3`qcPfI
zbTyp+H at DGDJYTr{aBQ!+ld=Od8FWf6l4;~8g)}K0DhY5%>AkfPKy{M7>eQ{%2$BKP
zEvFJ3T$K(bAE7VRdMUdV@)`-}qvp}?YiCVpS^wH$9%-6TDGym5OB_R1y4RT+zh+$+
zUp4B+mHM&1iu|YpZo=fOL(s3<airaM)AGkMt9uz8Z8DQ~$r~AvkTe~sdUSKgn*COB
z&PQ%1Sm5d_j$DS#xQ9P(kTY~47O-;7pNJwsC3R^Q_;&P50c-|7UfSg4gR3lQtmbC}
z_)$f|h=)geP{Z1mBVO_nXkFDMQi((C$6c<8eH>fUN0`sg8L!u at nv~_}5_UV``}grv
z<uTS}bPPx_GK$Ed^1P80@rK@kDJ56~smK7;ym?$PDb<G9%^s=HcOfwZ9RiaEMwseg
z`ei$o27g6p9ZBAuq1h5y1~d%i3Bl#Kq(KOV$CwR9aDj6!y9?KJ?(>%&?l3YpBL42J
zMWXChoQ}72h*(P1o$`wf&8jiH=L5ACP;dL6&F2Gn1?)*l6|@=xNWkr-_glaQGwas5
zG6tll42&6#-<dbHXMx}VTR<hwft!IR#Cv(Vq*Z3Nt42+&bIbHM{gW%eu8wQFq#Ghj
zX%umjdyIKd{#@n#11LiD`u+ZQVLVIR$7~uc>D(XzSFZc8S8W_&lW3iaD0YdQwgp+o
zff7Bx`xIKdk2D-fBV^F(p>6{ufrhnkhz1RE3pfeq1Hl58B?KQh=l!>Z-+jZ6a~!Mv
zY+ at 7bOdSgxZ#^~*RkI at 0fMU?5*c-LAyyy>0DXG{`A<qBWDjQY-L3x3XW6!h`tMN_U
zT)M{-q9M<Ktb#JILN$G7KqQW84wq%~BSx0AKcBx5{bXfTwf5jB-NUgZKOA*)8?W=N
z()~PH(yx`%mf|H{HEy<Y&C}T(;Jk|>N(F}*2heI- at pMCPSQZGWEfeQHjRhu6W2UgN
zBaa!{dP39G&h^iBELr0{^wOiSe5R<%jOe*QAj8jk<YJ*`<w!;zJekW$JjK%tk|uw0
z at vZja*UrucnC66pHia}D(=dS3poM+}?5KsL<U^5$?l0bN*3sV8!n2YNrHEVXe=h@k
zHI_2^3a>4xO>d|;Z+*olrD|?nHEO at 6UPx_b^)jf%27IA(pd3gM3tD9&ZJxZs(}Cm5
zHe3}f@!qciz7xkk3jAq}Gd<MJOT5e~ijcVe?^jdAc;ZYQ1@ctLdBEXH#`4}LrkW5_
zViUM^la`yNolS4ebZzehR%h=49RrOAAaUe*AW1#Gk<kdF>>S;JVqRP at N3f#MkdF_o
z!#sv?&5ZTu-;tkt<?Z9o-s%f|SQ14p)(}9jI+b#n!Da*0*76CvJ=$6Q_VY2ssH&P(
zZOn1tS4tZ`sZ&SI>`sahr~YC3a^O{^>*l3RRF<H9b?IzL?*v-=%04Y00MV84h0>h9
zS<<Q11E87+8s8rW-d3l{^tFK!!SX!{M}J>pzfjU!YLaY2bsZ&*0w0XP?n}2T`>MOc
z+QG5vAG_pVa=6jFc$`hF1!8-z64)lkgoTY*1_GNfow4nybQ>4b at W+vNAHs!Eq=4lj
z$(lHXDbS!*sE<hxnIjPEEQcm}0Pi5pb5aiGz at z??Q%<{l{dHur4#@JNyu+gWaEpy!
zTngaC?gUIqly|@VJG&$Q4+1_Y=^2B{u}gX#@SYlV&JD1iK1vZx3`KD7rIKD-lX+e~
zvAv|X#D2~JrXzh`cb|_~fgUq^0C+dMYtAGTsXwo)O19F0G$QFu@pG*RfL?h``pLhQ
zIled&OZ|Jf2>5GBtLrqO_}#|=AE8JG>bFmt*<6~H6JH&bUGc*f`oo;?b%$0L1%kZq
z5thNLye=>$r|AignbUQ*KaE=sy$Gkr(+&62Y#A=ga9Im$2J+Dvg0;vM at L9p%WI1zX
z^g=APAeWJ6(C{P7&U}l&Id-CM`p`51+QQ@}nOu^+wGT>QTgATU=azZkGo at 1;iU@@-
zOZrPmCjrMuI!@BdBwZCZk^{a=k#(#p;Zl*JJ1ByWzZc&c1^zaI=mnCV2pk%-zn?7W
z4}t4|zbN_M8vS|dZ}iwlcqG79S&y$!1UvWJ{=f!FUjj~*^fQv41pJJoGoyO=mk|tC
z$NR9dpRgp|%iy^;&eL6`zFtp}n)F6VPm^>6aI~an$IOE70;iTfe@&FabGCY7diJcQ
zCY<c-ZKf;!2zFg;*slh{&L(adjNX_nAe=tG{X|BNd?%ixVWvki3f)wwVI<0Em?zJh
zWXUebh4a2x+Ti2!PKDtx0(qK{=Ei8ai4#Z9v%~qmY|Poj#$XhmnH1KxA<u;p+3*Oc
zOVz|kUq@M&fcI94sQF)r-`kHO`1MT#{A5=G|4LC&*h)599U<b)>>H9^PLXQ!jCj4@
zr6`J<QdBP+rHCy}N at MQ=p922K%yyQG^7J21z1$i?9R(lLi=fCiYsPzC$L{#Yy4Ft-
zI;rG~vjwV#ZKg<$y@Vp8p6HHvZ|w8lc&)YUnb?{}m&>^^h+<B)b<mMbOa;?eF8k;Y
z!M!mMraWpb2UFQkk<piU2BWLrMKe2woE>Ns^33BJIWmX!0yzOox{RcwIOpjvXv>R$
zfq4=aNVDR*2aMc}HQ&PF+KLI&M(dbV<kuDDDTf$hQc{OTO201)aZ+-ECM8fe=Oa{N
z!0$w~w|bRBp&a*l2SrJSGb7=$hMEF775k*``}#)o$-R#vWJ{&_cygrQ8zoo8S1HnT
z)&n~SQ12~vCzP^0`=|E7C}w8wrpOZiLe0ThJ}|dMb?|qh1UjJNXQOI|RcyhpQl#a)
zBhGi(G&qRe!PF`N`%H=w7k56)Wnq~1tVGa}#;20*^zj!oNnRVscM9@?Dl|p^oCAEo
z@*c@MN9|J|wrM%WEf?z>#)ncwqhre3nv%Zuf at jd%{~~f7fn~e!i9s(RZOq_i8_*JR
zh0W;9k-0+TyIhzHcxzxG0}MxtG&pE(;<mfqZm)j)_Pqqe6Dgw8bKrj9|HTylWs4Gt
zM8t`46KBA8%<R_r`iS32fM1S;$Wux{ODTeh|JBT{j~nH{C=oqH?%LO*`nb^88u8RV
zi6R5wNQ!WzZ4}wj-=fHAy8+lf&v^U!U%wdX at Eq7;W_J%cM+Z}sXXwRE{cmQL4)MMH
zC?1sZtmx)w#P6q(8T=yf?Gll4bo`tL?lZG%7qN!N#=cI9ZkS`DO?X?JpRdPxzk5Do
zUePJ-i^n~+izk|LYZG=&f?m@l-_^pKVPsg|h|d)e&Vyahx#80vYoAa&JVS=T`eY*;
zY#kfn%fIwAdb$X?LuiDIESbd~8o{rQ^}K>eoYBR|^1z7mkU2t<5zG}n`QX8Y_{0K_
zxQ=aG-pcrnoyJ(U+-l1_5hTlU?IlEsxVS<3>Rkq8gX&l=B{Z!Rxa%XW-HR$@Z&2h-
z#cg0qsmoa<Xa+gohqUpUWzwcx at oaDEhSvD@k_hb4DE()Nf!bxCVBH!x%v|x{4T1`i
zL7KWj at X_uTZaxpV+!sWOz(S*NiU-3ikY~^f?HkB3f(&OulWfSxGzniBdpfzh7?J}?
zY?gq-)54E9P)0}tsq4`*LpcT5Q1Oh9-0*oJPy;zBy<$SsYx&Zhe_|6SJ!q^8%MFN{
z9IRzii7GxXSEssG(@aV~Gc%iskrnBnsE6|R7Bl{+rp*E~X13kT9*7y!p{`bC)lE@#
z<S(MkU|6Vt?68jUNWIU-Lt=JNz`$bNJ~i%}445^udt=eyZuOq3buo7Xj*b-teEL_O
zHXEPHWw?`gaefI~&P&h-jeNf-(egl$kQ`1ai8OA3lhpunOtb-A*8W+-L+`=)gK=38
zX%$)0CCwpCy7<t<62s#Qy59nM7MKkgd6GiXufiPg&T#fPdfhK#?|9SZ$s^LjK(pnt
z5nSb`mRrJAZMC{WrF9#jdH_^6XF2Mjn$tGy_$r&JF7P+h9YBK$&<-jnI|N{CFQ<Bs
zBCypAjv5E`ULT}&@s#sri#Su;Ol_0lin4X%L2OF;kC^&H`+iqv-F$(ezX59j&fz3*
zhLO`X1Jh=+scAVnplk1WCdY6Ie$^3#U9;dFJ+}kPMbku+2HlX8C?VizkswRRl0d@?
zZwXoE=r(&O@dVb=(AAvy?YC_n>*QC-ikg#Km#t!SokLm6wJ<f3XWmn`uIygj=gYN6
z$`0SfY~adfadjXc1kwRgDGXAl=DXJ_K$lR6H_QT597_NI0}Dw+K~z&!+RZnQ!>Fru
zPsbfpGJd}6 at 4m_Dj)!()LU2uxZSu0`I)QA%X8R^LUjW)*g?>+tg~Fg}X&N<=^6?2X
zjotc-WCy+r$06(r_oG$7tRv}-()0;krHCetBqhs?U>TMc+)W~fqk(mEyn2kXmMk4X
z`~&XCZ9Dwr*^{x*HiC(S<5{*sM>Pw+?8&56Rk6C5i`<|Z;0V{=jBCEi#|s?<OBq95
z-;2G6I;m2bPb+_PDF<fX*Erug4KsEp!%Z{cY@(f-NM)Vkc>r3M!!<=hp^=@$=1hG0
z0-+D}$XgyIMhH2H#<8A(^u-;|VfKj^AUha^E{PWoj~^AGnWGFE)*@#X%SNyy(8!zQ
zjT|K@0qEvElo+lzO1dlHnx7~6r?*>r$c$uW$mqxkWg7A+r%T;z!>UD#IVG23=L}Nc
zs;bRW)!>DmiZcj!RdsYJ_f at AVF9vjd=`~2 at t$^5;T8XXt0Fglz+Uhdf_f#n%pRlRO
zn?Uhk#e%sk)J^i;&wsN3+uq*9T?VuQBqNxKb%{P_C(}wUWPc7P4YLFbAn4I6vVBq`
z^#LUTQplCkz=O}|$?(>ovD4#RP9s at M?j5~V|H4y0aDn~uZ|~$rgiSPr8Jloph95F?
zYiNVGMm-42B|#Un$rl5 at vKmvDb-tME)z#~m at ApA!)?)gf?`b}ZAzcO?K6UH6STboL
z^>P@~V7DJ`q5D#N?4g)@U_DH at 49@pxy~y4s`}^;(DZdEQ{*d)BZ^%aqKT07B^*8Cf
z$OyPpMHYbbkgX<f`~!aS0vns0o$nM`X)Eoq)P at 3F-zz@%a10 at sZ~^_<Yj|SsivN7)
zY251%B4|hPz~SHtF3_|Fsj^rGVNeUSf+tfT2$FOJ`761}U1+bSyGN1NpPZ5fD{ZAc
zGJsPd<BCTC6zS8ueI%M3(V<7J<zHWS0Qb#yS(`SP$$K<*c)CYtWZN9g!-@`iv-O}`
z{h(v#{(%R&ux70%e;_cDZns}Lct`Q@#yx{@R{*!t9?R|j1BH?RPR&f=wEzGB07*qo
IM6N<$g7kchN&o-=

literal 0
HcmV?d00001

diff --git a/docs/images/free-electrons-logo.png b/docs/images/free-electrons-logo.png
new file mode 100644
index 0000000000000000000000000000000000000000..a5c7d8a85121faad767d00f741f7af7c220e7f28
GIT binary patch
literal 9968
zcmWlf1yCDp5QdTB?vxfO?oM$j#T|+U*Wm8%T8g`s;skf66o&w%xVyVM{P$-j$t3e-
z?y}$B?)yG_Q7TH(7^ozuFfcF}vN95C!21yJR6#}rUiIt*YJj(QF5<H4$iTxF*(?(H
zjN&Mx;{pQ%2P}a at gnji(^8~(p?<%S7`pv<@)x+4?9LB@LgVoC3#>Ldw(VW%68Ju-0
zL;?dt0V6B%Mcp&|B*()uS!4Ehz?3}aFm=W?St2&dI~nmb#^7Lj#<um~QV8o|n|7+3
zD9&+JT{|4(IV?G4)i26Y<bQ%PD5NG7C^VgSX8(%)0={RM$z)OEiDj%^L6e|@cb#`#
zTxVVroqM@1RWSGD>pWsn at JN^>rSPlxFpYu7h#mt$Az2C5utsq4GKHQ#5zF(Ze2$KI
z at p*aSN?KTfEgL_ZJ&><<D?5#IoY&VaHcpz!KQS>Oz-(Zg#=s--^6(Y~630r7jG+EK
za^r1d!nAklJ0UtSaBcHe%3U5Vk_R&|j{Iuji`d-MLq~)c&&T%ga1auDK0iOF<Kv4C
zf<KcgQ(xJ)7i^JiF@{r9iSK!R`M~Gx%B7*PQ#xZ!Nl6(MODZcN@$So)FWbAjiJ6&l
z*4B)}!x8+x_tITYr&NgOEitMEWR&bRd$EUIA-bVQtQ09JMHTu_%1U{wF*4Mfz^bj*
zy<F4l{mGMDpUZ98R95{FEknPt{I8<e@81tXGp;5rpR2!4kS<5-&G8R~p`mnKjZ-~e
zjvDWd=g5OVBu8`A&9Zzjo12^3jn)MG{0q!_E%Cp8LH=L%QLw2f%ja}mbEgeCvghYs
z`<aNv#pd4m-Q8wi)K<sK?b7{|$LVmjCd6wajEK+U^kWDj#`cu*-qk_LRcYnSV(T8J
zy<3~U7&@Y`d}_zg?TO9(sNw6MC_K9TmG)-+!`r(%@ZG6?$J1$hwoq#l0$T3Rwzfa4
zZi0?5D?&&d84A9)3m>RyNX>5!XM}F&P2C;7(&JwqLaK4e$tQ&G6ikK_iGV{F$x!pA
z-6=?fBC)bI-7xSrCuV1l*q<iA>+Wm9>U8^mLP1&5t}*)3j4b_aAojx`k>PWi)l_k<
z^UfQ)&1^Rgsza`M?vRYf^NYSMqt7EZCTy$hev_c()9u7UqYVpN_cN!<F7%+vqQdij
zBSNRn3<W$vwjRT_+R17saPK$8LP9P40w?-h6I%AI<gz;81tOSfnW9r~k&u-&s_W1x
zsQ`6+y!qg!ztkMYq$MXS$7p+VH8S#eH2(p~&e#K%gCy4XVaLakn~Yhv2|Y;6=!|yJ
z{Pp?a`F at Lbw(^O$dF3;9#_=wyTUmK|vlVjDB)yYc3cLyk^i@_CLrDqu&!6R1-`3E>
zLn*C~DRR+iX<VnL&gGDs?Hvs@J-sRG73WrBHa0pT;go$>spuHU at VGnrQC0sbT%E(3
zz`rTB8ut^>v~^=Aq!}earZ1Xc^u3TLyXfnEx6t)pdEP>DeHzYxA*-F8FnlhwanaEN
z;aFHw6oJ{<sO1nh<S@9+&FB5Oi3poK$@lMfj#sjz^mA4ZJ%Qb5ULy;YFcJR4%1~xJ
zkqb#qZeZ1JCUMURNlqa+--;V07WEgJDpsrq&yZUD4upkf^27-HbbaFDdI-PW0Trs@
zFs3y0rzy}{Uwq`{Mfe(l_!%!4hbs7Bty`6^0YplhgcA6ZLW@>0T7ueI=%8sy=)JH&
zALYl!MsIXPDwxw#R9eMDtNO+h&EHid+Y#icCY<ke+FY$5=HI2Z-0E37?^b<m=WBu-
zx?kec3_$++iw$9=^cbqDnS`Q(9;|r<()F37SeWkpW}LdssA!GTvxiO|TG%)nuwrhF
zKXL@C<MRx|)EJEagd#7m5VW*2wVZrb#>GR!jtT1<d;%RVHy)u{S(yV7l8QzB#0<sA
zQ0NPU^*>(qYxH4#<qcmsRj+IcPNMSwva298EUZ!6V&hL(OM5$)`3U}ZDbut?-7a7L
zuMwE$CyTQo9eVou8C+n@;bFSr;nwA%TYGL=Jl`ut$}HXz$7Ai!pvoVm^s$mIg~h4B
zc_E~S?EpzJ+WP5}^{8Q(IGmWhJ%LtLvI%$Q-=o-%qPeCF<R5)a!v}b&+@~m{f7t%&
z>iPlB^K0s#z(9n*+8z4}nW;1GMI6uO|7vS%Te3I;g__M)=mahVUF1iQiBl#tXy0B8
zl7ml|=jOWugr|x-|CQYyE6U2o?pSoCK0l|fm|tF&mzI{+3+(RFHa}OZ%SFaq)pw+g
zeh2_Hg6waIpfN3qqwvJBw4vg#CbigLFoT8$rcLI`yY0XEXYW5ByPKGpfS!e at sNgG`
zE(Y0HSx;ScOO$fzo(&BRm1Sj7R##V9Qr$c}z=zYKHTEmsWS;8}S$}?|q-acTvX`@<
zqGqD0hlHU~Q2yzhaY>Ow!HxPWC-(fTe*e%&rnPm*=z@&wjvJqxoV2}Le6bPnX4|OX
z=*Uh+MutyBgolm&`+TEUaK*sVvUKNdwbN(o;9$Yx0i5d<&SNv{cs&1E>bvL9sgqS1
z{~Qn9N%mGm8CixV&L at KyF$%G22j;vKjW4RIZjc=t>+4E?cP3*ZSbkqmyxiPeq5Jia
z%2XWGu;aDvJpFce4&QsnZD%it`4SZ^ZMb9%VM20pA2fq&Dd!rCggesz<<V(-sCca+
zutCDhD at QWM%v{6qKuxxN=fhhy&8JW8x=(jLzggiDGrbd?woYx`$o`7Cx^hoWPTpE3
zF4TiPN}v0p at Vwq$?#dvLFSOt0i?DbzgW*`de5rzY_pU`7MaHr;6BZu2 at s5Uu=XlXA
z?9ZQpPgT{`sQD^^la`u_){WV<roGsxW0 at 9H#b&N;RqxgOv0Qb;<m9h_?q@z<V|=@>
z+{|G+&knRet!i3a0-kj#k3rUKQA07;1|rn3^dT9nK9f)U{3)KE>0{j{wL0}=qV}`+
zIywZ~+v=NpC3O{EdR=<KY7Cz!|G?AHUBRCoFZf0{KFg&cQ1jeyi=`n*luS9DF7qcQ
zC84096?mMj@(BuhH2M&RqrVRpqgcP(sqg*(J9&V9yp}hR&XF%uL<v+xWHgt0Mwe?#
zLapjlomFyy<Q{#Gu&qtX-lZiJ2M0RHWg2S=U$}wdeqEqmM|xmV5}x1V^}+N*b>}UK
zpoi_=@q)|r3@=FW9UQEwRNQVX at 7nh5lEaxbuPS8b`fw&@divW5(J7*un%vMR7nT!<
z>%u_Z!h+w;4H4$@5_Fq1GDHvV4M*$ifA|H|Yo~<#nb~hDKY@!9E;^=?ZqwYnG4)bJ
zWW1$yxD3LjqNes$P3;p<KlNKi*2wh<<FEFxaEOTJ4rVSUM0GJV9)$4N=*HKg=ws6>
zP~pMOZWVk^@f*DnE`#YD9Z#!1=p@{w at _wYBZHXb8e$m5b5)>_6wUlLLq`Wp at 3(fe9
z1^-Ypb92(C+oA=%Y9;V~O~!*}k-SHgrtTL>Nfcopcaaw*eSK0>pCQjXB_gtYnv%4%
zbf*o at SCQq6zCB^jhVH}_pIb+uDOI@=1a|p7nXvCKbO-pQ9XUJN{H4LDvs<$M-9bF3
zb9i`^5TolJl@^1L&Bl&RNMe!}*%$8b|Mr6WcuN|Vm8F$-)R2OLM~RGF!}6=9t}eH_
zi&GRkIArEK`5HWXdxY(xs|&xu>*_%RVp%z(=~|ZqY}@v%fuUhs0|CbiLu=~Pf*Um8
z1*31XO1Ds7e~fl=5yS$~nrQay6tK)76JE{`;*TCqDu|4`vv~_$`;^ml<bHgg{rCui
z(bKc_;cSx7 at 5Ia~eR!0uT<v=n22oOZvjaP?G`E(F2n#EtB+@gUW5{m5j1J+HDo7X^
z!OhOr!--ikm^)yenGqNnwOM+8wh$}hM$!oK%5`D-#{gSa!CY&Jwcim)jE)GD?U=6>
zbMBgndZngwT1?ncpdShQ^oj`YjJ5`fB&4y5D=H#;BX|>Ya^#GSKYMqQ<*P(WZG`|r
z6drL|QEyqh9Yp~IdJh!+`J$>~ZvFeCAD2x=KPY$__erK^J|n;dje!iQagEqrUls*u
zD3CCHrS<hqrxzM|4W#2o3)QD}*yQY#D@}ERQ;7^bgE&kFT-#1<THW;}tLK0!r~K{P
zw=sQ>m9Yk^fFkKQvUdmw33+)FMe=DfGJNBUjb}j77eDQKl9h_{pSORhMFLXv`s662
zqy)D}O<Y4m7-(qO!dVfTOL};+)RdcBFXvY-17nIoJx0G8rfoMBWvv<-R{VXib8};V
z<QNzzeJ3Fh2QnK00rYr#lMhyQVU}}t#wjbK=^J>&CEOiIWhvA2H|X^7!67*ekBES)
z)t2${B9)Y!$>vL#QsC+zeA1b92Ab;7D8yu4EWp<{8z(9>IdwKZK3-8Xwb4zPBCv+t
z<MH}JyfT$4B^pqj-}Ll)TV1?9>%i;&`UdCxe2)pa%OM?&k)Q+`3SZWoW&R_7L2kxc
z3Z9=X{@XM7Xgn?_-wHiig}%>>^P)slxM!5DTfxZ42(rgw&=I*ansznt!NGCk4~_*i
zJx*?C*81T{vfEz-op>EgaCdghT;$=v_NR9xYo*k>ak)-rK2U}J_vk1JptypA^%ejT
z0JE`iDpM4jsauqouQogcWiI(C79;+t$rFhQA9vt8irp?Lb4oNZZ<TcYmc706^73|Q
zXeqxVMb2p22YoYq)TpA>Ko}xK^z*N at HXVvQBs6%m5;a~f(HeSh at t=ZH&$kh`ojG1#
z8J}M?vPE)i2(C<+NOKGKw)JRv@1kdFt6HiC`?1y)x*i5r+**GO8>Zr5<BtE(Z*SlJ
zJCBR;k}N|Fh>m*GK}<px&~&jQOiOF)MO?sh$hQ(DWA4<eRi7ya#=~dp`n<eo)dF#l
zACH^70|pir4Ls7LZij19QVgFX#ftOP(2mJz$JDXz%<mfGAi@oLCdkh9fgY<NYpv%)
zcvvgWd#hPg6qJR+BA%+>L<AZx+cLD0l4DylR8+zs*Bo;8-xJQumfQ)6YS4qJ*3@*5
zD2bs+oF4iV7A*a*;?pwJly!BCLt~8wda<!~-@jj<t7wPz0_)SYe{b|=6c!WehP%8x
zJ#B7GUZ_N1+Qi#5BDt!H0lucm_I=*R8BPZeg3ez)^`?7O?)vkBU)|k5o756JI5^<q
z;-25!*u53f{$JKZLrs_6=2m>KCk^kH)-*RZ|2g3`gIFBCAtxrqFfiHp;bLj)q~PM#
z$tp0{Wc$3ms9JK%sWZMeHn!JmQxC4L9!YGes#2O5h$UiyTyt=&qLY1uN#~K4ljD$;
z4U3e3ljk<^@?zPWAZnN=YSmK!z8@a$$0xMrAW<xxarVBke#Y=PZn4!V5_MyY^Er#{
zo0>w2l918MCP%_5=7r1|v0vWIMWyDOO!>F9^9p2p`|x7saB+?D`|?ed=hm>_8IJPv
zTrpe50U^MnbN?(jO8^@c7l*W-azbz&7i)Uf^|C_w5eAKr`S;9Bir>?%n>HUw{OFGD
z;x(1Oe=f5Q=ZBDufj-6i$4m#*q~X34rlQm>+N9wT{lbm1h3UQWpFbCY-xIOoCnl={
zhB7Q?#8OQc0)BgSb#`HzJc<Prose)2^VjZ0P^U&7I%0uFo}Vx1wzb{65o%2~qh7!h
zn{G=oPk?V`z#IMjS}Z@l#>0UGqM2hdQ~u3vm(nH{(<&Yc#RmkOu3;M`1t4XHb~q6+
zKK2!lWvQ06f$vK5{2!wVq~o0T|9<iYtZz}9IwOH@)3b#7w4LqRD?c8s&}9DAH?`;`
zSLBLHJKcSJ)LL_Y3T)(bk<J}@C3a~<IL)gc#r9_~0y(wvnvLJTUs_!K4R;T+z_b3%
zh?E9_R7j%DG=i=duO$_as>>z|R3dSZp)n8)ryHO$>9wlKnV1A={7$cQl?gF3)3d$s
zw6d~_8MOPtOn7zI-Ti0QZmCTXuqZ5mN&ToSe1rcr9KBXPM?^%#_q^xHcBL&kI2d}X
zY#D6eP}l~VJA?>xS$^F_&{Zje@>);PRdvqkfN=MV at t#vFtQ6~|QNw~Q_}c`6CoN4@
z+9Z^6M(k#ZVh4n at vN(&<G|;>MKMQ=qrsMV0+*RM_d7M?>t1;G`HL at 5Yw&JFy)VsBS
z?gcPnNYAcYYF!<tI%7)F^OUmaSh+@Cozs?DuJ=e6VRMtEKp|iZd|w|HH0MZ3az_;L
zMDFkTct6<F<Kw=AbFp+#RGdR7weop=9V7RJg^eAwwz-*}`;eJ(fDA|;rR<@N?O{D%
zzZ?`4RXp5Z0}DE+={%O|$>CJe0=tC^pK3cb#rjN8;DQ2Uh#U;wC_;LEU+#=%0K$VS
zEq#zYAp88>@$hibkVZ*anU0e)QJUOu+F5}D`+U*Hh2PJcZD&W){mjP(I3hD|tu}LC
zzhroiQA3A1W7!Vkq$SiPzL>Y7y7~s=Xlo1l{XK_59$ByOoy2 at moMMDDN$fwl5ZHH!
zpR00GQk(4JE#q>9d9Dw(B=bae*K4!0<uJ*|%}y4tG`}tsCwb`}{6w_+D0h7#n3%z}
zcXiT?#_w##mBy-1DJ0a<OS*60WV;}4Z_lbMH0hgLV>8EES6 at FoF+oR9UpnTEiiXC(
z%uLP8J9l^w$nJ})tF6EJ<mr4DvRRM#xWDYRR>(!N7cA^owzo|lZ?0gCfR=W9+$!hS
z2^%Xl3<y+Rg_5OaLpUf(Jrd@%G$X;rHnlOZW;}biw_nnt79Ca-&04V$P{Py2HZ~M=
zC5iw3kt{DmXNv)m&gV)GU#Tf=Rw%f!5j)$Bh^7Zd!O+kZkL&EnmXTp+6Jx~3WwO!o
zN$pA9pT>qL=PhOM*uaYCM_z1!owtW9{9hmTved*hD?$A)cWY}Vpr3$2j%#RWa1Vor
z&Ng9*+y at Gtbxa+$0N^PDY*FjDLH8LgQjNiC=5{Txfd^~ckl#-r4v_oFawvekfMzeG
zwF!jGBt2g4sQsH7n=M!b3707EaazXf5Cea{7FioUCFLetWaS>lQlRzr!f7`_`q6P;
zC0y}~hEzdRUck87W}nPExU0p9UM$`T>G%ZI at fk=?UN0Oq4FN9kezcg8d(H7=FKOqh
zB?`a&zB0H%`!iN;!y>>Xm at Y0+x0M6Dk@EivVcy+fNS3KzTuq32v|OAHSaJj0Lxff_
zb9!@+%K~b&+Trzi?(VMpE$8*+iC0j>>K`>KnoC=Q=e(+`0KDk4V?u|}6<nqmMGbO<
zfx|X5L+JLnR*BsE)>Z_NX$_WR!+<t9npJ1Ia?sIXX>E<2r3HhnB50=o&ttpnS=&$7
zJZZT(U8d)Lyzf0Q`u)4}?TP$Xh+TFT4*_OnQ|?N8wTjB$3t{H5TyrroG3u+`#@qoe
z!6)3a?l<DM`$6#ilderPjl99Ha>f|>G}e{)6HL(7 at k0Ie(OevpR+aY7KkJx(|I}uy
z^ySsma9LSd`vwL$9oNNzLqc?g2Q9fbcX!9(u{wt0Ki$nko<4uVMm|4h-&;=^?N3gd
zOGwk2DVN2E60*cfMS)nPt9jKxpd}09nyf6ifB=G<8$?bnCIO)+B2<KyR)+I)6^f)N
z2A0bF($Y447k6nKR0N<-Y#lR8mL;obf$!ZQQPG(EtX(g+RA%NyFr>sLR@|>0_nUPV
ze_+|oh9pwi0>Xp=CoxFsF~6K}YOyz-W64dD6<W~NmWhByShL?7Kt)8de?;}GLi4vY
znoSfrd;ANM?p(Zhe*FBr_IQq<=L!NK)Kt~gS1fQ_Y|1KUlKyx6j}r2LDpUb2KCs|?
zm%{7spCL8qKUEOCU2Pk;@MB0~Kt{9S=lHtTMWqVi0WcfXp0pkb2wvaBM3WeKtu{36
zP5*04%#WA}$b)}5nh*Im4sd$#;^D1^%S3L1UYn~at~lSm$Z=w;7&R`J*-)qLa!W#X
z_75KgcO*mK3j_uR2KtmH{!-Z@HNt?7&~N+#<J+Ih{WE05?ChRqv9z?b7#Zb;$GfHv
zL<CzNYILpRHhSqyxk+?dor^llkGT&H4utNOU0^<=A^#3V!D|8kS%EI-DE3Bb(1vGb
z-bN5%d@;@9t=@MGAYJa5R}=#{^ZtwtGLQ~M9nS;1nwbExA|TkkaFf>GCGxxGh<Xr6
zCFR0`j94pvrm3-^cX_-vh>o_$WI6nKG|$67{c<NN?c~JavNzrcZY142oPqeh+{~rk
zHB}_?(l9fB$0B0gO*u)a;4>H-)}wL?S-e}b{>w?56crk3M|#u{l112#Dgz{|>41Xi
zLY+A^HT8VGb(T(z5iH`@0+#MCNv@&)!;&2)&GTlvl;bva03+$O?{VK)x+4#rA+?tf
zWpf`)w6uC%T~8_Nu9VKjH~{+e&`%@9&Pt?uXP7Q;yW7w=2nW{5=>$ziR at QXh(*87M
z?K#x}6FRRiX2yvSaNqlJJXd%L>T?U=5;F^TC{G7fVNsDz>uO9t?#Rf<B42@Bv0~Oh
z^IDaI+gwHQ_THXu=LA&Yz_lIIo~(`Liye>+!~)j_yJJ~{<r<K5AcVr=Apl+!1&I82
za*q;yXir8)hUS;gCCXV`V`%T-f`h#;`|uo8wYBFrykx%7D(BixNr-Y>5b5bHv*f<3
z3`69*x0|$kpACkl%e!7<zdm1oV}8CvLRTfKwJ-l5f9AFWorFgxBVMzzy9Dsr*2#{n
ziVF6Zpw|w7$y3wO)w>;ON>Jjwz8ZI2|8u6K+WLERlg;P!XIu-cC at G1Mk?|gy{eV~x
z4hYt(>ZtP9!ED27KTTT2FPKE8r4om=O)s}Fvn*)89#VPl;jam8sWs)hzrx|pOua+z
zCIr;nR-EW~CXWsA)YtKx7yWsU#^g96w#_%qs^6j5yu56=0k3%YsPzjo6Ku)AD8=;%
zQPe_O5f%sMC4M*=An;kot1lYOjeF~llXfI#cc;}YjvK^=B4#WfVLn;oWR<k5r6-Mt
zwht@`CHP<T69EVu!$rDmo_i&>8`EjCU3!`CtpicZ7=vdfMIq-A)!NPUUxbLC)cM2S
zTjNoq{wP2orChHmMlsu7p5k`%BMgpbKa=W_w at HeXmygUhxzQ*OFr?4d?_BsO$EK5$
zJMC<;?WI5Le<vK}-l=R}HM!XAhmsxkL8vN;PT}+=Z3Ce24qy($*E<$#n-6{^0J8&t
zpV{r%+FE0bby!D-5HLXT3CC(){mspH-(+t!(Q{Lz`_AlYmmu={O@~1F2{rnQFAa06
zbic>i+wXwat31uoN`ubKIm3XQL6ejY5Adj0V8{$*m;Zc9-6d|5y}liP)#N=6sc@*W
z$U~tE(G(_=W(6R$Lqz;QtFs_xLQYeu?=ukaL{mgEWkTS4E|Ut*goX&Ig6#z9iX7Pw
zi}o_he at UvUoGqY{wQ`(9I2+ at BcRFWJxFqEk{|d*?5L{SZ9v`&**uItAHtDXwOit#W
zAQm at 9tRNJ2b)~{1&0aklA&{6q&4?1S>^<}-J#VFG@wx7+)K5%g^Y_+IKuy%sv*XUJ
z1d$vo@<PivP;ZZ40SzHle>7hkVAdOs;XX&Xu&}_aea<Eom%F%&sf!vGN+n%4- at p*2
zn58Bo&(sf?eW?P80@clJ>Mzu|*dLFh6=>n!0Wy&q_tWbuD>p{%#kD$UCjl1~0RW5?
zglLs at Irk4`@p6)>X6Q!aV*5vsI_*WEt+(Pv)#w!C*J{r*|LCZwNS&TG0hFdVf0??3
z(N73Xh^$y(Oi^z5L`bk6z|TIV#js at Heu$R|wQLj^y{mJxu}*RpUtY!s4)Rl7j at iw}
z`}6J{r!JE|3l=Ug1*xtErXaib={+IvEIxI7g7PS6E=M)L=lv3MlUxu&dWMEnmh$}1
zmJj}1*plL%l1)6%tx+>FMh6DMuo`wj>+4^?gRITQLhO<4BKy6!FbUS^2(Gr`-bSGr
z)$rH^Jn=#BgI9Z^6PwGe^)f}IG1d05dwFk6WMux!PJ<2ZqmPdQx}3Ip9oiBTxnvR&
zo+>&z5$)~4zkXS(Gco}5&vwbez^r5I2m7@*6>SpvT0lSoFxzl)PyMALGc;bcK3~gR
ztZ*Rd*V)4uaMI!=%-o}b0eHzkfW!cdL{$|7u!Amu{Y+Pw|46gHkzc4x?!c<gXuRA)
zW(L-xOo_%uH3s-2z+e8nz8siYq;lEoVFA-51afjPfNkiRr+=vpS0r}B4w-GzE_^tW
zQD&q1JWB*n3jm(VC@_lwxoV+64}hC#YkmfXet^gH_F_pVrD;hT{bcgFGwAP^l(Ma0
z6Ua$$*}KF>hH at M}Jb?Z`Wp{T3(}B=B`xQ1#S?0w*rzC|vD}n=q?y>}E8*zRF>Y5r{
z;PH=u{*rimeetp!!IzVZ)_JOdC at vyX{FdxXUR6u<uf=rq-p@}P8Xw<joHM9@G08OI
z%(y>oKT8+(`HX}`whb^Ev#kMg&+P;)mW at HXd=(j$vcghzwNVvX(eCKj4{X1t-UAkW
zeZ2=A@?0w&XHo04B?)AUrx!mC*{PC$SL*Vz+^+)RiwjjCvldz|C`*(wOow-zIeL1k
zY*(}Y1i|mRDv0L?0($oHsu2h&E<sTbfOQ%{<AApp?1Y@un(7>{_z+-WnM1_gFU>Gb
zYU9rxJ>&y2DREJl*8so+D9u_2LlOW2sB0ZDqmTk9S+}{^d0k8Z07Aee0St;##VYnK
z>y3ex7h}9pdMzrUla`b`jl at 6#iy4hixZOKiWKE{dnRsBRsU^m!GygH-HvX}1mj~*M
z!jN?<)nD<vs*J@aFn8JzhdY{MGkLWn2!Rv0?TfoeIPcHEZCG^9&W84Kri|odaILM2
zzCC;ZOz4mqXV<eY4{BKAo0px4>EI8$#;(jvl2c-y;4M1k$tn2(z<z~lQ=46G?;&F}
z+AaH@>UGihcfjV1M-H34s@`~;*4L;cm0i%_qhg~XST^1yr+r{xESI9 at 1XFQmKo5k1
z48taTJMu+>!~&V=u`yv_5RL!87eJdCu)ETVvAHi#Q`k|Vsqfr!R;s_2aB&a&n!Hv@
zQU+-V0p<eef0WqB72#SK>gv-@=Re&v2NCToXO)5tyU~(%+TrSFx#-rXk`mPv0NVs8
z?HJh$XBWtP2Y=YQkrpBbDj?7rGQsztV^)gZ at Rh+ICwUh=L5!>9YqtXe-c+{Al{<zJ
z<@{L=+sex0lB`;|*w|6(<wh@$lAeMdzE{~Is}?6IIet+?LsFvU>FFB^d9REvueY3X
z8R?<}Lqn{APFn-D0H?7S&t9lt1$rv<{giB{<BzR+p~&e-{`BJQE;jkenWZjqQEPQ%
zft&|g`^?jB7DTMulH!4^=x7iy7XvOfI%<hnHHQ3#hEyOJ?8FKR>DWPX=KhgDstgU6
z89m<*{M`@NYXOXu47Iqm_4V<*Q^uh+DS-Zdsx<h1;1eA6Jnu0G<oCL1>@Bcip#O_Y
zeg+=KcIXO+85upIXJ$5 at E;aJM|Fkgj^rb)*v<Typ`741cgx_B%A`;od#MJNq4WqF9
zC{PRx3^R0kYK+AJeh7faESd^Lm-2tWBovsOaF|H21IRaBp%}C1t+qX|rTxiqaQ?k-
z$IUmTz4xAs21*rq$=;n&0wGb+AiNS6x9p+WS~f-HT1{ygm3IL-!V!^?^RzdfR4H-~
z6C2i2;c_UhjruByF;K>a1AhvP<WxcmyqJ5dwoK1}dI}Z+=FNkWTxxFaWE?6f?UaD4
zG2VxZ!C2djd|EZr*S7Eo86Ed(G-U_9{`mZ)^K(mKoTeTlvnvamZsy9S)n5cK?k8;u
zIy$6ACQrAc#Id_Ba`HCkm(H|YQy&fMUG~i7Q~xY4mm5albz>9ni~IYh(3n001o|Cf
zo0`hc{uTW%z+l(!>EHPckAwIWc5|n{A8t at k)%Kp&#%Wc}Kk9>no#eC<(CU%v?mOh2
z9k*1Qf7Wj43IK~m_3lgneu#|h_=yPu2e46)oiG5o0e|&tDg#dh*g|>2{urW|O6Tj$
z04_Wv%tD}$_V0|+0F5bOv>({?|J^$nTqcPZ at Zv@Z>^e0qAutsRQDdkb(F3L{=0Ft&
z#zVFXiP2I8)C^^&C~bD**8gy>AH8vLn_L{<1gZ-4EpJ=ZDL=8ZCz5T{qLaAt!onu7
z%qC@eN1MwVNYIvUP5N_MTz|veS!hxKYY-E6biB)3f9*IAcKhxtD@*3k;V=3|R<a$%
zcO=sb=GCZqC{Hgyp<{mNoUPOyoGuGkf1`zDkQCG~I>1R)Fb*=9F;9V^4rfeGe-XsR
zr_tZz{?;<2F-W@=NSP_5itJYl$IR*bo1Zi^-X$R^$w8SwoUan9cN$vlKu@Xqq$n-X
z$GMj>G2h`uBaeGqvtN at c))?w3isR&u8$4}7O&O1jF#SQnH%q&BcUu5m3N|3)Qmy{c
z-PZ7HOMCjDNmj%LYwrG^qKTNOv$eFR5+Ma+W1OX?*FO2)>?{<d^gQMypJ?p_*S2qK
z3Ghp@@=P`!o^$%HS!|l{udf>{#i(@zhHEOh-iN{fFi^^#|6+Z}fLW5W_f)uSVXmL8
zPwY3?i%#w at YG5$t5i8g394#sprOQnuA6f$l`H<J<&^-S|$+Ok3ILPnlX(~UE2<3!s
z6YT=G7~mkcjoA$LU=%JP^cnE+x3W8L<4gU>h6~ixRRY3*7y=veC2rV^l7iybOpc`@
zE#5+F#{I2b6$S}58bawdrG3o%{$vKW^*y5TcEiqzOfGL)spu9#ak-i-<XV;AWgkh;
zj;oE&*P}2u?n$q*aN=#8oShrf9qqnQV6!`}dx{7&#SoLD)cRX|DWA-m_bK|p!f<0N
zH*1{OavouP2g`2K2QMLUz4!bOax5=2G*UhO>un~RkuWMUt~=?8Ruude<Kj4Vo<$Hp
z&VH~8)@i(C?A4;(q{cJl&M2MBijc<Hcp-M1b40|-4V0Tn_gbFg#Rnoe5bKlN)@IGf
zB+o&D!6yh&WfW`{?Fd=JY)%d=oyqMG+T(I|hH`9K6a*!b37ari9ol_LVz6V}TfggN
zp`pOIe+b*yBXTcj-&p4jG$)myOxQdjbvE_c`rV@_=I>7;kmJRK0Q(c+;}#+kX684#
qKNVl>_XtVt`5phF&ir0_!$PWEBVVZ^Jpk at bgOQa~lBg0l3jPmQ40}`n

literal 0
HcmV?d00001

diff --git a/docs/images/google-logo.png b/docs/images/google-logo.png
new file mode 100644
index 0000000000000000000000000000000000000000..bceab166196918575f204d14cce4a4e6d9776008
GIT binary patch
literal 12005
zcmW++WmFvP4&H?Y7GK=mX^Rzi*HRWK6p9uo?yg;y;!xb3;_mLn-6`(w6e)iB?wNCD
z=0{E at c_MF;NeJ|#93~nm8UO&mRFIce0|0=EukVgv<kvfoTav@;1Np0xoHXF&zbmV)
zAQk|i1}I2NXt<}Hq<eU4%r5kQA5T~4rmSXPM*v0j66Dc7Y$61s<1Sm4g}xo4t^Z_I
z7ExERsPhIw5TaS8QwNonk%2077RzXx;Mx4a2QT2cawU8Do>2jRa11xScjE${CXPS(
zj|l8}jE%I7iwrwu$W08$H<i@NSX+Nc$Z>`QyfrNZW#eF1lYmA6wW7uDJkpjDbttqC
zz(@H3*TkeH%!+%XFOH6!j?ywkZ?Leim{4(*Hwsh=Kb|+vGSJFW!P)=^7#u6II9|X~
zxFJ$-eBgmj{nmo!OHGvzN>FUj!a{j|MuL_^oX~Q<E~i?h+tskCYvC-hxxG}fsD+ja
z=S&23AYdP@(_H=z!8*sVoy*iWgz5SHwt|h+kej`E+z2VzbZNkzvUoXq2d9Vi%P9L3
z+oLNfHs)96>3q!wqF6q3cc+!Ys!1pd?F%la!4l`YgJJVGTk8;lZxIm|i`{=2iQA*`
z*Ds#LzTZg*%~*bro`Kdk6&wo7JW}@XRPs8$MLcf<2%(aL+_O%{r|`wm0q<m@WOG)s
zUzQ|jXgnxWJmQ-aT5K$*yRsdedgQy2=?436UmmHL(xXANCd|_X$IW0x5qdZdDHndQ
zo%y*jQADI(-RHZlk-1OJ)l+?E3NCyX&KwrHUm=Lp`%1K;7}q60kJY2=5A0rSb^PJ3
z<m9A$H8pz5BBKUK_Uetw(J^l4d+d=xFkbVy{mNNre#Ba=Wsm0z+WH=;O$FZ25ywob
z%rxHjTICSyW-cyPb|l>fKr6C%4dlxr6THCE$}01%7n at 6k&Ak9WH}2;1-SAH~`>cv_
z`6jeZ`_cS%fr;IbFb<A>t4!AjbT153tcdWT;wqRhGBpiURjr*HmX@<T7iJwz0qap9
zDBF}~1Uj<AdZ3FCL#E)MP{%JF7y}A-_0IN%DzRF2UZCzEmmysD>fHpb)3Dl)lk~?F
zdm~<NJ`NX_K4U~BgRSYmL%VT$o66WNz;vj9|FCo$lYi_WEp|l^M$786Bm;3V|MTjL
zI~<>4)Xbm&@=%bI(x3tA*nl^3O2dJ)Z(lv7%8|LPj}?#zVwS}ncW<j(QOaj(r~26n
zEgDf?)Z?bxF#7GBP6zL$;gP)J#qhupz*y=Z>FV0(p{)%P4U(1pbWKN1DGe}w1J{GL
znwr^eK0*m<V+GBeum;mKL_%o4Bme1<ytdP2GiG+&&eaQYu(v;txW+N%)jNovWrw>n
z+xsjSPBa!4MiUQaLI`&lM>qz;fcTc0IyOn=G)tL3E5dWXVPQp}s-1PS*vtQk$sS4R
zX}k(Q^gvi9%-x at NKxSVMrPH5>@bC*c;%WAi?4#yT%THEdQ<}U`jMo>NgWF!c0Nc|l
zt^l4l!xy*Ud=h&&k3@`9m;|1SIo<eDz@QOSruSn(@Ll%e&Z^LdPSbW#vE{_#)*d~~
zvQ&S6sV#{m=r<FMaRd%l`6>#^3w`~xrOO`z7#&Xs(^wEk?<|b2%g+)Wctz~5Q5-E{
z^`6OCaaIH324c}PCT4B%)*1Rpb`{F|W)qZ{0si$BB}hICzqYMZ1!-?HE0D`c?b?+7
z1-CQ}?DX+xCvJ5Y{_T0$v<|=QR96>J93qwMt)h)g at Iq2b4r7o(MU{xKFqQ*Z#XDlM
zrB8Mz+X|&^eqP85vHZM*OtVg!x8y8_O)Vf#Mu{`uh$j}q-yt?Rr$zA!0CLCcryQ?|
zadZhvfw&$r(_eh-Ds(W>{UjT>P}1p-O0cl%*Z-+L{}^X+*{yJ8s+sdv`}Hh3UHT-J
z>SAdhYF7Iki+A4L)zw8MikWxm?qqL`%Puxh8cX->moYsB`A at mqD*ijF%&q*@B6Zer
zAcy|1a at rk|hfj|7_V(tw<a{~Y%-D#|NG0;?u`y;kb|K+9uV_v7T>KJFFqVz8z$;nu
zYn3g at U*8Ef-(Fu|pBUi(CT$VyflVVJ7Yo2*t>9y=V)#!Hg#O4&^Pl0&>ZhzW5(8x^
z*O%$ST(7JO(Bx#}0yo;xCdTyt8JWzy`kDD#sME!T#yN?=S7sS|e_Mv^i?xBmEl6;8
zYEV7bhcg*!A>i at bxVPX<KrNvF_lxSXO!Si^KC1)`{@nBD-KVooI2@0SO9)lM*Hf!8
z{4~oMVSxnB4N#^w*U<v=0B-#M0Hx4?_>vw8L!H%qXY~onT1z9vwu<2yutV@BMkhao
z;c+%@8E8Tqtp?<0H=2|}rudxFK7LwHhVad-h1Y1_BQTo{Cks8~ry9EfQHUjRH9^le
zoN~V2&&k(wIX2lt&WN1{c*S_a&_t^_fy!yT4nYk+tb0h*yI&~RNZXzOAJwCSKx5u@
zca!0Zqy{n6&52Zf*n2g-*;F~~XZ)ToyQ_chD2U!xrkRvwukTqDos;sx8!?n7(2;Qu
z1^bN?yALD3g2a4KHyP2n+JPpbAI?g+8lBaDn^UEgDugdF&HnCL$27d=K(bIRxZN0|
zSgHbJ%(Y+Be*17>fcKG^uF2avGAVcHhY^Iw6P>k!8>R^r^AQv6VES~ch09_1)#)b7
z1=32F|B!jI%XU8&>dgmm*WHDPfAuFQmztwdu`B~SRQBESVaflzZa!T^Sk>nn0zWud
zV6F=S=9_e8G^{Ck_DylFHChCaBEHS^_L3w@@uO1eV*N<(R0gDBpL-Mcoh4_s<M+f8
ze}2rCcW%{wO?3@UP42h88f&cLT*UF1QP=uC7;NdQInovGR}^D>rr04Uqb*PtH at sry
z^unke7nI5L&8L-JRsXg3MZWV6w$GmFp)P#6^569oXsv4xC_Xy#uJQ9n=s#<=5=&Kj
z{OF;VIJfF<^m4lCOwJ%x8Ph)VX=jqGhIjWC(b4ot!34!5X+h%O!S}zYZIJ%%%yU&X
zQcG6<r2DJY5^I!#jV^!%tLT#Ffk{GIpbg$JfGl)-bBiuUa4DbhvcKZXVva_EckL7N
zUla`c%;;@Wxngqh7{mcpfGf}(Yi+H99kf0hIB>4~3wg{^XL_ at J<nAwG{<6s9?r8}N
zfV$o?(PiT6-5*L$)c6ax8qFO*@U4p!7%E|p#hlrQ;k1+Nlwb>l*(|iBcuoi-U1dlS
zBVwHEAe`{@@FLmUeXu?*j95VIGaY65H_%Rr6m(~?0^~vL6c;OJ2AvB~zXYDYId-T>
zz>#@S02AirQ3sN6{K1Z*p$?Q_2fJXy!jdxu(NS7&hbxCxTyKg*Z3;AXvs({MadPMR
z1VKck-4+)YAz|}-!F&7TQ@(o3!uj=s1dxx}@n(2`7~xx(G};?3{mW{X^9ee#T#MFC
zww>B&?(tBfyQ-hVpv&g$*31k6y8~o^;m4m<HamL<b)2hz!B_+X%zy(4=_cT^54EdZ
zW`x!)S@iX(T8C9q41ZD1r?<JdDPeuI#0^feUo$>x2d!I=P)0HIqypHk^x$h~5pt}t
zuH!8nb}|zT*#E_4&7&ol3OK2!j)~x1-IgoL?6jM7zxX9cfMY^zhYvuB1aZ;@;$RO5
zGv6ARo{v%0E<SQ^VFcf5K|a82(Y|%PQ1>w(7*x-}?^B>$XGOlBVPaX&jUS*4+oMYb
z3~Un?EKZ8od9;s0uxaklGY(}JZ3o+_hB+5e!mZv^D!+51(ap$0q16FYEk=MfslYiS
z*x*Mb4v*i9+WFGY7dB?_+{ejaoKdWv;|zpo6kzQH4(4x>!ry5szE{`TIEc;x@##E@
zO|IHOFl)+Lu`l>qu*L~F#}++}#<I5DjA>unXKRYrf`QBI=fcL?ot+lLag%s(khnV!
z?g1+Et&OHBI=UU at A}g*B62Nzc6$ep`5a5kq7>+Ho3XB-zs<e(Nj|KrqTK}SuXz-FC
zdm`wT#S26ogG_w~;ki~eCni`C_39-C5Ned`aC(;Bz(L<;SzJJ9e#0|yUHM;yNs@~O
zho*1_o6|DE`J6dX=)`!pId-Zn)&Owkh&pvHY)4b-@)=83k?KDolmG6Wot@vr^b>4<
zW%jMWVJ}A<S%h~-BQD-sj&m?;CwS7auIsK!L`KZtWPS)}5U(wM`4znkC=9D!Wpihk
z!C4LPcw at OV{_dX`4iEV at +vqynKLYVV?AgdY^T#@FY1d;<eQ?ARMrh)l`yBWjh`~(7
zf*95i$SQT8SO)K(CF^NP8FzPLP9E(Y<O`T@`3+sv)anplyUY84v)pPUyD3;wcIsaL
zNk&rgaTc<l7N`{14WBO1JbK#!%B9&-wQY9o#G`(J-cI#Rc1%+G_w8ugvEL~%k4yG9
z-5rV8-y&b6_dQLFQLmY}-Z&u2`6It0Rs78vXH@NAvbGjxFDSm%XrR<cSV}QrbgK4+
zcXaW^>wq>G1K6nL^kZV0%*?y?T}z@(DylB-8dlsm(Dj-|#gCW?@y)Y!|Ib=o{c3Eb
zVL3?-xtb1JSjENkxm<$HX^|(O^90_Uy*-%-+&)d3^K>Y*sTjw>zNKi?huL}88JrD4
z(Wr8tn)%hp;PurPDZbdiLtm<nh{UMLlieM5)Pg6rzoKOv%u+y2t7U8-UazpoFOD4I
zQf4PxV2#}_`#90r1#jiG5Xrk=nQKLVtQv#9jXreG$=qT&p(l`atENob!}bp@`r4(*
zur3^pbXZ%<0{|+wbZ_O56FVT~X}_Y$naP<ukk-|djV;9gk^cRXNmM*CGDwgJ-j4JY
zE%%!*!2=6X%XlO|taR1^;9e}?amV?-oxnHmr>vXn*W`gO`(};zCUe4Gyd+C)>XiiB
z{+_>0gc}c<eJLW#?ZhXhLd7|Cm5-s18oB3-?OJ$Ar+X;0%1uRo(|UzyX<Am6#|hzw
zDvN(viph8lR&F!wO)jN+XzF);z(V)j&>Yde&LOdd$&UL0j+suIWkBVJ>Ce0<J2t*a
z<{lCC{h#}Y13A%sd1K_08%~nra-a{6+^>b^jL11@@Ou47(X7;Q6d5X7MN=*!!Ha~X
z_cDAb+%mC)NJYLjQem8~N^k4NZF+c(N^c%uF$kRsPx`*5Fxpr0kp3--y=&gN<<#^2
zQ5(Zu^h~zThrUeEKecIlKzBc%!4lI|gkR&FiueYtnA<NDZYG&2pzeMA8OXihdD!m+
zQjk%{T97Mq4FWemq at skas|!8UiO_5afHjd)ze@oS(*ntnKhW-@=K<!*5>eVTg2UpF
z^~QnL8%L{j|D;>s2w%)9Ub6=3CFbbEOMbT%+kw5b){KDVAv$8}Lf*e31R!UYK2r4l
zo?Et3cyM^>PublOPMS1BBQ#36O@>|2*xUiSFX?xZPL^k~eru9ircH$d6X<nImZ#Rk
z4&XU0v$j>O;pw&VKy)z3;tK6E%RW4dC09l85U+7=;GO*>WfO0Q7(nM4$vA7;uK!u`
z)W6{7T7H0`QulA(0i4TLKzAHqe!`zaJ?VO);>fEv`#=;*zW!2Hnn3BA7Qub8_hiO1
zpxyiniB-SSLFR0!bihzF1>jAX^^Zq>D2>4H^sX<i2w-(3H+6|`c9ed3-dHS$KEXKA
zS)Od!G`mY_v@~5tgnFLbmxYULQo3^aJKI((Ir86owa~}HEx74xb7aU|qvjS!1LdPE
zLJ6*GjEQrtxB8A-!_p!r+}Q#0<Unnmj}l~QxJ89g>iwqamO~H1ikK$s)a(F422yj#
zGtcg5HJ-|76VDbA&Of1l5~N{SO$-}%VD4f^974Xa9*GYI(a>-zmt?J9#<eKAq?Jd~
zI{L<?V%t)^>(qXpmHFJV><9h2KSrqO_qb%FMI!}JQk7=b>E9y9%EsbtB9pevdKk&W
z_%dG!pS(CRT~c^d|IQnVL6?93ExrEE=<A!PTV#*QONIi!8i~|PdhxuM^Aa!rcLMZl
zT61bJU%w$p@E^{>+NZKT#EC%}s(E_08{A=p+78yRQCvKP$nB9&2`-r3Zd%u4%ltX>
zZ?jWy#czPjtvMfD9OfR`*#=Txc1nM at rv@V2TB!U!EPsD;+A}y*f2^;JWa$_sH2U|q
zeuE|mPbfQt<X#0q;%lhp at 2a{jiFz!qvZ^NuaG-8|3q%9`t@W`<w!wPc5Tm}90Z5FC
zq-u1Wz(Y;RuwK(>Gfn=$D4;t#(HXG7l$DMDhtS>Z?|Fs~dXT|m^Ab0ol*3#33mPYX
z at fAENt<+NN_Qta5pcg&O4hkuJSM9hJ%!RHRZb1MFcCjk;G=f-^r4l#%(DnX2%uf6|
z59znVSiVu)7}g9UDsTpb`I{^ctl_;nGz`=L%1uh{|I@3N1{oKV(EjBK3*^8H?~I!2
zofO7ron32KJ%yW^&bd5=C`)<v*tJ&A_jGTx%_VarAT%b6>xu~Q0M>G85UWN1+0A2}
zv8Vd>p}Z7b&gYZSrW)C#XUixmUN4w-@@+WpYIJf$WWJYA^Op3c?6w2{xFq${Z{A^P
zrG&ju<A$YPAvu2|pAqf1c at zIYL|vp!5{zGV*%PlDyzAJMxx*qQXdx_Eesil;xA<r_
zjEMVA?WT|YosDW6c9(29d@ef5jwBC$=R%2LsvQW!$LesegcuXJ^Tb^?k;oZF(6}d{
z*_mqp;oyq1|Me*k!(XIqPGFXqe33682N}hS3>{KOZ^LGHB2-yx+uv!+7<Y8Ncp=Ns
zTpu22G5M*GWO?+lTmmgQyXNTlqES$;Smn)SE at 4z%*L9X{X`di%WnztJ%a^yEVgB6a
z7BiaMIdV1K8zN`S<a18RP#=s!YgpCw;#Eu<%I4)yk;L@O>#l0yl9of{bu^j}qU`nh
zdo$e-6|t!DEH<#ojO1lzlYQ^UC<E;z-%K(NLu3K@5(>_oq(Io2&OUqAh~M)PZdtmC
zl(`glrud1m>A6~I?OgFw!c<#}2T{~0+<Q;i<<XT7tF6*)qcZH<*<VrusJE)T0SZ|=
zfn%D`T<nxZmlmB6+vj at b8D(iV3x~(KnHfdwt6zwSo%SZv0Rp&_e*&1e=pU@&5y@O{
zZ{3jy5hr{unm)|vgV(pVQtom+NX-u;(pqubM7=B%X!Ape79HN~m;ps+n_p06o#_H*
zbpF<vGoSQxXvjtE=-i#wWT19x5nPKglcx~K)l;&>UC`g(RZXJxNP;uREf-D^TQ*CY
zIpsbq>$PKbA`u?u<>zZWm*Sgq7&JoVsSI5554b8Kb1 at Lrrl$(inm8M_INKdTJRK?_
zhYC!2N$kkAV_1l=qCYsI7z{mL5-W;uWX?&U6^7rHsZ=Ed;^K(^@TB_znU+ZGoUq|q
zlK?bTg5y*o&bRDU7TAP!!wPcg-GN^g5%|9{qX*sWQ%6<N+u~98n)&KVpbjK{*zw#b
zl`*g>df0MQ?u9$;m$BYW_*O>Rzay>6{*b9L`HAJPIw~cWC^;6SvAO-VzKqiO^+xti
zzVIOa(<!kMVk?&Di)Bu%E8L9TW)#JkLK_u24n;V4=5>~5ne;eEb+&XmJN+p1Ja_nA
zlV{csUYunaY;mDo7sV|%t%l30T2KhI+k5SLp4|+!M&Ch5lmaNP^d`{_DGj$>TK^sO
zMqiEc0K~<Q%v1vwvdQc1!2k7;>Y-G$)v{A`+t+#Hj1+v$i`=<#!UHDhJRCIE*fCZC
zY?;2FfYqPfMnB4n$$kEm5Kz~_Oy&P+O=sehA@B7Q8O|4H22w>m)71NGNHn5EXxz&m
zu1Ph|xnRSbfCMc<(?dVK3`y~Ce)}80J}?Xx#LM4)MAr&Gtvx?dq4j}v0RSpxs({h!
zgkSu0WwqXoC!_%i_qn0vxwlFHGim6E1XMOoIB|12Ncn3#k`{)nn#wy+EyU%^V*pLq
zy#6B}eX|ea{Gpu&B$(4j_74}PucG-go|APhGNEFX4D~{mCxw8jE|I9T-Z#~<v&XM6
zo5Pp%bs~HhtMCHT)UhzlRj)a@VLD2U9S&rG#ty@&T94zKR6lw{$=b2sy!aM)ii>Z0
zk?5yNZ+g3BByHdMuvtWliF{D6tDG>rzoZoTsZu=)V;(|&8hay#-Ev97Hhde^Rg3?2
z(RF{ta1ff(?q(FGQ>Txa^Pz&|;E$`8smUBG!AErJFCnN$e$fP1RA|aSN-;P5-k{u>
z5q&Cn73k)))qb|bHOOFkV_+;3yb8!}u~pYXA<p2azr1>#*cA#WQz06sgs8cF7D0Y3
zIv|FXnnqnErsIrA!o0h<iNiA;-@_9W_5swE>U6*>I-*HCXB+f_I{FD at g`VhP)ghTe
z5I3Dsue<j{^KNjA7po}!wq}{@>*PuoeA26{40=}ifV%o`GO#q<l^Xs;DA-O)J3i}a
zxw@}eDQel?7j!oWZ65tzHRq1jY>O9k*xxuB1mF(k_{cEMRE}sU;Gur0XX?o(2vEIL
zsN~9*yO}gK%BSNeQss_=mV#a3`y2 at OPBV4uWF*=hk|Md}6S{9i*2O9VP(367D-Q))
zODyqp4J!S*qnD)6;9?~oAKFgaymO%klK_<L;zEy<Sa{;NPHpjIZm%d;9&>tzCPL?#
z^Ar`xRwd>0DWA#IAaXW5aO5(yWKl5{`Ijw!ZR9*oV8_C5wx@;Cv|j9Ns`_`dP_4BU
zM~24?AX`epKLHrSVhI+lN?k_>*J`=G$;UEcj7<!KYJ7oubI-yWkvCX-p8g0j*0b?!
zKU~kZ1G82a(G9S&F%y}2QyMglvxW-{J^?0p6F{DF(De07%&MFcyS;CYHAvB%9Ltj;
z$Vw-PQcyEn|3kisI>H_j9uy;$iB0lm8Itc8?~qmSl~wMwKA$XEF#&ta?v-MXYfL*m
zBDTB*4 at riq_tbXbx@InI1U;h)Ziz=_7d*11SDzXb9K(F~1!tXxVZceH#r(!ET3W&X
z^v5--6<!8u4GY^br}#Pw^-`LV^*UB~MeeK+#<lmKu9MYS&#)U%lH=oVA^aV_50GsF
zWt9n0=?Q2O=PqAR20f at _BDe2J{l|s5x}7wO#?@0G8a#M&<o)-i-oc4~cm_vA at r<iU
zdI`K!$36BEd=&E91u}2ETTB{9cQlXb at lk#hxHQU_?V2Bm36_!cwLfH4PIZH~E=E}5
z-2#ezcDIMf0K)nmdaCZ${k1<XZmfw9o|8PCzcjYTz?BypP<MznZo4RdI(ZdB73_du
zQ at vkXtNHH`7_|lCp*=*J$ALt_Nm7m+acb|bC{gY{JPMOIviO23^$d!y_WCPr%Eq{w
z7vzd+v5c+1-`64rZ}5P4t)6!!FBifGciz`9s(x?d4LZFVB<NuLCkVV%JxK;Ioed~I
zrk}JNy5^iyp|j6~bx=9lW||jya`!(3?I at IizvsOKQ#n0}?vzi-PI4aodAPaie!!7e
zcl$x37?J;+%=sl-?OolK#$kFV=7tpdS7W2*ax9g<_8iU_JIEx+HuEVt9Sk;je8{j$
zNR@uyS?o|<axAMH2qRb|f%71iRn}BP)AwCxEdLON5~u~-RBSHmSl+%&EzN3*b=O`W
zD+*S>XsEwt!SEKGN)SoBw}WNVw>qkCjE+>v3>qD}bUWP?94U%F&P&GE2Oy4zj3J}Q
z?A;cJe3Hnq2;&@2(d8LZ^Z1heF|+I%#ig$rxe?T}MA%16f!dy!p?_!Gw;f9Ko=GcQ
zA at g%|x<J!qV0Z|DIu~Q&%X_-=OF7^!jK4yEg-Tg5bCV=QQ(ukrPsb4^V6#XYw3!uf
z_U%ugpV@6gflBt)t$aLslHw-JRL(QYCSv1Wh?e+y)wb~J!E7h30N3O9koz)skDAWs
z7AUeH%Dl>M!<&DM=coT{&%QFp?MF(RFpCB6dw6Hs^XgIyf+i!+i=!Nsw00R!R+Cem
z)8Wg~h9v=h+KeGW_!kJE8iG4Uq-pu45b@?nL9xc=)?5?W9MiQ8bBDRTwKG5J^O0Q2
zAHwlshA at H`+ocODW~FcWHjMPr4OC669^MD)*{m+r5InM5!2uD%Rc^l0_T#i*hF_Oq
zgEjC2S#_i*5mRnqz_YDHHQCo?(&kN?Dbf=^YTvYN6vw;(JS9=)L1pinM#idGsBKZ$
zgsIg!GTL^+i3-zMWz{Hhmxg6R`~hDVWsw at rtllFm=;}?TiU%peo4cq;@qw9bhdh;_
z{JBAiexzYn|F1g_VUh1S8NZ_4Nzo@!?M;;<SzRUIe4Tj<p!8Wt8dykx%LYXrpk*}A
z8Zxg^^~W;R31upHxAF5iL|LTRNM8^kw90QfK^O=NvgO!lL|2ki%|#9q37iei2}i%*
z!d;Z4jUswQ#Tt#)7euU&(;48h@1seRgCUXgs`e^VKc*_5dOw=<*a-JEH^zIGi1f?^
zV#HLrLT|A^H3<9CGUi_I$rqn|C*f!|lT$9S1nIwn5>f6RMVb)m$+BNFQ<$4*>f_?r
za;}h4hQgux;|Dd*i}wo3VVMdszlr?3T>3sM7N+`CP0|3A{Ubkn^YtY6bZE*9qKXt|
zzx~c)ify5fQaN;Kg$){Dis?^$EUW4(FQrra;@zoDRl$moY-M!sBU_VDNAobR-3utk
z<lkXjJ5K1>Z4~YY;#@ODJzPDMQf^pt%X1iv$*M<bfhGzFLpv<MdXMIXd#K{J5v7#T
zd0x-W9 at HK6^}uc{&QhPVF#R at C;q#h=i{iBSi?T4{V8~xvNK#5|jkCn%iK%D16%$Dv
z=cOFNms$h%Zn6JdV@Cd{SI{lD3h2yo-8Z07axz5l2lcb#5kJMdYq>I`N!)ovAe;gH
zh50v5wEVWjU_QFEO4&t_<d4j}fn!f9SpcgPBZQ+2vn|&y>`$8=``P3#iT8-+k(Y{Q
zd1bsT^D%$yJebk|e#08!Ln_TBg-Y~7_^i!OmE^0$olRkL$NmGv`)jJGwvp9bKA0hx
z{>=vJiTyoH8ru|mY&yT<iFWzhyJ??%djSBfpa1Ow)MN!5yxDQ{roz$lFJ3yqGXE#m
zPbo~PK!FgQqMh;~t7xuOb~`1Q6|YHQ4rgr8pamYMTN0~5QxR;XSz~Xy_V@a-W(k&e
zV1HdYlSfMqM4$Y2IO(5nB{TJBYLMS=Ip{cRX_F@`!29zWt#MBSV)F_fi%&x2{$x0s
z%7a1H-j*3rsh8Ny4Fd`qXDbkPT5gSj;o(nZ(HD#nkkCj5>j)2)0oX-NX1Ai9NF)aa
zBxN)*K9yGkikww2Qh3GA0bQnqZe0>aR1NN$We4-UcB?Ke%#YfdZ-$Qo3C0W92@@C4
zVe#gia?^3$2MSwCm$9eI9;(4MX;IEBpKpm}R%<y%{~g`?naOQmDNc*<ya%UkcpXLx
z=p~kVG3$~zl7v#X6889xV!6Rt?Br-cWNUJ6%pN0=%RbOn#XxNVxP{ox;9%ZFW=&)K
zKu63OTTKf71VV~iv2BzBm9uVTl`QoFAXKVw6`A8w>-Om0gns!@^Y-ArhUclJt#xhX
zEnO~VLg*eB-^|n_3FLl^n&ruYco?^z;N{Kh8Bz*e5{QPtP~7 at g754>}aqXkMtxmE|
z>+>O>#nz8QK##c>>n)>Aw?xll&R=8#H?3wyC2y=W53q+iPMk?LTjc!*bOG&@`6ASE
z1M#1Y5?iANaVo&=RZzNK*jt6B7U!gsX7IHLJLu#$j?2xI%MxIV3-=Sv+ar>!M;)xB
z0IPe~)PH(sV at 72wgjl1Y5BUbSNAp)F3E0tj`7AH|w|{xof?Dy~nAmGtx#(P?z*GqP
zRkZ{5SAUR*ZBh=GdK?&>V)_WMe~!g1hmO4-LTtKKIdjZg*VMb_tEkEtv1g?x^D7CD
z+eZ&BPXtBZ{>3n8R3y at vYP7)1>UZg*jXq=eYXP6>0_L|Axf9(^k^=uCrU4ta5%-;2
zzZSwaAx*e<8$(s->KB>!8+YKCcjC#Jj&281^`b&?<%E=BM;uQ>l~Z16HO?nGQLkg!
zz^_W+Z;+8PPF<O`tCRbw6j8mv{pN+T11Hz+lvTZ;^3$c0gC{RzH}LEikQZxV^xlh^
z9?(!768NL4*9`Fzt#l9h*3TPTm7R=nt;C)4eQ7KXa4`Q(k;?@V8W#v&1sI!|!Xnp8
zPUK|Ly#Sf4z-%Mo?vVSA-y<nWj2&&~u>=Y8!5v2{0yT3dV at MoR{rz<a%WF1+_ZF@Z
z^gdmY6PWp}DCUvk_3%~^d?{JUN&uf<4EkEjvH_6%-R}$k*?KyKrJ|*jIdbc2!cC^{
zp47nz{=3%<;{`$WK)0mj5>J0i)VDhlk^-=fP7Nym-N;5aBY8?Ls|S~}oH!kTS9Rej
zN|i2%4AuHqR(IA6gcT`D13&_3M&w8D7xj<NnTg-?zF0{NdNEuhGk<H03l+wS3IhJA
zBdgPf-4f(=VjBB+q;8K6;8a|HW4^#sTxx3Nr&{;mwx?un1L}+w*(7EQkEHnNRS+_a
zONpU)gg_!wlyxi8TFjLvgn8C(PGYiql0J0N|I6_7Es<Vvu<b&A0~D4Fw4+0<>U$5c
zo2X!LqCVs#p?qBsSg_A#36$8T0kp%zXAmy=j<v9<1RWRlUl)q5(8NVyy`ytd_%Xz)
zqVE}MHOf`6g|OMS@Bj)lvo9fS0AJWT3iLTBB_-%QRYu1nehzy-LI0>X4Dc%o>x<?D
zlrN*h`8Q|uiB0A%<Huri8I==6>QkV#8|@9?-$ziYJUO6}C`!*TeF-!Bt8^|BY9d$-
zH5WY!m6||2sX)&}s1re|sQ;Mqp!{t1-DLQVI<+tGDd-nkj}XUsGEjSuXH*aQYilkO
zGMk$jkPTsm0H(WMFxmzYJzQ8iK0wzhoxohSBJ-xA0}5lVJEPA&BX%)Siw1?LH9`~9
zRiY3!b-~Dfjrh+sZwSSWa&%1 at Fm#;d+e(h-OVJAm(Y#n1s~#8dt@P2~mmi}J(865%
zP*+g$0yi?S6LrcOo9z-g0U6Z4c^3tl#q)bL2JKqP48AX;bALVZD>7D`5{5g_l1Dbv
zoQCv8Qlo>ad+ at cZ->}=L=OUF;PUN*fDUlp_Xm6J^{01UIKD}@DzSooaVPf8eje~->
zMf2|+tabpk`z!c)CTWf~GD^x#$79e!zoI3b<`5$|n$eIIrU9-VoZzjKUeAuHGJPNW
zlKsi3FJ44~4Z#{S-x~lg;kfh9N>+NRYL$C%*NSDlMNC7WR{OXcCcgFjx8w7fTOaOS
zMC|c(6)LL2FHmE;xY!So>M$^+_*}Fu(uSEvwex(~!Izx8kwf3~C1Cj%q)T+ziM4qQ
zbs{ueYZ-Z$H&A#`?)O5l%zItbO<q9a?+mY85S-6&lc0&z%G#XWyP705MZ+^1cZ(Lx
z26CV|oU@|4{s8@<KAfSHPFXn<o?RwxObGDW8bHf8x<sM+GdWWX+^Y+0*!>1E2Beuu
z#i9U`QB>K}UNX<n-~_f46uWaB%Tqeb%0b=hvl_$*7Ev@VJ~u#J%;-;9r9Zf|KDBVo
z)2NVo-xvMnYin`!SJI=2lK?bl*+vWfx$<U*jZ(K0N?nR<Z=#DWRleUGS_G`gC=nB5
zbP+)Jff7uBGPs61z*YR5;xK<cY!Y|alv?uhczxnFs%bjX2%`xE7H0I~r~w5%>Me}S
z^pon?=6+tOa1yFu`Hi{hh`U0qGu~rM!`r!@NH40zQ%7ac__gLH-yC119~#qlEIf?=
zi>PxIl7_wc0VEhyB8Lge)A++i+Y4w2HbjTL)2~=;G*j7?9f>YXZwDuKXKOn=xb}Y|
z$w`^8?+sH!21NZ)N}LIvZ`)dCmlSsWBfrry at B^KsFpNf<?}@e*a_nb_ePd*0yqKhr
zrZG8Wn$i$`sq~rZ$sOu;Sw;%iTj#WhWCuaiuE>FQ?5WB3j?6A(Lc?BH=7E2FD0FjD
zpiMuu1tA;0QkHxf554)786mQ6;T%TRrowqQADA;FjM60fSnrq1kfe)gO7mG}?OTfF
z?PfDtM=p^y7rKCeDB=3Ih-|AU>#iUwBr4Da0R|gQ)zrx*W1^f5>(KDkQBtO;?_RRL
zLkAMakMQ)XV4B1PkyJ|$_1<h8Qbm*?yol|kVI5jRYzclGKR)ss;9~*qhz;T1o%O?X
z0Y&9o>$k=+dOMN8M}ktZjwLAF%8-HLg0c1~%THrw3i57h2i?Iu+CFpuqJTV6h<%Dh
z-}a{+hCov2E^!P~945*gTA5wvNTIu^ODKh4nj(MTR2L1tqd7fM;x6P8@+c;!_+whv
z>&|}A>Of~~PE(#-eNuCIR|uAO?yOH*eiJ{=U{muYGd5Y4+-12dJDMwjQ=!+i2K7$l
zk!<h@qOT?T{zNO9BL)Dy`#N>QzjK1pwM1Cl)XUv3E14Nf(hn8n|4b7kTU~O at 1DHo*
zt}~Dh{50~RCN6;oKlGC8Rx3Bp#Q$H7E5immZQ+zc$bTxmjndG)VGe;sr~Tl{_x?5%
z6F7w`ki+^dPZZFF=t;1B^`k0Y^XJcu%l~wdh|NW1kODmO$`4d{?9`~Oh6nl*yjOq0
zIA<3$8tggOC&#2v(IA&PSkL<Xxev;j_ydGSRgC`vQRaEWszya$#qXYvGs~FbnPL8a
zcK-A%Z8%Xi2!yzI&8+M`Hi$*rsRCb9kWWF7KXS3M+m3kYKmJdMhy=P8!FP0!+Q$vo
zdq2&K=>E>0h1a}!9*^Qbr9s)(|I*DASCVZA_SHJ)3R$$VX$&N(eTvc(egl7IJKKXp
zm9jfNUXl_Orl#<1YMA7g0h*RF%kgXI7X>rq|8FKRnyi+jMx~PKtn`<8y6xb^sIq5g
zf*nh8PC*sO@}y>GS9TR$jvA_JmlEklAh?!9Q^G!N6`?3ZpmTO|VqdzKMD<k=e{(jF
zzaDg-(&kg746e_C0=1Z0KdXvn8cv?S6x0OU{&ApGlsor3BC|2D-jBTvsooSv<deN@
z92S<u25<T(dA6X~-B|U<$vHv*ZXaRhI}>#(&xC%eWih_R`}F^#MgtD5Rx^7agztGU
zD{Mz$gl~J9M`!q9?Ow6Pe^T>I`t`^9D>M7la&H(4O%N6ba$`^Dz}!~oy^Q+WKU6V#
zardW-`=Zf!WmhpW<&}^BHy7lGR1w}TJcpYNEh15^FWxmgp`GphDT_Gn&q?%6PGT=6
zM<HHHqI^8?e{k<pukMMPB7{n?7fV-Mj#-GjMjU3@x9%hgzL>+5d%<W+&tCLF1HM{O
zCiMT%pU7f8tF8M=Tw(E(m4Mj>6AxWyt*NHVwHxn at nG%tB`sj$3W3}8i)?sS<`X}<o
zF>(|X<rq75D+|SwethRjsIr7f{Zgq<>to(@7;U!Jqp}#i{B)9-xP47zB#~yrXd{Kd
zl=)>wX7GQ8>_RAemESpe)s02IS|ggDT0DdLbasd+wtgvRguah~d|3dk)8Dt6vt3{B
z-_sK_ at qV4mDognPV<E<UZ_GB-TaWr6;SD<2Fi(87EWm9rqq}=F0b>E??Ix)?Uygs~
zf<S_)c(jFH6$oF`>WCttpGom&`@fg@?HcnI^ita<h<gUk<BCwXGnx2<LnTg;b4k}J
zC3PW;;+zr~bg1hBKb-Nh6ks=+#8D5d`XkGb41FxQE#lYw1Rcycv7}ft!==VU!Z2(l
z1q?-odRxvbk=P-27als|ZvIEaVevdX<?I&jRvonf=3lI#lAH@O)O6Xn{hMAlFtG7T
zf|6?P(qAu~NX&=p$O9Y0!T*G{Ddj*?^DE=m9)8z<4uX?4OR-dqQAxFaid5`G6GQq{
z9gS8jRBcVlq>i{RW{7C2!zF(nGweTHNMZjaO;6S742~)3C}e7F7^C9Erag)Oav4CK
wngQQ92zUPG-=Y6f{kXt8ds&&F;J+{aDjWplUB0ESd+PuNnUB)tl7{gA0b1Rn&j0`b

literal 0
HcmV?d00001

diff --git a/docs/images/imgtec-logo.png b/docs/images/imgtec-logo.png
new file mode 100644
index 0000000000000000000000000000000000000000..f8a0ffa372ec4c41de18fb4a5edd980768b7a2a2
GIT binary patch
literal 5276
zcmV;N6l3d&P)<h;3K|Lk000e1NJLTq007(o002A)1^@s64Ib13000V4X+uL$P-t&-
zZ*ypGa3D!TLm+T+Z)Rz1WdHzp+MQEpR8#2|J@?-9LQ9B%luK_?6$l_wLW_VDktQl3
z2 at pz%A)(n7QNa;KMFbnjpojyGj)066Q7jCK3fKqaA)=0hqlk*i`{8?|Yu3E?=FR at K
z*FNX0^PRKL2fzpnmPj*EHGmAMLLL#|gU7_i;p8qrfeIvW01ybXWFd3?BLM*Temp!Y
zBESc}00DT@3kU$fO`E_l9Ebl8>Oz at Z0f2-7z;ux~O9+4z06=<<LZ$#fMgf4Gm?l#I
zpacM5%VT2W08lLeU?+d((*S^-_?deF09%wH6#<};03Z`(h(rKrI{>WDR*FRcSTFz-
zW=q650N5=6FiBTtNC2?60Km==3$g$R3;-}uh=nNt1bYBr$Ri_o0EC$U6h`t_Jn<{8
z5a%iY0C<_QJh>z}MS)ugEpZ1|S1ukX&Pf+56gFW3VVXcL!g-k)GJ!M?;PcD?0HBc-
z5#WRK{dmp}uFlRjj<yb8E$Y7p{~}^y<NoE(t8hR70O53g(f%wivl at Uq27qn;q9yJG
zXkH7Tb@z*AvJXJD0HEpGSMzZAemp!yp^&-R+2!Qq*h<7gTVcvqeg0>{U%*%WZ25jX
z{P*?XzTzZ-GF^d31o+^>%=Ap99M6&ogks$0k4OBs3;+Bb(;~!4V!2o<6ys46agIcq
zjPo+3B8fthDa9qy|77CdEc*jK-!%ZRYCZvbku9iQV*~a}ClFY4z~c7+0P?$U!PF=S
z1Au6Q;m>#f??3%Vpd|o+W=WE9003S at Bra6Svp>fO002awfhw>;8}z{#EWidF!3EsG
z3;bX<ghC|5!a@*23S@vBa$qT}f<h>U&9EIRU at z1_9W=mEXoiz;4lcq~xDGvV5BgyU
zp1~-*fe8db$Osc*A=-!mVv1NJjtCc-h4>-CNCXm#Bp}I%6j35eku^v$Qi at a{RY)E3
zJ#qp$hg?Rwkvqr$GJ^buyhkyVfwECO)C{#lxu`c9ghrwZ&}4KmnvWKso6vH!8a<3Q
zq36)6Xb;+tK10Vaz~~qUGsJ8#F2=(`u{bOVlVi)VBCHIn#u~6ztOL7=^<&SmcLWlF
zMZgI*1b0FpVIDz9SWH+>*hr`#93(Um+6gxa1B6k+CnA%mOSC4s5&6UzVlpv at SV$}*
z))J2sFA#f(L&P^E5{W}HC%KRUNwK6<(h|}}(r!{C=`5+6G)NjFlgZj-YqAG9lq?`C
z$c5yc<iq4M<QwE6@>>d>VnA`E_*3F2Qp##d8RZb=H01_mm at +|Cqnc9PsG(F5HIG_C
zt)aG3uTh7n6Et<2In9F>NlT at zqLtGcXcuVrX|L#Xx)I%#9!{6gSJKPrN9dR61N3(c
z4Tcqi$B1Vr8Jidf7-t!G7_XR2rWw<V8OKyGH!<s&=a~<gZ&g?-wkmuTk;)2{N|h#+
z8!9hUsj8-`-l_{#^Hs}KkEvc$eXd4TGgITK3DlOWRjQp(>r)$3XQ?}=hpK0&Z&W{|
zep&sA23f;Q!%st`QJ}G3<GjWo3u76xcq}1n4XcKAfi=V?vCY|hb}GA={T;iDJ*ugp
zIYTo_Ggq at x^OR;k2jiG=_?&c33Fj!Mm-Bv#-W2aC;wc-ZG)%cMWn62jmY0@Tt4OO+
zt4Hg-Hm>cbou<7-yIK2z4nfCCCtN2-XOGSWo##{8Q{ATurxr~;I`ytDs%xbip}RzP
zziy}Qn4Z2~fSycmr`~zJ=lUFdFa1>gZThG6M+{g7vkW8#+YHVaJjFF}Z#*3@$J_By
zLtVo_L#1JrVVB{Ak-5=4qt!- at Mh}c>#$4kh<88)m#-k<%CLtzEP3leVno>=<rYWX7
zOgl`+&CJcB&DNPUn>{htGUuD;o7bD)w_sX$S}eAxwzy?UvgBH(S?;#HZiQMoS*2K2
zT3xe7t(~nU*1N5{rxB;QPLocnp4Ml>u<^FZwyC!nu;thW+pe~4wtZn|Vi#w(#jeBd
zlf9FDx_yoPJqHbk*$%56S{;6Kv~m<WRyy9A&YbQ)eZ};a=`Uwk&k)bpGvl@s%PGWZ
zol~3BM`ssjxpRZ_h>M9!g3B(KJ}#RZ#@)!h<Vtk)ab4kh()FF2vzx;0sN1jZHtuQe
zhuojcG at mJ+Su=Cc!^lJ6QRUG;3!jxRYu~JXPeV_EXSL@eFJmu}SFP8ux21Qg_hIiB
zKK4FxpW{B`JU8Al-dSJFH^8^Zx64n%Z=PR;-$Q>R|78Dq|Iq-afF%KE1Brn_fm;Im
z_<DRHzm7jT+hz8$+3i7$pt(U6L63s1g5|-jA!x|#kgXy2=a|ls&S?&XP=4sv&<A1W
zVT;3l3 at 3$$g;$0 at j&O)r8qqPAHFwe6Lv!Cm`b3sQ-kWDJPdTqGN;N7zsxE3g+Bdp1
zx<AG)W?9VDSe;l&Y)c$DE-J1zZfw5a{O$9H;+^6P<9ipFFUVbRd7;k2^o6GusV)*M
zI+j38h)y_^@IeqNs1}SR@)LI@jtY6g9l~cKFVQy9h}c71DjrVqNGeTwlI)SZHF+e(
zGo>u$xr8UFki1L{Ox>G0o)(&RAZ;=|I=wN2l97;cLaHH6leTB-XXa*h%dBOEvi`+x
zi?=Txl?TadvyiL>SuF~-LZ;|cS}4~l2eM~nS7yJ>iOM;atDY;(?aZ^v+mJV$@1Ote
z62cPUlD4IWOIIx&SmwQ~YB{nzae3Pc;}r!fhE at iwJh+OsDs9zItL;~pu715HdQEGA
zUct(O!L<Qv>kCy1<%NCg+}G`0PgpNm-?d at -hMgNe6^V+j6x$b<6@S<$+<4_1hi}Ti
zncS4LsjI}fWY1>OX6feMEuLErma3QLmkw?X+1j)X-&VBk_4Y;EFPF_I+q;9dL%E~B
zJh;4Nr^(LEJ3myURP<E(R5tF?-L+xY_- at he8+*L=H0;&eTfF!EKFPk@RRL8^)n?UY
z`$_w=_dl+Qs_FQa`)ysVPHl1R#{<#>{Rblsw%57T)g973R8o)DE9*xN#~;4_o$q%o
z4K at u`jhx2fBXC4{<mvYb-}fF3I@)%Od#vFH(;s#nXB{tULYnfLMw?Tb`&(jLx=+kL
z(bnqTdi+P*9}k=~JXv{4^Hj-c+UbJRlV|eJjGdL8eSR+a++f?HwtMGe&fjVeZ|}Mg
zbm7uP|BL54ygSZZ^0;*JvfJeoSGZT2uR33C>U8Qn{*%*B$Ge=nny$HAYq{=vy|sI0
z_vss+H_qMky?OB#|JK!>IX&II^LlUh#rO5!7TtbwC;iULyV-Xq?ybB}ykGP{?LpZ?
z-G|jbTmIbG at 7#ZCz;~eY(cDM(28Dyq{*m>M4?_iynUBkc4TkHUI6gT!;y-fz>HMcd
z&t%Ugo)`Y2{>!cx7B7DI)$7;J(U{Spm-3gBzioV_{p!H$8L!*M!p0uH$#^p{Ui4P`
z?ZJ24cOCDe-w#jZd?0@)|7iKK^;6KN`;!@ylm7$*nDhK&GcDTy000JJOGiWi{{a60
z|De66lK=n!32;bRa{vGf6951U69E94oEQKA00(qQO+^RZ2^0(>5%QDj at Bjb_&PhZ;
zRCwC$T}w|J$rk=j8<-I3`VTm3B=1Lfom|fnp|lYRV3e$xc#m?|7qNGSH3%>XqB|O~
zjA!oJ{sX?c>+~ORq>vcsa~IVO?dqo=m^hqIvIKU!y82Xobslw2nV1;@fnYK)L<9nX
z5KbTv!U+TdA)G)UgcAq^LO6jy2qzE-;RFJK5KbVNX3S){s7lp5<H7{6$lyhQ^5Ltv
z#h?y at KfY(XBcc@u!l0zou2otp<S<twz#Onyhv3$a*|tT*0zn4Cty852pf+0b+`7W$
z_9>q`B5Hvkf^b!;=3RXK1E5j at k-7jpv(b10a3SehhVlCepS48X0wG+0aEfdfhX9Jv
zW+ES4qW39EW4)l2vH>o~nV$sS786q-gbNUEoy^0qX5%gaJ6XxHN=t<q%<e|D;{ux!
zP!R~>;(fM`f%(lNKI#tIaCCd*7<jZiOnU;sPeVARmFE64F0%R9Ak$>fuJ(4l!B%~p
zD*v0r12))NkYN`5C@=sZhq;<={*6jD061pbW<WPZYpb+WV9=(BU+~}vw@OO|J<vhG
z&bZ9J9OietsOAl3FlVZ$CCPSy;9(JN7IVMpe%3gniAQ|YCD1$V9wq=V_>&BQ;2~j#
z!T$s(pxyXj?2aPlZN|mhfXP|_fD^WM0PKwOUc>r^FUc%Q1a*4g#RqQoe;L%ChP_?`
z+Me4bdSll*KYCR1C7DG7IFxBTJz(HDR1~}hphn=usW2(^MC6B-hILD}sDx~RVEh^`
zxNfwBYy!c=2>0L~UdSexD71RGq=e<45z%B@qm|OFui$pyv)$Ps({w?Lbd#t}?JM-`
zpb73J5SZxmC#da$n^^)fO5;-5|2~1f0BFbMuO`9EZCxaA(F-a#2Dm+J1o|bJMS^i7
zuM<9NsrTr4;2s?p)c(L{&9wGZjpf&JP^Jv(0Q6T<@I#f1{qlsgv16dHMk}R311B;4
za17wTgn2tl{9%=r3a5PTWSJwh2D2}!cZJ^5yYS=m=;2*ufDCe<xNEidJ8B;>b}{lZ
zXA;Yq7}(EY{$11n#^;~*--khM0v{$l-wRqP=YW63S8$Ny!rd}Je`a|0!2A7qwhZhO
z at H(ci9T&VEx5y}2 at vC_2LX~yt*-s6&7ShYcxYb~LGs`?k???Q&1>5&zQ9 at +We}5Z>
z?zhci_JL`+R1{N)P*amJxpt6%*Q)F(tT|>d`)3C0qDJ7iNf)e9Wj6=jODUHsj3XkO
zKsEp<8o=QyEfu2rsAQF7%2P?n<Ze)<YW{Z2l3fZlZWo7Ds^(K<QB3-raj^>k27&(4
z*!WyHHt_T-WxZ~LOfxv}28_J{{K#U0wjQ7|e-eHx<@J=oHLAS*5&D>3?-`c6SGG1Z
z7$|R$X&T{uH!1~v7{SddwbNj0p~2PyC2ZC+U>lhKwZYcHHE2suYXhk4|8<RvHxb&X
za}C<^@8yD*)1t?oCJE)k0;v0axkB%0L|*HtGHG6+_q4&*f|ncH(LOhQ&ETaFzE0|+
zf%#tn)Wb3h%9q;e8a*wLTL9_=d`#-ITJUtTkrR};8aL?XaM3eo6X%HkEYWj>%7*gS
z`UjMN-6Rz{pifnscCs;GAG5XZ|L^@>kD7odY;F7Y{s%s5>VjvW>}xjy>#Kdo!2D(~
z=<uHHPJ`{uB(g*$pS!?jgRQ#Xms37>PT1Ne at b;Lb(mG~q%lG$B_^idC&?LLYw_?^l
z9`RAP!B*V`HseTl!e^}pTXn$wtVzG!U at P?;9flE6g7#=RDDw||)-*7`873XSN+R1a
zTl at aAM9mQf%7)j8ce<VL+nl4oGoPlOa4skmb-O~(j=1h1JP?l~BX*bg7CQax3cank
zsF+Fuk52X`a9JPxxPXP4kfZOnMro3$2%+IcFe$864&wT#-lwsr7%I!H-=c_<`4Jy=
zuh84l&D<BXQjV6#yq#r^7`Lkv_QN)3Wp7wb7gGy2l`w!W`g>U;x$y+zqOKj2+C1W;
zZd9_j8lQgR#*zG1>lg>4FG5D9=V#y_{vw_>83*}%xJ9Br{VPr8r+n at Z&`cV)q;ZaF
z+X$?n?{pQ)K-tB`;UGR;m8$tQs=WPK$TkQ at NuK4f&k&_mzQmbqSxA0+ukZJsq at A{4
zO(MlGi_EiJGvMNVJ4niI4Vf)P0w1oEc^Ico0Ttd}qsm(sU;j=C84D6M!C<(?_s@fV
zCx>62{OIx+R}A4UWIhUJ^p&wn)#d1uyQq`{m)5C*2p^zm+?X{a?8)W>ec`_U={Ka7
zD)FK&-%~z!)R^@9DoNVb02lB3m)+C)c!_U|x$&En4)>L!Wsy0`X;#Ki8cx at Ax=*K*
zPkY6zM&zilwjivT^hJvcNfv}M>!bIMbU%aOzDd#?41RMDI=q#&kDjkI_F&s3E<-Zk
zph~PY=8Z=&dE7=MoKLzFwszFs$}l%j`zsATdn!ep(eNU1PX8oxccVzBau(e`66D>~
z7sNHHgtm5W&mEn7!ge^S8Q(`Q8>M&`exts<!r(W-WQ5=XmxH^jFB+rH=a~#afIyOJ
ze7=}EzmnPjH|4<BtXdBL&H;OYNtn-p_tvS>fv2 at dnd{}Gc8=M$*U5Yy)PMw-F20u6
zsA7BOYe8)v+)s6c>f=f+7_AKSu}OgA_mS?fkJsqcXD}O(1LYamU8l+`+*k^{sJ1ak
z^ZE4cvoRB{e>J|1*65kzIXvpfS(Ag~1D`cLLg*`O(O=lI`dS7a|L)@J-~EK5ydS`#
zAHctkN}BfiXiln+r+n_bpp|Wva~du4s6G&QyTR7T`<Fx2!@Xy_bHZmW|0QG_9w%&V
zXG^(KCt$~Ysy1pbmys>ht>14VX8(J(JD!`;&CtjFyIkn9_Cv{ie8=?54>D%)Na1$x
zo^)~kGC2V11|C04bJ$P$+-b12?4 at sYqS{iQ(MQd{a?)i$ond4`U`KaT3_O0ONFSc?
z1T-16sScQme_queZuu|$KIt-7{Xk at 1rXm^x_7yId$LS&^{yy9|F{zW5bxhmI%T=o8
z{mpE at _%-c2dSZhAy<l6{`2P8n&z-0rY`M=LS_!%*_j&4;U)UOy)tv;7gmBZ3HLC3D
zeqdDLq*sx?*B|)eu7StT#4VT%W<&(jk8tGerr_1wph{b%C-LG8=1O4`j@}8`CI|81
zegd5GxpNI8qU?t9UO7-LYSUaVI}+SICT3C!CSh8xlnB^OK4RepbyZg;5W)$DhJOl`
zIw~Vv+05Wi*XSL{@2(5s1OoBl1OkB&P9PA%2?PQmoIoIi69|NG0)apXClCnX1OkB&
iP9PA%2?PQF!2bc|iyc$_k+i7*0000<MNUMnLSTZxE*+Kt

literal 0
HcmV?d00001

diff --git a/docs/images/mind-logo.png b/docs/images/mind-logo.png
new file mode 100644
index 0000000000000000000000000000000000000000..ecc3fa09e6a1d888b87ea573faeb2dc8bc0becae
GIT binary patch
literal 10214
zcmX9^2RIzx*Ve7odx>6R^)ABdo#;f3E(lSg3u3iIi?;YhLbTO8(OXvUEK#EO7OWO+
z at ooO!GtbQ2xpVK#nRD))^S<YvSbbe}Vju$$0|SFtQ$xiN0|OHmU5)_Yp^tjT%c|%T
zp1roZ3dZBVEw`gM4P8UvrD5)afk8?7Z^xXu=jcUO;`?gqsN$~>P?9qUv%b)sz`$U|
z&{R=04*Y$T9TaHttL0Jt<oB*)l<>r-QH_Z3;RMQAX)jzjnTjQw3(UBDW9D?l at ZjE$
zs-|hSvB4xcP61%2U-Co1f*RA{3%8;IrV|N)rpEZf-Tl3{t`Y@>6gTDz+t8d{F#Y)N
z_hYM<RRPsM8cTR-;<pj(eh_|tB1$p!J=!U2H}_L>{!C6!DZv(#7X1pCZLOKsX1%Iy
z?F?AWS)+&D1vaTg)DH^l_D)A}xwhwhdoRu+X at mEC_+dh~#`6egtSKX+&#;GFMUB5O
zvDH`KC3=#<g}4EW0uI3nM47$%9G8@$aPPjoK<ye_m;Zhxiz_iT*K&!cajZq1^!I*b
zpCO^fShAzUl8dddmQ_^dTO?FoNO$_kNg7FYx;z_Ab1LHNy_Pmg-rDrr-bwYReW`T7
zSPCA4dg>~dCR1v{$F8~>Ud~U5Cv<e{N2GDc9K7o`fQS^)1*_beH|O|(OwPbB;Ftrn
z<$StfuiaeuB^7_hAYF^T1x{XCpfAlH=cH!dc+fY!KrBnJogc=_4(m5FEEzmW&nHpP
zk>PDi^Qtt7z at J4D|N7OPqu8nugQrs##HOGI3Rop%eAfg+L3KWt`Rgyc at 2w$WbaIwo
zig0a$=*<jjtUfQvSyF6nxKvIKJ2zvw9Pw1Dx={Cl<t^S(|K(|C(SP{CuR}VgVb_pv
z+hR=LZe<_J?dlpe`xF(ZmuJ$v`All{l!sB&%P=pLM;^`)eN)T)ez$l(*1}G}+ at NOW
zHC_i-=e2|Qm7<%vD{kJDO)j;TgMy%vD9|M6M+wQ7k&{A~K)ic0i{_Zfc=f&aKRkeF
z^%<7Gc)*dC(o#3ww<TgSaphPGiPrtZVI5vflQe}LX_LZf10Iq~dM(x7=GDwxnYita
z?!!UfYRvGJU3zT_Q&}DI88qgmJF%_}@v9opjZXANI!&s-np4am+ScdfBdG+L@u&ay
z=tnY*;BHXg&yD%4wqK%Oy>m&UOVA#<&SKuPp#N2-lNxu#RJWRb!*d~gR^bVU6^|E8
z=?Q_rer4@@FRC~kIgFKYxuG)Z{on(`YCb+-#`*BtHpQX*5Vb|;IibLmMV*Pwpt3pl
zu#8;bhcIF@8C$fNZgeSJIs^!vXsRd=(AyR%=ErkQxf%moY?8xz$r>Z>@_?4vQfgdn
zD(sTMPtgrN=~M=-(W<$c0;3u^@Yg1@1@2~b(RzZ;<Td%WvHwlcQ>2|tEqL!eWy93S
zIB%P|vXAX1H<2u at 8``aLT?hEvl<6w{lk9|akb40jJ5$isZ8Fmt8ECvN1{v#C6Y4JN
zGXa}+$3<+{Q9<U@eEag81!y3wa1zK^pu4n5?~c>zB%@^;dSDrR3a1OkkTrHI27uft
zd+ at Agsb}pD>tudR&Q_rnW!}u8%+OC~L6;ZZ+ at Rn>zCt=#+87%i!3Xz;5dUO7jL>v%
zWdEmt&zSTSt23}#sfO-JMC1;ZKmx)r?>U*}drMAcBmwhbLJ!`6)AV+uE?OuUQ4g(V
zsNX)8xFHMziQyF|b17lCH7}P5jqb;gk+sY2#(S2LsC^QL+OmtMj at CBB;Zz`{ZsoX8
zaP=W at HYF#?4JnIxwNW=sYPn<jPW06Dw@5Jft46X%V3EuuHpk=CSkgon<L|=Ilb${g
z_X2g9>x^YYgSquU=Y7kph*hcKo6&Yh(P5r7qiDUvGaiz*&);nWbe3gUO&{toHN9n#
z?Z+j)>e(cpvZmd{{C;gC)G9$%6>4*rSBb)^N%{A8ie1gh-H2z)7=BG*vnOALrrPN%
z-BLO}7)ITL7J%I0?%3R3gCx8Q2k+K?7%-OX6Gk~sj!Ka*hf<{<bM{+74ztJetUBNR
zii7vLge({RRU36QKFqj*`=Gw<&D#AUoY;}L{%y4A*_t9K!N0Fa{g<5K=qeC?%$}s@
zcCZj(;M2g$ywxS>j9HV9Gy%XRCVma1KdKEAD1FH at rAT@_pL?4W at VGLBciENi)En`!
zj<6?q&WXE5ritKtb at L6JiOZul-z&(lgp_?oK0twc|ENo@M)Go~%R2P*HRhk*8te2+
z+#C1cO}Vjp>euL|>vt;><oIJpf!ny$n0A@Ghq67laImBWd5xJt^E^#ZH9djC$R{DB
zeb(02JN8nK%T<|NF9bkl#^EbNV}GD~j(pjU>}@@|@e%+-u>^G=vF+F!e`>n!XwMd2
zr)~GO+uvcn(+lVB=&vo>;8~L1W- at H7L(~4)*&MCiL(43*>eGOV at B%fnlb^30=EK at C
zzgv9F?Tb^Y{GyDMWXJ<GSag!|QboH{&pvVLpqq92JQ><(EAW!)4WDIIV0zW}RbO4V
zpF^u+oS`O3NSl^!JcwU(j2~=O&b`*mpybF1pyR`J)ABw1;h9Sl5W6pDDO>dQnf1WB
z{6>wao77^3e7C*ox*<)BKw4)qj}fz-b#@->J^W=P>#^>E=aTnf^MYslb4B at jE~ip*
zG3z#M#JdH_hvN?}3N^L{j*y#rkFX8TOyw53MR9(bcxv4EK6|t`sa5G$4G<qT>8grP
z+4)qB8FL#*XEhXUE0`QFv|i&8T=ILw8 at 8;s`Kfv_A$JaAQ at oojNkb4~D|r1*Lknd!
zrwf>Wios4#@`^;VhowS2`IfHo<HwIKBx*i@)&=*+71}b1D>^#Yt7$3wC(n8b#4#B1
zQ*k`VbJ9pv)m^51tE)8Ro!n$1>Js{=Ks?jxk#iMrA=&y at O>z%Oan*M^KHyb>Tx<nH
zvdSeTgHtkpNLWHvlEw?OC$78cTcxHE`=l4jEeun`s(R0(?I{0CLgKE at T<S5Ey;LlE
z(S@m3UHv-L@nDwQUxlsamDjgLUSj>;u8TD8CgZ at jcdL>dg7YjA9pqJ*I$$?PElIeA
zid=4$C#))%bGMvYGzwb!%DaU*<;mK&fq5R}^FfQKtA*71jPkFu^`H9>EPy#H5gKz^
zTQL3B7xx-X@<D}LHuqtfy|HU%NMiYA#Y-zuCjgV`3c;ybT4sPoYViac+v$(tUd2}3
z4ibm{hztIfu5b0JoBF|!x%hB;p`mG;fy>vKx*wpvD$NC10{5?2?G3t5x+qN5vtj-+
zSV`%z8^bn|xw at l)8!d#?__1F4fVYpG)W0mBlMiNY?Gqxg&ixjz-U*e_6~2g7JY3c>
z)#*#?H(*R=XIr0?1aUO;?vwqD_+Z(#2EV1U_uhg`7yNAq+rrsp&GMfmzgud2VKk|^
zwL6wxHE}6)Zj$7 at sCm{vOZFw^&BU9+WzwuT2kVroY0p;QKMKLazb5=--<pG;#r4j&
zfO;l*-P@%@S8*n5=^nxRqL<_G+<=K?EWby*l_rHJrqgO3z=T=~FFRGtWSPQ&`lG_b
znMLw266fb{L2nvF_9m2#=#tBeuGsfb%o@*=ynETCRa<pg0)}S1CYdOCt4k?GRycCK
zcWc`zytnXE!ACNpPQ$o97TTGmiCj*%C;FbET4IZD-O at oNY_?&LLDF&witM*<@@{K<
zvmf|BKQPD+fSb!UbNB8Meh0Fd8q}+xq3Q2G2ct(P=yqnm@V|S|lYuf%H1?#>>K}Qu
zxm8l(Vpw?PO~9#-LKRhtUogIo at O{vku(0XL$Ghk!WJy{YHJKjBnX~kN(9y%%396Y@
zd`laxjU#dWZAjGR^*4d|Pnwy~{m}6Vs9i8i$ap=Hn#s`(?V$*Wp9i}CClKRO6cAz)
zJccwqlw1y5#AA`?+Mq1w-%X3}2z13CBmv)Jap;8e=~n^XM@%>$E at 7>BsF1L3thr(v
zw{raM1R8x6NfqVNex at fV?FP~#<*0+Djw498I%EEBag;O>Y!ilz6M&zQOI(uasKM^d
z=b*;!b`nqJA0^i=d0|C!MDjUzMEXo0rWBJyKkZ;VXBEj!R4^1wW*LrCy2y|^6yD)l
z2D`qBCSEVw#j{^JiD;;J$<OS$5wLsEUmRdUr#H9z+rFIugk4Zaqj5mk?lU{sBzMYy
zw1_@^s`rTP@@@=)wW4eepZz9Lmev7`v^uv61-6UO(JLAY{kZJ^R8yhF$9jIwjPv^?
zoBT)ewAhimRzE~e+%hvgiD~F8CC63FY>Am*C#VER(Ppwz&oM`0zESf;vzp#*a3qu>
zMW&n;|Ay|S#p6ASktqPdyrz!u`yB~bO~_BV0%w9|*q=ON9LSbi=Ae+@`fg7P-Pe*3
zn at xOx<}NG-6*|o)sl}I3+;X3Jo${zlT@7aMd6LaF#<7-t{oQmW#&G3u<e+HV>37;3
zU6RZelcm3-Wj%J-rHD!eTFS5~oU2Wc2kV&oCc at J{`kim41pI!hhr&%K%_nQh$<zq#
zirh+=uH2=G5?!!)ocCuuS2k`33APmh6L%Cp*|+99Zi=P(9&Y-KKkwlCu)i}f7alUF
z)!j#li+l5-b-Pr@;8g?rJyi}$bU5as{WuUcU9w>Sr90mRspNGGQW+iM=9wSs6&!)N
zRBOBuFQd2&X0($^-qbF7E at C`W at zx~C0T({uep}g^&FJ<_<CVC9exs_yyG)T&mQ{dC
zr?#lb>4{04^S#5OqQCmA{jW*6Dv!!4*Df(j(-&1MBFKJ6wJE&Rf?(i!uyTP`yhG8!
z-+`+|K`ToYMPyk}q%5s-aAk_6D8WPFNJs5n(SRJs2C*eWPi;gDxk(R{2e0R?0bsn#
zZ?mw;{i^b<T=bjuSKm0sWc}3{|3YVfjN$4p(6l56r=%||6;c@=stWELGg^{oeg%E9
zDr~W)I(eBu-In~+_<0IpDR+vw>BePZ{#*Ac0lg3QhwF9qRDv(>in=8sE+eCfsCI(H
z$yURCik8Ve`L|qXuO3dkG=F|nAX)VZb$Pkbr$SffLzQ2%@G=68cy-{rTi;Dzc|5q=
zUmF)|DA7)xZRuJPprNNktU^kF^~v14E4k|4{jac!H?{e;rTgs4J%iYXnwGZcCYjQo
zX>Wq4*;^XBD?ny~p(dYVrApp(3J9UWuQv0uvkp3Tg2wiLxBT+IQp^`Dpo<kCD7;5d
zq6y7xE>wT22m<pf%ili~^r3NQ5#<w>v5TL29v=9XF8>}c-0H6+r?GX%)4Ts#dkhVi
zQ%&)N&U^$C0*VEM|GlG=I?F}!xnDcy%F;gq_?&O*DCFX%Qy{YF+PxM{g{;bYxsO at 1
ze4bA^cD~4RAsk0PgF+SUn%DLbC4v+>X;ssR^2?$_N^bXcOEhybv-e|*c#<tFoKrPj
zq;VxL{z+1L|J0p5wpP9Y*AxAhGOCP5J5i;rN?xmA%AZE(Tu#3!5kbLsKISBdb<<1E
zo0dC}sE^{^?^Jop!;0D&M#ccioR*Z5Rmn;bP!DonxGF1ygQt$bmo#T5d~2gLUe6-e
zO2_?$9`c36QzrB`XT-Y*{K<gsi|L0p4?iPM)n~#WQh>{@lIwOI%rcL-7L#WD?#mbu
zBb)slfhHrhQT^Vk1P4N7B#VguT}Ij6rKtlBRE+%>{#WshCWh{cTqgbBO?3HEZ+lAo
z>aGM8Tk;aD)~jip^8 at ye$1O(L^=;*Pgoco4KD<}h!Gye75e+{J=ncjAu+-KVHNp8?
zJyk{@I6<$KANbWrHL#V`@s*05yu1EoW?J(xL9Yr;Qu8mm()MNY{c0Co=-3^dlH>l>
z(zy>solqmj+$&nUJ%?Q##+S0G*zK&#k4WC*($2sO#fE3eREqC?6&pAA-+X#iX2~K4
zWL>r{iBvNS+xt19N~Q8kuIa}NqF=@-&dyp1f5tUJpGAaNU+4lTokV#($i`}8_{`gA
zPnh=qQCldGCLTSI`s|-4&6ISIM!wdvx|b$WaY>OdeDu%TpwD1q>dPY)Jfwl`XAHv=
z2UD3DwzAl-?+#sWo%}Z1LmN5!`$W3Q83Y(%J_TAQ6s3Hacz~H9hSD!Ks>@3f>I~QR
z`<_&faD&!)e<n8`E2 at JTm;f@=z@sJkR0<w=s$u%^wKL&v3mD>6eFAR(QliWLDgoJm
zKd1h_lFIuBNH725vFxD#blMcE3G5L3_}P1o(N#F4s^JIPI%ae^JRG4SqiiuxDnKeS
z5$S()66LHo=U(nUNN`ydUbWKgcg$bimYw-BZ at BQTSykoJU2+Vexu}r~oih{y98-}h
z8E)g&J!?X9V<4*^1k9;K3cUebVU8J)l&?#0FrHhfVOK)j$#<L*XH+qiMYnmspM9XP
zK(w0VwZSzxDoj7hzlOc>-)|^<Jxm5^)33s)GnrqbKF#F1+DkFq_rvmHiTP at fh1EvR
zkSBgY)MW-%GQ}VoOul{%Zz2ya;N%Ix@+JFp1^q}<yssP1MvoZgexb4#M^Rog2cjpO
zzBm$f9Z7bK^2B5c4}tV_n*e2K5)mgkl?m#OnxvO>NeE0f_4G}wYzVP=!A0rtnGih2
zR_d`wtdJDWp)j652F_3W#W(Kkvwp>U9S_b4lhx^BJj>#|);-0T#CM58Mi-;rKZ@*B
zXXip{SawJ_z?c=|46sL|Z!vjaQa2*;ja^xeUEf<>pQom at wp_ngzk$H*IR5B2Q}-EN
z_lk at TGUmPS@mn1#Myc4wDgnKil*pWnCY>M?c2Y{D-HJDZ)u>gJxPUpMgm0<1q-uy|
zZX0iGw_Frgyn3A#fyCJi?wMtjRYAzwPXKuq=0~a>L59*1xLyAf4U<o%Qas7U$xSX$
zYf1b*H76dTVC@i9xOhP!W}?dcXN0k>?|myut>_cM55j}I2JFsiEet6fampn8nQd2A
zylbUg@?m8TTCEerDQL!E{Y|<)or%X3>j%0<m4gh?Q)bF-a%f|>ZnTtvhc^nf|Cz|u
zj8Tvk9O)&br5(j#2YF*A-T8BbtMSWvK({UQDF7c=nxHq+``SrE{X0 at US4b-b9tIib
zMFsX^(HoW3|5g2ucTxw3MM==hL`AnR`dvXQih=8S;qR at FxOo+^Z3<7*$K{pUd7Gp}
zP~N^V;-emL^(eJA-JVth!%m&GLtrKK-;SIjo6qCPfi`Si_%R?(wm<qX7{uFD+;P}^
z><`iYCTQAtzsL)Vjg)J_peWG_G>3H^ZI=5*;hA2GPC8?5r-J9i<_)<yf~xxzi9JTe
zj1$cMhu!!gG?b(ZvkLof*#<ryPSk+*@E;S`9X`hx(6d;3oWH;ZN+-iNPbu{*@x;kt
zN$?)_t<rZmuoh5Si~#gWk1YEtB@jbJ3YQVT?&u<qf`QQvs^A>mfuBBQ&f#YmhUp5x
zH)ti&*=ZEbwlwQ>fy(_SVK_h`w`dcUM3clGItA)r3B>Of*i|r++PZ3fKc$hqhO0??
zZJe9J!_H(o2;PUB*(l`EI)==GLN8Pt)Uf#=t==)-7|LQ>G)kXqL-ej6@>3E<JVuwH
z?<W*qFb5PgC`yr0F^@Bpu1c3A;0?ErkJ9B}*sBhjiN|^JGr%Yl*YVfeSDr~LA0&<^
z(;0L=k(AF24(sP<D5V7V2#uR`VvBNGLqB5ttm&>^s`rA*mB4+rr5*Hah4uIPqRzfA
ze-fu&QP%_l988xg6eajc2uHGEXTnt7gsGTh;t9&Gu$oekh;i}8W=_qISvQrKi|Wyf
zm+N*4`a6A~E9YnS-?;g4dQF~Y5KnYca<>GaRUlsyqHQNcRxTKj+2;LO3Y;uq$Q=Z)
zj{B;jA0*{gsQYf&D at eIo(KA-)4^F6Y-e-X4EmQ<Oqu0aNWy13dNvuJYBT~ufuI3z<
zd3^=Vq-G3)1#K8KiIYKCo*$>{z-~~vRu||)cbpOzhzRi5TK~nX2Z{U6QVERRL!FQ!
zrq+|qMa||;WIE{FxAP6i64T{jENGyLj^bk2p3=$Y!n=A-1MrbI at O?6WdY0uFq2$E_
zmUS9pb54yw<G)`hYR%gM3&Sc(s+!Fsv9>eY|B|krRKhqeDZ|rUEplO!s|katMIa{3
zOYrAH!L`F4+QGLu>JHJAps=|-WwwUMNuxw1r{j&hEW))&pB(O$!Gd}aF?l;2YiC?<
zI&D2-LXf+$_}s=<`q3_)h<NugYUB`5Om&N%3^6^T+YC@itnY#?mh!+k^+&HSN1w+w
zi`EIZBqJ^q=P9e2fCAszL|u3$vAW~8f84kp{1Y+|CAKv5dj%ab);?f4i!aX9p1!Ex
zz*NlB{?g7fKua=LfN?<j<BQ=O^7pd4K8V8WAWZQdJ>6eMA7X%$?lITh{(VDO(&uj4
z at ZMmjO@OpJabM*@Ydh`u2cJWGV)7&DXvuXf6hofgyokYBC~TbmqnO at +SWLLuyOO2>
z5}X%iV5;95dzp at aFAM9w>6#yl8<Hm{k|vJ5fD#@l!#yp`Z{a{*_K@PG%i>Kxmsot@
zT?Wk6xETM2(IV!<z3;*^-c?4YD9JMFtu8Cs3XSQs(l2K*-8H#hU#Il(uZRfa?v>fO
zvh6gkjh3EISQPh9V&O(P#DC0L;fGE~$zCRH<o$;uufrSgx|SXjQk0&do-78ojynMK
zny~IEzrd`VoLqZKQOC*W8b<vgkLzpWpCFhCFJN6tE22C8U^DW}h89OEjE$l+nLlr8
z$F^CKdY~SQ<$Pk2j53RoVkOd(^AAor*d_=>V4eK8`xYnz>G6)p)sH%pJ^kKdIYWR9
z>dsR?9TeM=&@>CqRBI<65Zn4PnKLn4AjbJREQ`j3PH-zwCHg}=WfmTkr+WHE{oYZN
zTv?XxsS@_uU~Eh~uCTmLydkYdjslb3P338QC92~L%lKN&<x(mRLo3owyU?Rn73%w6
zqee;EYZ*pY4f97G%@o3HrPltbgN8($%s=5#X`HBeDd)zYk(eaLV}u`q<m!_AZ);@T
zfq#dpCRQqpm($bB+JIP$6I#DseGu9vt||gR3(Mz-PC2-yGZNQz+c}m_gK2lXo28f@
zFz`w6q-p|7m;qlG-ow}NNnY_LYU?<?Xc=C`W{t7bk`aR$OMM8Rzy;#iCnOs(I=?JC
zrr?s{GYJ^en`Y<Ps;@EF5-V;lxUMx7j=<X?)a%jTh$Cvs2zK0o9_lal><gwnMsA;x
zl0Aev&6m2V3|V;B<7t~S$-w2`3t3DYp9KYr>F7b at Wk^^_{$jU;O9|d<g?><O9=)mt
z<vc_kl=bGeqS08HaE<S)m+3dI!TcdP1sHS2#zK5OMpK|c5=-r)3YZrOqg_TZ5!K$y
zM-Y7};TATIO?%$lVD#CG9l-q>7*@WGd~p-seay%3j(U=at$2^>1NJovRNdq;sGsZS
z&hKL+w#~7|sg(43SkzWByuT)#9j`##7Z~IeSmaIt`1J1W^UX8Q<_o2L`?&v}*+W7q
z^qc0N>4VEiCZL)6%!Ywpfki}W3!F-P(Jv!2N9LUZ-mGuDzgR=!o{_HkV^bQ5(PziG
zi!;=*j;rkemcM54cz*2IOEVO^dCgmA4*I&Xfzob4Jrlc73G9%1<YGdw8NI^8x`9Yp
z3q2FKjTZqYiQ1Y0&kbqO at iiQXwX&#_VQmubM=LNA+E^e~IF1sReQpnFuRzwcg0r)D
zY)CCrvU}inneP at 3p{)uzw1b+Tin-%R*Ns!ue`MCj4-ip@xkDRfaNnhM4*+$-t86Bc
zYqz71tf+t|y}X;`x3Jg4LMoa>&7*-w9?Omb(PB at IXfb;n0G8o_kguvO*3ihD_yFeV
zOI@>4PoNCjTyPk(V2<-YxMfSOSB8{~h(oADEy;TMwkIt`Rgwak_4q;<{-)ZXm$%4=
z|2UXQSv8d*DV3%vzbko0)A0o0n9XXuDuf%a0krtm{Pp(Z>VC;+#u`-$r|gnvU_^t6
zaXs|sX*K&Dz(u7sV6cvB!aG^`F07{l{YJX&Qn51 at -g+_S?*fcfU&$IB%wC2`*GuUH
zlnqb<WN=e)I-hFELuJ<oqWa{b#&{ViHGsED<3mX1Py2uYm3?}eDD3<f)?lSonfmG}
ztUc-+Yj+YrTK;95aW7mv)DrsLbx$O~Xw9EI7|W7!Y5J0aXGCpJ4!QsuP-)T4OPesR
z3?-#F{o%&#y}Ox~$}U2yOjQ<=1J7;h&4el!%qx91mAp#KK*Mt%MBaWKd8-gAKzXef
z)iAuA5;2J6&%!}{123XN6=Hh16;UlkQs@P?LTQmfluv?Sq-de;veZTf$$E*QHye;W
z;PvG7q<39BEvBlKh*9s-mlp*QPZ@>Y9-B%$qHP%b6AX<1j$!=Y6?z?vRR6<cCSy6M
zBXWhpCOfUym}+9plym6PYqeSLT<h_}mQu^?`L)w&er29E%-iEt-9$$5fiSD`#-Vby
zwAUZ^qo<;@S%b-@t_{BU197w;RJFe!Bjjc|{(I70>9O*SE>&)+#L^AT<M~tct*Hc?
zP*?kcN0iUb7J!wVfWJq)*`}Vqm}sTP{FR}7_NA=_Q}(eLxk>lB<U+v~9qLJ$z=^BW
zRXUh;;rg>6{)b%Qb}6!hzq%P77-2o7>0f<|(IJUSj`kYYDuGxsZ!J$!UA*T5zX>8W
zqdF7U<*DS$1pf*sWFw2v5eAwOm_p}Se__%^fHPrzNKG%Z^yqKhu)nB3J(C5Kov&c$
z_?EuvXz5qH`D_H<{Er)20Dok6S@W4nhlQCvJRTqquG4S-{^>-FM=wHFx}A9|${nuN
ze`^T@)>dD5MOi|qOd9zro^)BP2DVgRTmg<q1R{k^WOZYa4r}qf5-88C80KGNe>h~x
zp8_iwn=EW{rnD(G7(M1DTY)Ta>50wCyScsM`r9F+GGE^i6z5*9;h-4%AEqWPZT}CQ
zGd5M!Ndy2-ST&+W>~5GtK@{F_VY05O-(4a1t^jydrn1KjL1zaz|H}nHPMnteDmran
zY+ND`IM)R5RF$4M6l>Qh_;r#^c{v~O(U7G at DT>AJ+T`}GwHS3(f2VCq$}ABxbk$M(
z(OtVCLn-lREQh9TE?`K(;B;Vj{dJ*60{3Y0B&NWELR`04kk|I89AXI|R3`c&ouiu=
zFDIMb-YU=aI_K^1(sZs|rZg5duG;q1b}?7_$)uTWE|3Y+o~g4EDHioKpAH(^FD%W7
zdIN!w^!mg}K_DR6k-a1Y2=%zp at stN^j<6kxNJQYQ!NO82;PqJ8i8-NqS_$e(QcKjB
zAElyn`}4eE99E$3+2Cq>^_<|Dfr7Nd6kE%@A5?+>u{&+csMhxm3(`T+cw&Z}MY)2e
znwU0-Z{V?_U-Q45L#x^)LVw6v+_Kc)jwpb$uopGfzFbge-M_PO^)35^)uo(eU~hb*
zckKPJo1)i%6uK|Gbezo8vXDcoe%2<Fo~=5qs`x!#DcT4R7r$-?fCw>8s;JfC>M0Yk
z;8^*7=<=*J7j&m6dDod3%0htZM6F9~50QBTZ>MGVHmE#rkt`fSW|_sXaG}TGN~`^(
zyp>~_1 at WM|V6i(*ZrrZ^^A at 2&%AdA_B2DOF8W!}4Dsgk<ZuJ*-5U#uSi#38Yl_B2Y
z1VzK*-0;7BS6J8D@~%wS!~<0bVs!uF-oQ=`%RFxM>N)TBHYP&rl{J+H#(|A_cOHGm
z*5~UO at i}(u(~Skr1#ujU at ju+=`{fth=}TpYqn&3TV1F82b9(SLQ#icRsgOGra&_~G
z>wN^}mwTg_bqtxgfTpJs8)KQb!y%i_G-X=yJUN0(;CjzeWmS?>+1(4dzDov+VHC3B
z;ax7Og at U)8Z`jM=0bKsQB2l7U+#~T}7d&5Zvf(YONCUXmdZ-FtxZetHA~o`g6 at y7e
zZ1*GP4Xmfkti6Z^Om4gvyTrW5<(=X|=Qu0AdbP$(4{HH|Z^jiCXuQl>!~C_wUkY8N
zJ$}|^)l7dRek~@)p(?pGx4qk~5H0&QbLtPQYvg->SM at n+SS8vHZRj@8+%~Q4gQP-#
zh|hL(5ROYRX(om$v!Y26ZR=7#{4QTS at idy`7Lb&{9iqfgW3V>99m&<0N^T5b(xJuf
z4HVpY2#}Z~_NwN6#IYwk_Qx81e`?|SrPHt}C<dQwHeXyA`Ifu;TLQvugSz-ameLX`
zcMM_NL^7?>F&oVkc<yigN!)b?2}LyxUMXGQk9NL0p`T{431kU}E_RgmMm?USQ+{3L
zMPVZeP@1-yPELnBn>Z1%Buxx-mUg+3{8)7cG5B$GSl2qqUz`pGVe(qvKr96b(BKN5
z`_M2ZwfrSP<j93da1#9K=4ru#Y~fZ2{<ChroDoV;EoP=nh2Bp?9_wTWUMu=TVLet!
zR2N0Lc2rVlt(Fg&oKmcenSN{wzq_VQC1t$)RrQpf7@lT!#@LN$XrkOPjdwAeA-8kW
zVe;FP!k^9oH6Ba6OrAsq<bSc=>T!ANl(s#TU&v0s%vhEL`@@b+Kc2*_^p5_ASp6Z$
z>AJ*ludF24#QuViD`kB<twSawQh^LMJ%U~M%T<;)$Y$U{beme?tHg#nFDm%Yo6t@~
z1T}fI2XJxv<r|1M?@AQ3(^8LM)QB!hSj}!MlqF-Ca&5+;6pjTI0eo5U{+&U&^%R2w
zw9tD0+%|#$YG!^_{VU**CaSkrqi<Jfem@d7TuS~~=|F(NQ_RY6w?1`_XWc(R6I`Bh
z<w*&G+t-UFaq?Z^rS-RiN(1U7O59W`*Q{h~8GM;OC!^bEt-N6z;-*qxzK-l%OXpES
zsiZSIi=S-0`p}{RtDZ?j_qys~>T<O80{<K4?o*s{{hPOw^t?{$X5mA8;!@?`+hbA>
zTH2-St5JL*lW$3*LL8I^cGGvpoh&q31eTpGbjuJn50RqC?M}o3b?ZyXH at J*DQiA*4
z)LuI`nI0rM#)DpKHiGS}d6`J)pU;<f=2ly00+-&KqyBYYi!O`@jXvs)ABL?0OWd06
zUb47){mt(lG@a?Jgz4k<4v?$~$DEW-8mu=%eA_`y`@Bcw55?C7%-H8=H&(Wlz)i9+
z3`P^X+xcIu*dP7!8C8M?yOlwU$iSUE9VZg8eaqXN&j0FmDQU#elb7&6i>Efsgpfo1
zFkU5Eq7m`N3Ulih5$n4EF<cc}syv5<xp=#c`SjMVVPeE)Qdvl$uxZ2A&;UKS#xMy}
zo7x{%y}m4VT+kpkd@k4?UN_e4RLp<XS^S<lY=<DyWf%yd>|dX{TP4nB^~)Qil`|ML
zg>5g$DfmQRMW`~i?Hw&1r#6 at gGHwTG{ylz*y-oGKa-sCQ`upmQSE+q`46CbFr at _Q-
zJZAhfhekDKZwRfEBO<CAo=gh(&Nen*e^bdK+Iu-fSz1r7j80nVGaNB*Q|$uX2b_2y
zM#nb2Oo~Wp31vcS%=l*wYs@;emI4o~7B$P-FBeYJ!qGWcW`gvLNg2J+cH)XMtC|kF
bN0w?<qESCjB64&_9)_l>u1b}XZN&cp{OX_&

literal 0
HcmV?d00001

diff --git a/docs/images/synopsys-logo.png b/docs/images/synopsys-logo.png
new file mode 100644
index 0000000000000000000000000000000000000000..d4fbd89a106a0d4daaa935f110b2f76cd097f03d
GIT binary patch
literal 52426
zcmV)vK$X9VP)<h;3K|Lk000e1NJLTq00R&J006591^@s6_8fZF00006VoOIv0RI60
z0RN!9r;`8x010qNS#tmYE+YT{E+YYWr9XB6000McNliru-U$>91r;v&_PYQ8AOJ~3
zK~#9!?7exM9c7jO|2|LE?d~K5$O>U|0cBA^SzN$T at Qa|VGTJT34hn)JuD|an<9E6<
zj?Orv<H9n61G320tq2K=<2d3V<4QzU*#sdZke!gN``)VO{Qh{J=T_Cdx0CMNN=WoR
zuU8=5>8 at M#)OpVGIp=(is44&=A{xGExx~2ttIfVv3t~jj(SEm2i2jR{cZspDQsUh}
zcT%DqL1sqSsY<jxB-;bq02PpJKn08iq<A$eidF^Ifvg3yPDo!$h?axCDA;8J&qMkG
zFu#YL<}cvio>tY`hM%wDS;haXqNDGF-vdEVk^1*U)%{-Bqjp!e*PwQ2NTS|eP2K0B
zY<0`;VSS(4xs==c*`o9-cKx#JK2s1>5o7?g-|}a+f~+^neDUkX^V~|_#v+sJ|IG4a
ze?$K!#(%Po{aRvX%D}{k$6iq-*$JZE1ldtBGnHs6=+qcH#bUP+WE+qPiu4H5m8quY
zk5g<-FzW<aXGvEZqE*0)Lb_5gOCecQLtluQ{G4I=b9?cwXYS(sHBK(IrM_98j@`JQ
z9qaKz6tt-0#wsJ5SKizEefL5|Q2eC^5a~y)h}Tr>m%kV^+4y_P+tIu%J9|=;jq&aM
zWI1cbM27cJqFqyxogv-{WV#`lCPdSebQ_S#t>wEe<l>B>jtDX$$U4QW73?Ztg}@5I
zE{F7m2o^=8^S5E at f<N%+ld5+Ok4;~>eI6Q;sJBmT!KOBx+tKw_-ma7=qu$nLvZ5B5
zZMH7^QS>9q*UuZiZsWPA`!b{Guki29wk(`UF$ao9i}>&>hFQ0(C4Hq3?`SczD#$d&
zOjT-A6uT{$NrLHezGluR$mww<wL-KSti}ERC6HB+t`uasfkiO9qy`IOwqMZ2OMjZr
z;KHJAT;DV2KX*fWHJaXO{Z5C5kiI@_E4@>Y+gAEL=MRX83 at 9>ys!FpDoWGW+(%=Z>
z4skC6*rpE^L>o6uW}BmUbLBT&_D1MANa@*6N#9^#&qjl*r0U<80aS>jIcTurG(qbB
zJt(pI=KE*Qe{D4Ty8>cUBn5pI?8AaQ91+jkmRH{Ur1me)gfsulL72zlaAgNZL}VJL
zUn<!5`THkDG(x2PLuvsuC3^8Pu6{$W;tmwb))7E72AN`ZkW=1JCAlM}V%oW~Area!
zh^$f*Ar^uMK+mU^=zrW;P;9xNYlfV1uM1eW=4AkjJ16l<Co3{6P!*!pHIg-gSu4m2
zuq%}6azU0wOnSbHnM<DIpPvP4!Ewptxlwtwa%7qnSpGaUI#umCiTV3!HdIAJ)2t|m
zgy`d(xlh9I0ZRNjh1Y}G!;s7pjB&b0jX!MC+K&!8$TsL6Y0yV?9Y?0y>Ob%QZbh+H
zh($?MV38n?r|_^K55$bzcOK{ep`SxjKv3*>ozg~qwy|r5obg$(pGi@`YD9$FD^(|d
zFXyW7Z53n~)cXCbLOh(J!@xR$H6W`LyGlq`f-H-fv^-(u^D*6vr?TsFf8fh2$bk at f
zC#AK)cXF72FWKM6>!gk5Bo}SW=<i<)qU^|D?^C1eAn1CdC3$^JypNJjc5*1eu6kKF
z);mrnpeuRX+iYhAuUkb){XfQ%1<{gS3hUf4P_Xks9~0!knE3ZG<~IxU%K42>OKS&l
z^u21-3De~CuNmx#;isJa)wb+!iiT at wf~?tz&%f?r-KV;x1<~Vl^eel{xvyNqOSeWu
zrhWSZDX5`F(0M5-5fcZT{VmFFOWV>Q1M`r|0cb6=*G^X6E?=4SD8D~Q=-NLe**B)=
z^_I1-7UGJ#8A-vKqJD1F(JC48(<tBB`A}>sh5eCM0S7|Yupp16)E)uzU<C7KG4sCr
z`Pa3mM8O7*Eg;w&z)I$i<!wZxzbmLJ+5P8#&&L3f<gef4NH-wd*@tBZ|8;W4>y}e}
zPfC2ag*OXKa9YMW{_g+An4F<eEaJbm&R%P)m(wf&t-h<H85DnYtt&YnT}Dp3)gF)O
zxvR?R|J;{t?!HT}sx~@L?m{jA2+q+ck#h{1%#>3;sF*7Six3$_ZM)JU;P*<zlBzI#
z<YHd;i>(LwXhtZ8h9vrE-zgUw<nyDv>~Zdp)*}P)?<*xqw`bk%PwEeswo>v#LlT|e
zcj|K>+ium_hWhrYSA5OTVfOFff^2O(E6*pSPZ{E;gy^A^k%xtCez#mNUjv%dmARMm
z;G}OD@!wR6Fhi=)0lAlf$lYH7%`~$(_l?TB!&CGf3U3B8sp#xbkQt|la$pJ~mPQ5K
z3b<(0U#;Fi05~)kjA%n}5#C|_e%1))SBn0R;iaFP&x(ip^=B5;%52O)zpzh(UJCD~
zQD3#Qc9IW&p+@z>EE%C9n4Iq3vQJ16MXv)>-cyc^`!{RAt^)H+O8TUMha<Loq{@r;
zt<W3(G+M^3RnWb$8Ii`{n=P1PR<)3&hylB+^v+s~IRYjgY0$p{yFFMDFSqJs&f8z-
zJSnO{=8N*(DBGiLX5-IjOHeZlqKyHu&e@866jGZX5#J3xKc2!PKYmp2Syg;S8nRs&
z&?MO1ye|@den<J}Q7LP05)u(As#vrn>2XeRRh8-q%k=v{*<8ABlju-Erg7RQA^wu_
z at 2JfnKG<IcHBL9Eb|HH&(5s&<Al5C;Mx&e;{7e~O7Ec{mMcxx(-esx2NidNMfHP3W
z5K at QM%W<Sd{oSaiwMB+a8qPsJ&}aga-04C@NgWRF0t$7YkgXb``z+?C!s<IOh2Qt;
zkTzzATV-IzAC#^SsLSaLL3ZTC*QHE+cS^cH)Lvt-(}j4F5U*8g3oY>zLgn5`bp7ZV
zz4WP8pCzJckbUt9KWQ#U8Xa}nReEQwA^woUNimf at 1DfV^XoT^~$sOPVdLhkkF4gQG
zqns5MZH^kWMHT{bFPkh2QIC)73e&+Y^+3Wv<YH%Zm8EhEEWK)(&izd>#Z*iu7x$;=
z7*CaRw==B%lOgH~0gSeZ(D`6QQWEO|GP!7}Uj4bDA&DO8Mf<mK1f+=KW#wKo<fPv~
zym$MmtB&-VdNvLuMSr$juRW@8Q2W&85%d{y%JX2h>HuQ>PHhuv(xg3|W1+?iyJq`Z
zwU(~O1iiaL&(C&Yr=QGY_PW-Fpf!409^$h8GReAu64hCpeo&R<M2k5_kewojmU`V1
z`Atab=y|3W!oFDJG6Rup@MvbXN7oN{IKw)6;GvBfR4>=5K!gwjR#Nm?p=)jz>Cp3f
z^>5aPFqMgnPL&T{XfU6b=4_#~4*-<pz106MjX at dB+39@1MlQ2dcqjhfA|P30kb4rU
zcTHl(e?F@hztCtKizR%>*!RDPzKVzp4q|$HLx#TDF?g%Y-u5Y;?oH8?47 at dWuETj2
z=Z~p604$R;%{h$gk#VJE=3LhU;56E8cTXWbA&9XU8!{7aIs2=mBNp?ch~&DZ+<2$2
zibysTVC9{!p&^Mr-8a}Z%nzRt;z{B2waoxmuu$Jqu_^l9<%8e*B)xS6dn*9)^4Tos
z at y+1WyFd;q=Kwm8*!e0k7S$9pZ@FH5=!VOBTIec4W^u~iBk0Kyaj#O{NvKFTm*T2o
z>VZoBOe=|iNnDVT*A0yTTT?)xnJ@=kts$t$`Iq4u>Vb%wdcBzUbMfDo5OAc_<_qyn
zli2>6XZ50|8-imtJ|Jx at -EH<uMb52ECp{f%9|iUnQs<c=RuBUQrKXC>9p(tA{Zi43
zmU7)(Mkx;$r(*Iopzdah*#;+kGv&nnQhGiijGQ1;Vy~=QDBw(aXhX!denV?>zi-x)
zY8o?Q;$LSzeN{)GEMN=~TK_ylO6~U%@|7j*aT_{7zURR2lTYb1AX3aW%7B?F9~z2?
zj_`tGrOgzo*3-hSk|8C1b~)eM2hBEnE5gf-2)YxWcx{#CzYAG|_V&kZgYkw^NkuU>
zW##`}uD4v;Ds>p-eTJOAK(JeN0MQHus%d>r>c+irRt=F+($t*`=TK`7l?-P?(P4|d
zJ%$@Dq59)q9n#TjUpGaK?I=B1f*j1(d!FETrzO}A$3%PkJqRU90VlCpYFj)iD`M-{
z(-vh(<JkF8bx~txwXPd+sH{kX16FW)-3=#L at Ij3c=NOJWJb`V$^BfO-PxTk;GL+Vp
zoR-y#A|TV`?9U6;FE|}(3r@DY%=*U}Kve6FL>?hm8Qp=@d?}B%)GVZ!dbyTZXJ9q8
z at N1}EzYDwE^Z at _5RtvTInPpvHU36>t4ncQTHjsCccb0eVI?Qet7@||bP6icIccKb1
zn0q#~MbJd+fU1>z%X)%`(PGH#Js8ATtY!{gnlD-QbyVt%8%9#nKSjvb4`Tak?$B?I
zjGmd1x~ylgu*g(7^_mDy2;XYozJ#)tx<9h`QigZ$W6*9b8HmQpl3nGzorhWTC}<>Y
z23VQbELKT~sEE(|3 at p*B|8 at O+c+IwAn)JO}>G@;?@63YOrYyV31q_;%=QU><8B_Ub
zUN_5nGY;WrGOb=QO3iw?HjOTssb~7?=g?a0kA$^fS;`OYb?LbJbJ~r`M1+=tLf@3P
z0W&${@RZuW3DK*SL=7UYIwrM>JO}ceKuytZ!Msw at nK}O(2Vm*%VCBaz8NB7ezFxK2
z1Bww)$v0~in~&W8r^v~#5aNFn%n63nE9{hrIHZUg5zvq#79lDi60MO at HlU=|i>j{o
zcYJ2V-%Cs*DkY at 2NYRoyVf5Fp{%$IhKJ%Dfac at 2w(WLByt?@5%24|mc8NMW3ryK>Q
zxkx`UlURDlpSa_GMr|72Qc)0B3U+?q>7NAs2PN?ay50S8GAB;nB&BM*iT7EcS3jFS
zOqVI~Ilj~d#7viyo- at STZQTKcGzRZ2-B%f<7srMezh1^6A+Q#(`5vTD5MWd6Q-<ol
zew_1f=-0z+OUJ&%RZMaFUW>i~J(!2P|3rLV75SvlHO&RtS=KI}TJ}z0qNI|cubMl;
zt&N6~(3~9|cZN))NzU_1nud2LbwEY2D#ZR8c|+<lC<!bwq~CZ0U6*HNm>Zi4Z at s3=
zX at 4hhVYpA{ajUhYYBq9T%Fe(^G1FUDns!tJF;-hs%nTJTZ&xbjlI<A2_>VfcvKbj4
z8yP_}f=Gd2VwzmAt?<(4Qqpr`%!FXSd|9x#7d=|3ovx=}M<w(lX7a70^gpaGC>|S_
z=Q9qzgvsfZQ0^Ntpxz-gVEzQ@=az8oT-MY3gdjtMVnUELLry+X;X9$iKuFuvuc3K7
zu|k)4K7k{baLxagOBS)IgNQ6MHbc(*DDX9*rVfy3H-HG`pbptqjIB^RaG_rRXe$7(
z)ft#2XB;rhx-Z964pFQPdPRtg#oD5ttOu#Na!>1nm~<3f+o~s`5wspHuwXsFx3>CT
z{aShdPjltg$_NpaA6Dr3+;e<qp~uQ?IqzBZT)DjReSZ0+7(VWT1qVDOjQlue!cA4C
z{CK7Q+w#UhZWnp~F2nR3ZZT&72Uaj9C9#&cX3@{TsMmZu|9K`vrcMXt({fI+O_vk@
z2BP0a@YljRfk>TWY$PSIp_$6Ph<p!J6kcR5aL57x<L+3p46>CXdQmsz{t~94eoYIA
zp1Y<<{ihKz7~Fjr;{%ySG#16EB_Sor<yNggW&h<=|9gg<H83Q-BH|9;?7F2AqYeEb
zs^~T>z0(<dQ6(wf=|=p?DPI+$NU(MtlaGh3jeSWisO{}jn=o>$L%ZV=_NV?gQSanh
z<aZ0XdcG4LcPLenb92o=t|7Qf+Wq{O`;T+_Ll#iUQ1{|lQdFD&STZNM?kE{oe3)A6
zO7O&H4vGa#M6|om^X+eP#XUR9$!~UyWksjeotJU~PZvCh5pjraZ!bEN`A0lT_q-bM
z7lEn%*2F1i6Hsyq-*e4%n4k}W4iH2HF+PKp&*b20$zxx)9UQOmWfX<TIN(Colh(+W
zVAkK8I)EbvY~(;0_k-?bM<_xBI|5&Rkm|iV$f@tn805+g;+#&6#052J>YVnjE#w at C
zT2!s?c}q#sl*Fba+Wga2GFvm+lS<z96l|O8|IpBzww=I*E9ts_s{Hkdc$x1VS9y!t
zfI!ymFoA&xX3B@(V_7jzu%C>P39j5A1tk2S^=H%M5Z63V*HAX6{x8<odgbN2@#oj)
zI5qj%n(du5*zOFj@I5~D&s3j5v99?&lvSxxdj-TdOy$(8_L8$F2Ypi1D`L<hFtQ6X
ze<Z}#UAwC7>(@w~p6IE|jZiz*nSL=_hwT;Pf*mK1DYauD6`^9<-5)79$s*oKetaR<
zKbFDC)CmR}gTKS%s-9_b`d4aHe;N_J4a7!tMehDYEUEQ6$EyE(kYT6a!`DvVd*93Z
ze?h047V=qt0v+Z2uMZR=d~Q|}D0x4&Za*}a{>XwL5W3VNCyX#WZw6<4u+I9~0(2c~
z;1J&PQSzGZ?{m*}2KzB(*jiGx=r4qq4q2f$p0Gr}d*e&G-HX|wcfLNr0)DVysa|*0
z3ch!kAvxYM^0*L5gmzcpYt!VEFFHLZCZvCz!VBN@7n~tyP1=rAZxXuxB_f?@Kq9(D
zsD+KU&NxPSh1Gzf<rPU$iFu`=MI(w9vkao^bE$K`S5Fhw%|!kBbpaCR(5E)L!SF(j
z6}lvQmN*!61GUeb%Y<9@;H{H0XGZH~0wL(?>vdm0#jT4Il3#!|SvF(i|6~Y?6~HQy
zSh|iz(b-#t0t=3xGmx)g_Rd0lpzl2?VSkE-O{v*#qPY#i*c{BLh*I4ODR5glpQfQK
zL$W#wWc>zGC}!rI;~F+JEw)C~1AZmd2=j)N=*QDI at l!<wD8@NOWyog;NK{o-caqB|
zPL&fcP8j)qguKF`jFG=DTQ9M(q`rK`YF=^s^PbZgnsdUm1&Wl{J4TB@##k}B#%5`9
zj%j}1C9lfzJr+5j29v)p!D>WTBt);WaPw3-`5U|P^&a13Tbhh1DwfnL)+%D$-lo#-
z`ECDC5f5|n9GPO^)`+O*1GdKNX%3apIw+OT_&I}|syCVl(Ts at 6S4`u~D|eECiOr=5
zW0UdTUL*iiB7?G>eDI5wbw7w<XHy5rYDhg$PPFKqYu$M%?oI(T^S>Jotd-U_d$f##
zl@|6`n!!D^=w`Zd6AxDSDuu*bfz;Qu$MsBw1DC2AAs<-8y8oHQ$-5OxG(t8)ZEvr7
zK@@WzUtgJ${L}^ik!jz))coD29+0$Hx{gCdW^Xl_|4bhDmJ6pT`gSF?wuA<1@8tXU
z>CTo#<~a7D1}QHv_8=43f47JD>Cc4Pc at c3G5gUU<E?9`vdUiqYYeqikRLKSM4FPh&
zzjUB*-6J%uf#*UtSVs3ZvvcA7I-eDe8x)af>ylv_z$p!~xecUOOy{(J78#0)dVB03
zP>$is{F+0qGH|pDV7dVPrwazIdCw(-w>((S2+?l?L69dQ&=Bl}EXGp3;lF!$%iAmr
zx(yU#kk9PI85iP^4D~Eb#m?%<a@LG)hHs6iys<eoI=<z))YW>vKP}cwwyF<q?0pFJ
zoUN$2va+7c&?Puj#fo5ZHO_4#aPwxd!+Y=7uZ{?sX56{WRD07n^J7B#m2!tP2(EO%
zsv_D&W&Z_w#bX;*8e4!0W43{QRnX~j@_7dHHCl(<?Z}ua5h;oGkRG^DuYYtyb>QVT
zQ9Bx9Cx6Bi*^bJ%b}MwSRe42ose&sDFs7KQHR7D>a#loq<&6X1{nVlTxh&6^lwk82
z8jXH*h8#Fc*z0D+?CYCbg|?d{T^)T&lIAH_O}zxFuJjvf<#iN9w&i;u-^AKL7LohS
z#5;$v7Mo2sj0iiR!8nd2YQLY%%J)C5x4%$^UdWX&H9b!`xeaYm7?3aVTHhYGBIl60
zW>BgcYJRgbAQX#3+kXPrB&-(r)ij=Z-=liZs at aGcaG4`rf9-c8!&6_^6nef}K~8Ab
z{yIl1Qk&-q at WF?7e%2$;P31`qJyz1<nvoH#mc>FCSZzQTcCq6BEabNN1B&!Fl at w>X
zX1bhwh7et1TC%9M`=&!NO6~27^@jUem5((3{be at 3LXJ^#x}5eQK`$%&1H!JPC^0MF
zzF2R)FDr}BdVvBev!nFAA*E+7Fr&Rs&lA-YbZL%aIIkl{EA1PTlFEZhzA~#knTpUW
zU(oM;V*KU6**TahCw(@e(w{xI{qz$3-ggAm?d7C53Tt+bnBYIOn-SLOM5dUOm#nZ&
zQbC_SXW+^|_V;Hb2D4{N{LO)r|1Baq+toO$g6UhLSKS^W`6L7nGv#C3R2aEci1&l`
z%MenkR?*1URtII2Oa0W-J`$SrGG?YIM|bE_pA^cX8rgTW&RAlx)>A&T{erzCvHyG)
zd`AS^=oyCM<e)URWv97WSx8v|W_>W^guY68tpE48DK$u$B_w6&m;oK|(XK&`%ewzd
zxkb-VCC1h4*B%S$)6J{E#iMAE at 4HbchvG7inihfyTm@p1M@{RcHV*A`DPN(BjJneJ
zdn+%#R8mrsv)(^&@`af!s+Dmy0A-3Y&@|>VqPxgPc1hXi$4a!XNAJ-R0wABQ46I9%
z-yf-`z|}b9J at KfoHUb}-=`oc&D(kbJn&o?parNsi#hzWSj%-<_N^8ft)%_>FR5H at c
z1&rVLB9ni-i at bjqkJiTHMYJ}bf1|kP4S;3ZqSmV=>K)|Vqwo2%5wc{}(4*m*Qu57^
z!LKSq{#6uBy{x=#F?)PZWGL#d!;NA*S4qpy8yd>lGZ8bD3Ez(3_%fVdX9rVHgpg?F
z0LN0?&&Di4KrB*nY&9l39~ycCGz(%Q-z2KolF*4TCk5DPE!%w`4ww*z`(^U1g;`ZQ
zaLA98BrT^!Fzice^BI*Cb6jJVsWEtPI_za$+Q at nt=2QtK*<UyD%2#+m^6baB_5S*M
z(NLD>_XTu&>3da`3AcgFX#epHzDzZr-D*G?>KU;d6O+;A>{(0TF7#Gt=!MB_Zz;Q1
z&j6;Fvu4QYp9*_5UVS}FPTJeRg#oCt*sm?&+RNQ+98}=Eh-o)L&yDVn-qg*+n-bRC
z0Npn!)gM%;-uKOcQy-r$Xa4O`M at hE`(%+B0jOwR^+JA;- at DzK|?sDLEap5M1BuY5t
zl8AUe=debWHk*)yILd~5fFRa|q;XLG3Z`n1KM3j5APWp;nL*a3tRte!mr~e?ikV^=
zo+ZSuw%EOes3)JD$PlGqC<1#?yDG$$HbrzFKZCPQ1Fk9#p>xW at 2Vwe@erf(pIr)B&
z{YpeW>a#5rRf{<m`0CJ5;LNUv#Oms5w-^_}sHzna{(~!~D(3A<Dv@gpE#vw*IMf<L
zeCyDlm|mKvS8gg7C^M*q>FGWj7M1aQExxv%1Rx3n8FT1}s1S*%BkO64#z at IAShR~k
z#s0LJ&+WijzZe>lyLx+3)v?upw?bv}8Hl~*v?*&?GdHI4Du1R0jAVUHWd>;~icM2j
z0^#4QU1f-$1fEOL7Zh1xkkv{u(oL5rHBo9Qm~N2mlz4lK?r5p)B2 at MO-6qcf7t-Mw
z+f~R0g<~8OoU;wRpIm0iqwHM*DKTBUk07^Bm2=*;TrXRh4W1moVcPUTM7P(|M$`dC
zh9;b*HFD@>FINYhMP6?2EQZM7dw#Uuc&u7pfNy-d#LdNs;N8=h`#D7aDMyT4(8+F2
zM+lfRitwqt|C0tjNK<3|M%yl5x{>+=7MRCeCLshBf_YNlNlW~k5G}E!s|9Pji9}sC
zu3L$=Q*<Yb>;~!UAo2t14AenCYg`?=71wxNk at n@o7(inxubav~Ujq4z(=E*it#1}y
zJVQ?YHR!=*ImyL=VhY5^i0}`Yj?3;P*yF4hW=l9^!b}Dx3V%Fo!wtgYKLm;*7%|A4
ze#K^4<P6F7G{rqrIBh7x&L{`L*N{mM?w`raeXc at fjUazWNS-!S7J^v`wKd(|zf^2w
z8JPr?8A`N^qI+1XuX1x@jCi6Q>*!&P`pjkt!e#2Ek`~p3^b0fPq at SwlePi{n0vq87
zU0;sS3K+H6`+NDTFM55i02L}IwJ;Vyg~)n)QzujqA|iB0NdJD`ohR?B%E{sfA$(p=
z_~=Tad0?hS=ngB{_y4O;q81UE!KoimxXPzw>$3;i+n~tT%BmPw*A`yb5->Mbv2%7{
z;NB<nHMQ20K3gGYZhZL@obaZY$wwQ~lOdYr6{H_<WNaB305|+5%FT|@<<sce=TW_K
zO{mFimAafRr~O|+2TCwfIbL!{DHnL^dl-K0d>vdce(v#?XHAz=PZQ#QFYoXbjkwbv
z!|zz4gY(AnTP2k+HBb%bOPB0}miXu8J!gt9Z;6zo8*Bxl?VW=f?HFNq1euaeRj!vB
z2v{|BidKsfm1IC%DUp{+QqpG*=e2JdVxZ=`=XA_Uu+`T?5>4wnZO~xf>r2G^VTem)
z5Uumkt6)rueNpJX(_nwHn)`nBIqrXE0MU$}f5YdjKG02i<<so`s$mws*}~yU?Y$B4
zwmBA^FfWH(07x_4;D!*=e6V4HE|8S!+~wSGQXMMah@g5?mN124BBl0a_nnw7j8qHs
zx*>2b^!9WqBNLrr*DjDrpi>l?3T8(o-BFP4sNPc|(pZn51z+vzXP05mS~F7xQ=Q1f
zgPzsP{@5%R&GS=4L}u~9y{c6H*C5?xmcF`Y?Gl6aGfza6k#$OZbAq|Ki+A30>EPLG
z10Y6yR!-v->@Wic=>>Bq at 7k+}U5^4i5!kCiJ~X3|Z9ljdud|fIR?xRTuh&03y8eLa
za>~aA^Uoy#MENiLxl&?Y+HWzp{*eOhy}O_KILj at -CI^|DDW`ux;p$9qlhW*PC^Zu}
z@{+-8e%afLHqY)6GhNR55)5AesKFR5C5SK5^n2^t^~eAKAOJ~3K~!60QtTh0=X%B5
z`6AzWz{fCJXYwlyMRtB>ejW?#J8=g4{#8P9T!ef8x+i6&rH!_}?I%!Q=5G_yU#!sU
zj#&SIxZ>JDPT$wUFEjdS-n&?@yE~gGjZT#lFN^3t#nFPVIARyx at yL80(-*m0_u;T;
z1<@-lYkE`6-#GRWF+$~-7xap|!n<_mO1|RQ0nMuVBx+Z8IpO{aywd+;;I1tJB2I0V
ziZnIBeEAhDzhoYB*R>jHUQ}3(FV{QDejpjBJxVU<{tb)I5xT$N_^}<G7j4il77vEw
z`VHuwCHcGMT>s7H*#g<5$DR1lo;Bim<*EWdL_2F1`t(w+yDS@Elw$+l!ulWprpf6)
z5RxN{nVs^o04d3{%ej8<v9_L+6F{_d_QWA(6aM{qz3j7PW^;<?qv1UZvKMdPW+{{R
zQnr7CqHj^+!y|MDUk9F}DGtblma_TT-$fz*<PyE|ilDg0_FS!o>4 at 1y&N^*`<YM33
zl(80+q`-w#w9YISJ!MJ$<<0zZ at D6=qWJ7_ at XuTSvJ)hHIhxJTj)(0)|XAQMiIVP~A
z-ZbiTP3oyz?N}XL@7Ndv)=&I3Mi5OvBjlVVTzx}etZ6+A^W_O3T&g|N<?Oy)n7h+B
zI53p{v<!Sgsb*l~kpZAz&xQCF4%`j)+qcHLgAB>Lgq}BKnL;(jA$4WQzs=Bn&vk*Q
zp?cjSz45%fTnEnf=GuKRQ{_W9SLiw-RAiM^zn>enDWE3Bes?O{4m_#<zIZgs+2Z$G
zfp|IDmH~EP!3mZ%Us2dWFp>D6rTu4+dVh})i6y~eZ(PQ8XBPwF;>6uo^V!{A;`xV)
znS=J6V-E_|`#~%t1IzTLuZ|YPY)NZqNTPH5PQTJndw(eVE-M3_L9M!EIoG}##WsVg
z$Zm4ZtJX36JMYLyR!`ry`BA6yx_oJ_E(7`8rL4QDIIn2KfX`?%bY3CHOj*seFBtTr
z?%s{M%yU!%0O63N4E&DOAn(3- at VmbrqkXCDD5rlV#hwe0F#OvW89FRH!)(O#qjs8{
zcDX at MNg=JW{I6E)?Y|e0P+s1TS_jyj`u9TmSs~Jt<XbDa;qSt=4wPdjKEt#pLAN#d
z!zF@DqpQ!5?B<>Bz%Ac?f(G&Qe~Q5Bh_0iSa?Mxo)wyf40U8oF9zY+z`&RofU`PGe
z66b5{?&PBCQoZq_Znir at NtS|0L at W_;)V_6aeE3d*xH0Jl`B2gE$sZP1T)U9#A4}0E
z%5jdvvbjuzs8BiH4YtdSYgTK!Wht}Q%g446l0!qEK*R8tHW8{ov(r7Nk=Ac>tgPpu
zj+lAA!sR8Wu#4xT_&rBy_^95qYN_7&+huygmCN<Ub1$d*S|K^sqIZN+BVQ|O%Rx`_
zj24l1=+lpcy34U4WElfQ{R|;yFF9+{FeClGKR|K?y`fyJgu9PDCC12C4&@aGEY)kS
zy^|-Zen^fq2LPGSW)4>PlNqDD|Kn=hos+0~*YHxk{_3}~{eg=4R~N)t->cFSvMXVt
zsvV<#2$Y7ZR6YBQvCcBp0Qskb`Fc;F>T8yrmk}Lx<tc*p+k8#?;2;Iv+89jaUZ6Th
z(r1RW-=gScN^LRop1OGO$~nvR`U{up(7_dw11$1wC8^;{3`;ryf~PxHYW^9lv2^!M
zku$apS?XMwYwkQdhh>(Ww6_~Ts_N^PDI<d}s6 at oZ$yBO}eq^~`cm9+5?~5VKPjHBA
z{`WG+CC4~eKMNVNUfA<R`kfzc$GU?pU5`0^SZOp~8|gn_6!EobHS1;sR8H8PzHKvl
zQdbgI2OJfBimyIvi5 at 6JLVe#-J+tEILDfX`9GmqZ=9}QRp#DR@F6}#`5|JE{lUXu4
z>voq*z8T`%gUDt8MMfdJhLOJkjSU#z(^=B_GsgL6iKL`|>_XnYM6bEAR|nJP%yuha
zC){r+L2D#CfM at i!70dLRzg5<rtfV7u-b5KhcWNL~B~4wR>iYX?jGQ`_;9+P;B1DrE
zJv#Uw5%FOD83N&eyIZjl5>?o_UL)C$+JVro*sE!UuDcz3QzSyPQ}!-l9&^_T>uwHy
zmkD+AhWJ!m<FQ&&alFiF2~CRbNm3wU(m9LtieLIbpnm9PdrIrZrlY*!2+J83O&V+K
z5ac<%=s`o*hf+_=sHOCAsf2W&4;B at o*U#eU-A1XubSbhyF@oG$wyTPRC5;OwY6tHk
z7jM^iFt)@2H_x;5NFkaKhGOM7$=gqG`BZs?owNC!BK1M0$#o=#bZWfGKYcV~6?mb0
zbue9`H{G>Nul;~QPDo)f+0eMM?n0feNJB5m>vobe_ZssKHX+R at L&y?_&l1ec;!j7K
zIe%p|!Kx~&Pg|rn{o at b=wJea)0?l3id>8jzZDSK>;ryx8Q{~}0LqihXq2C%=rq|5|
zImc4L1q&(S&xOkrjph0BB~PKBpxzgTtKrq at kMo<e!gFm&dO;A4P=ho(u&t25(R5q$
z_g&+1-Vt7?*FU;UulaNj at mo^t?-f(R=}$d5fg5&}_07Z<(r!!bsPG)EYT{k at r|JlL
zs=G)kiorGQ+cHQ%)Pkm1QOsACaou%A8dQlzRC{|horhG4!9lAA;m~8J+8A6vsW&g)
zmhF$VL@zq3+xCNeMQvz!RV4D<{#`54L-RVY$=Om7gPmJK07e7*nq>c?2hNcGnVCOR
zm%G-%?#q;U0C<?>P%ztN8JRqTU)%As at 4;GgOEcgVGKx}B(hp|8VAFDXkgO+9No-2I
zHfH7f7w9$5H3GbOLXNRA1Qr5A=dUJ9_4~Id at j#e8Q;z?V22e}|F-p}!eAHNeySEqJ
znX`5Qvr7P$d#L;*^QH5?Vd6W+BdxF`@I6aD5EnseESm28-4w;HEBLoSO7$*Ku~^Jq
zD$%}j{uIR?>>8d8;l)ODnKH!7mj~Rvi0{k|3M!ApgekLmB~UzkfmgoxGx-e~8gvTr
zlEG_!3G&12v&(qFP^7#QP1x}*jmkBjO6~2{w42J at at>&QG`i9(@swyLUd8{uHyDC|
z#B5oigL^+p*Kx(+MkY)vFX<hbWtVXEFTthkHn$s;p$SrdE<;ag_c59=%CdNQCpJGg
zC{vh=^r|0MSarBiS?20Q%Qzu{dp{N>wFZemw92}}$D3U#FqibHRpPS?;~R)PV~_Z9
zCQ4wb;R{Rk=9~RyI at zf^19?QsIiw-L7 at KpDr>3Ru3}=p{m?e76je;G>W_gGj_r7%O
zvge!}7sNRxC}*IRFljqQ&mIkZ+X8e%!`uX~Gui?|ia}jIqx76!^W=UUd}NB5*Z#?m
zeKUV}e}N-DF(4YFhc{<@^5sjj1;j*{BgxGu@z<61<vR_H=Zlx~$FF93p?)uQ2F3%>
zS}{0icCeZ=LHTEaXZXeoLi!D-52~fi8OT@~#j5YQvUDGmm79b>KUW0+RA5fII$kBP
zu^In$jmM8I>ft<?`0@jJk9b{^V2{g&;-#fD=r?T6OK;)KyF*ai*junYA2~Qewi7>y
zQm8~pJzLiv0O9 at 12-bajF>{{`gEWPpw^c>*a-Z4B_380Kkeu^ZKfu+Orle1o=Q#+D
zz0r{c7~&{Gr at cbXfAv`OTte4g&e=~CWX;#P`j7cxmSLc7Ley#wg68+*0FIrYZ1=Iq
z^-hSP>ygI&n8dEXcYv2sb10fD<i$5-FFcV<`PkALToP7)FYhR9$bc0OU!yT-G!$aO
zhV}NMG3gC~l&EC%pDdMGd2Q=w$Q1BGz2e>!J3s7#Yhn!wJ=&Ph7a<~Fw;R)Se4yfO
zu3O!F0YdZlvMB#BIkP7sIx<Jmiy!n;f^?~8>8jn at tE3|0Il?z at 79u~@(xb;%H{HCP
zPZ-r0wR+b4_lp01hu-q+2*VdxKgqb9Wdmw17FDNsqW#AoAcc|&*qP6~F+z7Qp1U+R
zG;XXjR-}cxb}L06Sf<x}qke9EI=A(u*OO&fuM?Xg>doJG*IdqZ-$+RwaJOb*T*!E~
zKfWw5$e_vo)k;j)o;%8iU%#aV51NB>3;R-f8A!gQPVHTszh*7JJ3~pUVRG%pW#qJ;
zNC;Au2c9B&_Rk!ZW`{-Tx3814w})uY-1W3sb~kQC#Qt4Z2jQ2)n?@fM&&3D}zn8jM
z5G4damZGz(2$n7;zqWD0a();VsC{0)_ehF9?(C+s6`qb&#!6$V4f@?VdQlist6lUQ
zk07(_j<W;vHfQjVm#IeJwI8*!<!7-$jt&&bj^18NkuUM@$D+62q3<1WXIGl+PQ<#m
zx&X|ej&+U*k#h8hl7dZGd2J|Z^#9f*8>9JZW7XpTmnk(!t}jRb2_~ao_jSdhN{wn=
zC#-*^tlj}och+@&uaf3<sN$OZmBhMXlqtf*6KBdtF4$Slx?pEH`{O&xhd#H1ocgV2
z*#5y7InbeK=EW*qH{|^6SQO@S(X*Dwh-=mcOZBy3;%RXbYZ)PGn4moIx0~)z<vHio
z?#zr|7ANwyeSK;4Mp9PK7~27>-0tT{crvWWgnKKaL at Z_9p?k?$lk!fA$mT>oT05}$
z82}GcI}FloodOPZm!_om<My&bbX$ftlr;tU&tc^ouaN`L+DYf!bO*>&<@G=mW>i?G
zQ*=xvOvMJ-tU-L3=iXJGi&`8u=I1+TM10W};Y6#Z5nUH~idRods3md82X-f+#*6RX
zFd*}1d=exe)vgzRm<OJ=#J9OJw#I({a(MDB>t1!PTo#4?y-Yu4`@e{#uPLGssg_mZ
z>6805W}ACk)pnN+B8iBs*1KMS=$VqPt*xfGkJbKy-i~jN5Z8zuxlBd^rOeqFK4foB
zpW0vi%w%)QbpE|&@|D@<OZd*gpwoTq;3@Rel6(Z?fy~P7A$y$lFOdVIlUFyCOf?KL
zY!9FYyW%D8e0+12jdd~O*JatKM&0A=laU%PO&i-ak}3X0h+wM#^N>m%2x}<ubF+`4
zkJni9r4dHHTqXTVO6C7q<P3;rSrS{Nw$!rfq?h#a<vBkhQ72+G%ScTzfit(q*BPt9
zbHjQ{EK`O8P*Pb%Pch|FQmIWVhK~F68*4z<Qd$NgUwRWxW^LkFjId#3PV*FC$J$lK
z0je-@;u2OLQP_)3VkE|HM2hc2OiI`BnewQQj5p=HpVUD5(zcxRv!Knk#2%2B(LK$f
zgRb=Evdd6N?k+F54l-@(r5r-n&SO#L#romA?DQN|)()6DLY$QbDYaw={xoMxc}tdL
zu97B#@dl+V0K`gWI414ih*17TorGMeX$T@B_@5xNerQ?~zS*986UTG7Yv=suW<(cm
z|6^wCn76+kWGM?^QP=RB{%KRZ^HyhfXh<SKo-OfHv<TuEz)l*A{f$_0izh0`(E*EO
zL^18Y-|lz`!|(OdqA!<BxB6a?v6RYjezuGW<-=KHc>C~-k__*|K|glXts>$7Mbtl@
zRdo8x+XDYi7oeM}Y^+EeAR-b|oxcg*CK<>T0oCosX5S{P3Cv)ML?R*w5PJ0-xk at qO
z5<u4ovdUssDM`&`B~lU6yTDwSviMC)^ydG`<fwSoVxkxXzbTb%@;tiDj&r*@CSq{#
z^5S9d8_+V?3bMX~!X~9)UZlJOtxaJIGNuClOS%4 at 6qdMYvC=Rdu?z!|im=V`g=wey
z@(i$P<uJ|`HI|Vh8@AAv^=d3wOZV+x9y}_cFkbmD4`Cfkfajn%O%3{dnGT9?+|4!S
z*%@P1=8e>?u31Z7Th76CNSn!;M#W8CF!w*CcddTe--<so%k+CM8RQ`f^%_!Alb#DC
z1liN+h%JvLW^?UxGvGA52#giyR5k>irF=3eOes3pc}77<scka*E6(}RloxA7y;zQZ
zY@{-W(BqS?ViStlSncl;ZvS0Ex<E;+Eh4=o%&2g0PnmFhu31<{vxP55a4{q*N^(q=
zDHad9g`TN0bZq>S^9Mh+&JRnJR%Pl!Tq(+SS=Awd3`Ac9OxgP$u9uxz7o?=juWo`j
zCiy0P#za9Z#!_9DWin(3uUk?#-7mAju?NtU5xSXm#B#3NdAVLYs~h=bV8%@0S4;J}
zZ at r{HSr)1nitkd)E9KN#_%dx at Ls&Ce1e1`X4=l at oX>;>)ziMfYZUZZXYnVy1#<sSv
zZ<>W(#$<?ll~j-)756fi*=yfHvO at KU!{obNc?4+lJJH!Y$j~)07jxPnG11Iy@2sz>
zu-24-hPh_Lb+`5PwJOW#lrc3U2x^_!#+1XtQBQhF!x_<Oa>}+FD at TUfD@t-e{0(Xf
zHVP<DLh?9UfFoVZz@$&)rUX-N38q*>ZMVAX`WLo}L>GAnuiHBzNS at 6~J)LSf4wh`2
z*F~XUuYOOYQ8q=}7BYF|c_!QFrq(U_@~m<g5DW5K2&#3g%0aP)==N+Pb|?*tO4(ya
zy=mX|cKMgddHcJ$vfzylv$OqK58@~I$QvWfZVj^RL6xW!0LftIWaZOnYY<OOmQ@X%
z3rPtqpEftU1TA~tLuqXzgPJh4tm+nDvXp<OvCn4`L1Wha(fw5fbjF_Yq3QK~$jzJ)
z#3~k{iz-imqO%dRfNQU^)PCb$PVLjP<eb+vzQ2r|N9}6Ty~E&DpSm4MbB=O8wO1O?
zW9HD6?bNlro<NyKQnXb-HP!$~S#^smR|-Q%a;-mYE~f-!@&nxdj_|?*1>$CMPn$UK
zvjKo=EgbLbiG9Ez8k*6{2v8I3+MU_u$E}%hI#~!Wrw!;ULTNRy+Av^A{G{s?%NjE_
zC0KlKv*l+o&}~X7F^I4T)(xWy226x#@ynH|Ykc-V{hYw_{#2KlfygVdNf72z{N<dF
ze7R7ol2@gsF2KyAv}FytRD|w^83Fm30U}Tha%q}p%C!6GZX$WiHm23glJay*RzB(j
z;u6nRd*{GVn?s#C+~g>y%gFE;BS_Dq+;@21{%$Vts at U_81*gH0A7S<J!QKiP*5iiA
zweKS&B*{$nxU(@(Z}iU`H7QaoWiIuUYc@%JQ}~x*7MZ(#7gNiAztT{uH|F<$9v3_c
zx+?7JGUSk=4^)2!e at q4F5fC$gsw4Or{)8)`?dlp~-K9f9l+QZU696*XfF2z5qsc{w
z<QzN7QeefjRbzx&&LJy0AnHdoTZA$$-`GrESMFoJ!ZgnLDI}`{Ta61Gv?Lay(D%@N
zd@IGic?>k#s6a$iXA8!lNBb~18(EnlKV=L``tSSot4&jb8)u6AB`-gG(X^nGEZMjR
zbjhe-WIReR&prPG1}6)~Xem6~>L+f8!I&YKjn`}m8LE&T9vVUnT`!fFbtvcv>y1Z5
z%WUwUdjOr43$;clBc(97O~pHyrF?$G1V5-Pn-Nfa|FNfkw$=enArLpE%`r+?Z5zog
z%F&T^mK&Q7h|8+6rzx{(WxQwPFmCv{Wq4_*4)hFVTFzNB>TG)DIOkmDgT&1jL^SIA
zFdNGt$AJ~czLPI0ib_iFn!6v?ffw`sT)p<b7{E8|x0W)<E@S1Z`#q(Ss1$vhjMb^i
za!V-+LPrad$9#DD_0S~6{v_OP<_qTMU8se)p55qTs?&+C8&?+T&G##O#|@&B1JC2s
z^YT>-eMsao_WdewLLiy&9}wr8jMn#18+*XS%_$fwZPxe{Sfc~tQ6*cB17aGQtwM?N
z*p!ceJjqd2L)U+LUTi<X(3H}|<(@G@(W69K4G-D$&S@)l4+Z{(cfASXU8r{lsm%+R
zqtt8HILC8AlSVd*RzsWqLc at mw)nOiuC}|S7N3^WX93C}Jr)-=NOxZ!)@24fPbXf6|
zc=0m_j1Mff5CmRrZ=YIMVioj@Et5e`GKX}wY;GN~r34Y9OGxY;4mZ=p)S0WwTX}ud
z?BK*U6ISQjmdBFg95-co6Wdu?Ix;wn4x#mR;-!@^HL@^;;A+gLUxpAHGvN+zb2O_2
zC?f-*3MvMD?*;E2sAP_29;n&0`aP4W%pXFKZVucNDz7P4P^jc|b_v1pHgg+6;nqR2
z38i^Cx2KE%Ir8r`ZOSf|QH3!YbD8DIQb=GNL#J&4$mzJU_Z7N+;QT9#P&;9Ud}>zl
zo^wMXNp%g&MSW9l05 at L6E?)%uybm_}r^rdKtb+}n-h2js{SN5bvp$L19fFEvsaq`u
z{^d9r+M3#|!~>=|f+R(SN=Z2~9Yt|;kMXy~zo=-gP%(~QSN()bDdFw}NF*kjIg``h
zT8ub1pJ5JYR+v<ZicH{@?+d)>+F~ciG6}Z0Lq;6@<j_GSsV(KMJBkNAG_tuNL!AJk
zQ4Ye_F=cWL7$T9nVX9Bp9IF*BWDpnfd+TZ}qmp=LjYl41%A=<)`!zKlk<uJk%{01#
z_Ltg3yY;V;yp6&WpQ=(`e3i1cFubi8&_kHL<TBE}QlJ4@ZQlvsehj){qXo=Qr_QoG
z<H<md#eZ;4&H60zsK2eMs>7_D<ATFTLhE5k@JR^BCtr8x2j2Pe==Xef**l7gPUa2o
zt51SK>$58|g|lHD<CJAu|7-C*q;@U8y)8GR!!|eRyLkjL`MIBEs^2ghC~BHbvMIpo
zY+qij<*>9xq76g+bQ}Oic*gggbJg4g`>YZnn68xPFD#ZyItSd7MVLwKs<XZ64H@Zs
z^`BP?a$%KPnxZ`wx-a%)DngKIVA6oWL?Buty|dF~x>*jm+Sl^hA1T!lHwz-1 at uaj-
z@=8iVdi;i_D{iV4`Y!5+R#a2g98;DBbPsBM`BS9MY3=&C>N6`^A~1C5Tsy0?I;*of
z3#M|*PocKfm#R at NK|$;@>Rrdd%TYdCbQA+9V;MQN9OE0NtE=&|ti&~sN55Umy)U%x
zKkTf{x5Qk2IY~tP55B}t4bd4h<fKC#p^ytOm8x3TpJ=N*CjCD8m)RLwvY6KlRfzA2
zAX4<O8Juxa7!Ej%Q_ll)kTPtQH0>t(Vkdyu9Isc9d-QMDS)%{adg`#89*A(n#Z4AI
z&Lxq{OW}<ViOL-IS@i84(^CQ!r%GVVaEwzX$8l-rgy(#@p1HF+tFt<*v$kye`?N9)
z`XgV;sIHm1EE?-zr_3?4g}Ap@)0d+MFK-8T=JZ`7DsL>&x)TU8tRDhrNpB6oLkFyT
zS>;<*RhJB2J($8zs87M{xoTHFyn6^DQsM_J@okE^Gh*V3FmPD=$@NC{YfSVhL2noA
z?KMW;ajslmna+vtg!CW58l_7uwTl<&H4nv|?ccO(9#T=&8ej#z6ZB{Ri?vxZS9`%j
zs4I+M*BPAnrX}3?yAWKmS;{rCX~$vJm~^a^z%nHmalH}-u*UlOU?I{8)NXGKT=IcL
zN2zsIXLVL*{YAT1M%9(GPUQo0pz?mHmv2f*P3oz-$@VhiQqFkGfL!$p)y+>-khgau
zq{j;tXwwEez%H#1;ZsC#_SnP>&u#qNj_rLpf=2J>^=i5uXP&c~+Rue}7Nj$Vsol9F
zC!X*E`p`<{65tZokBo&In*1hIqJ`+A2z~CNvt<W<akvs)Z!leoXo~*!t^98GY$>zQ
zv$I;R1JGJ<u&2XZ5bNFjl4@MtHH@EbZHbQC5*j28_IN3wNz0-(C@@!7D=I`LMSk<F
z-uOau6Irt|?X1q~tj_AJzr^Kx1W;zM?T-{4DcOb7K(-H7Qp|B~&dTPo!L2gxZW4HO
zyijdB!(y=%8`q5mHJ0eXMT0j#Gv0gatW6O#X5j79e0Nbq^{>IY(r#qu6!X)W@{zNL
zq%X_|OY)>Dv+HC^VgexziXM8XbWh{azq8mM7?|J~Khr<dSlV}oJ~7g-(g`3orxJUN
z>zAe2dt5tXs%3E at yGT*h9c+%?{5<bPhM!q-(km6+kJ7~}Olpl(9Je=(^o$*))mfd@
zS)J8cnIr4Q^ghNFs}=pJvza!S&bF7q)URb3ImX+=%}U{#w|jrv_u=VE^(`gcLaszB
zP_T;%=`A!4SM#gWgSgoxJbTe9@`4UN2ulwK^Nb=E;z`QLMduRTGgD6MJxtE*$@^~o
znx}h(Jvn5XX>!t8_y6pad4{gf0Y<4{(O+%H+M})<ymR?%#0aXL5~j`eg4MdL>AG8C
z!aJoLh8Z6~h*45&h&96Q{mH&h?9r<{wz&|HMnzGh`#8ah<C|(%iKw`}a?^C3Myu*1
zCeQWEA1&{tlSb{V&g!hr`b!TU@(wLJU39LJ9O)_mqy#3NIwz61Ktf)*vz+&)1<L)K
z!v=-V$k{zJgVT=@D#89z&I3va9;{N+nDn+rfHMEA9s9dES2lBGXb9=;g(Z6DW4p?G
z-oBQZUsJR%LTp6WzKUM;5XtH(@}av8(F2ey5KgTLXZKjv?V?onH@x~_0~50I5hp2Y
zE?&Xl>?KMP7%o*y80Fqs<69FLxx=$Ilt|N8M+uA&%P>ohZHi1cDFRZAU{h+xlFb%s
z7vISR4{qS0U><pv%bsdPURw1+bXI3|R%dnAU#M%<U<bBm+dHH_ccYvVVrS>X&o~l>
zS#_*yY~A$3T)q8`b6?wp>T%9+YMGPl$!u`+^a~6=G+IE at vA>%)K+Xpey?ttD`)Tv@
z^+(H>={09|Gw~SE-#UU=i@{8eiH|nO=OUtuBBINb;cpn?&qnCG1nF^or;4DrN34GP
zavl7CsMd;9)DnA+*9u|0IVH=y0I3(`!sIF~%X{|DYknU+ue at MGJ9=Ax@<X?Z|D8R?
zVISGEF3`Eprqt#&9?f=k*rKXLSWj>r5go^RM!J_><`X6z1H4*3vO`StHus84X;Q;r
z5LArs8&T{nPJSfrD5}ottj^lHSCqE~ImEXN?YTZnQzpRFJcU?F`(yoV4)qh2$IG6S
zJ?E49?~7B?Un*cI$25HdcP32JbZpzUZEK^AZQHhO+Z)>(=ZbAx8{1C4+|PI3UohwN
z%yd^(SI;24Rmd4_MWm7ZpBJFv3?}QM!LNG4EK9sN(ph2fg7#QG^2CesC2^pHFL#4B
zSj=FtKc}#7xp85hph{9J--n*cGBOxti+w8xnpvq4l$V#1xAt$b$LEu;%-MT(tcE+=
zKq~X>hxz+ulW^1%=Opm^^6sHK<D4~O)$C^+*n17l7-@j(b-#yN4a2vcO;S;>`n><C
z;XW?rd5do?nY3*apQX`{FuV|>=JN4pf8}pAD%$Nv(IIUu9f=iJ^#)hZzD>m1 at Q34}
z at bVi!^Bxoxd&(EQ$OUm~I=mJta@&$Px6(Y-!$$=EkkW>~`Sf~;Dx%n0#gNTgx%XdM
zO<xxdamDckB#jR|s7wHYb1;y5PW=Bu>7`yD+Uh8mWm7pbP9-sMl8CCD;e;DDR+tQK
zx$#9)jsm$$)#Arw6jeE@@m&6r1HoFh$&IxC33>o&aJJp)bVLw~;JPhH&07!Evvgn0
zr&KZIdae_8`luJ`Ek~;>+eQyZi2MFY-cD?jNSR2 at 8HJ*VU$E(mKWggO&l(-^P;bmX
zZhtJ#brYvMkM;biqAX at DOLeH(@5{J&J*i#G`LP94%WL5tw<+auiZpTd+?SP{vUdQ-
z*i#eDZ$`gjji6b|`8DA4`Gktw;fBSecnsn??W7x@dJBYNh?I$M4!ON#lRA=mftDeI
z9fcecB4z_k%@<AsrU}jdvP(73fd>T+KEEO3Tkwl>48K52E{fS-asX|?j<x@$0apZS
z9Q#qv#z<}dpl|gK2?AYQS)rl4^n~!+_U1g^1@C_$d}D<nyPK*sT?YeC&B)_g-TIl|
z_axF2;?16O(~k2+{Qxs1jvCzi#M!f|=Ny(lkvO7RPE$6bg<19xLDPSoCAF^LfOnk=
z&dDZmW(X=38-e+mftx>EFd{E(-7V_-eyREHas+cwYm&GKpxl@*P1R1aML)5JncP5}
zWD!)2NtReL)Ek9-zZ?<JK(Bt&RHq;*>RdFS0(-Lp-&6OxlSzl$zT0K#e(g;=+08NC
zd|43ZIW7$4sZVpfFuVZkp?xNLtO!P%yNu=kw7YiS+rvMig~c<94O-vcZsaKC63|62
z9UY4oV#Bt&-0m$U6B4;lPBj3#a5ffpV9DFQFvmQL_0J$K<416tamqlc_5d%1h{Sue
zd~P7xA-E)%m=cQ+R&g)0*FKmp(~E2N1 at 135iY0|Zg-hk`?#|s~|E~%?9yhD7bjVu1
z=<z;HV3Geu?I?xBt%#xpqX`F{<t7(E<!2*H1f7^K1ISX70-@0C+eEe0+BeC-k0sYW
z`SWR7n8RY8EX_=(ED#2`^rA2+DOS6p9rOveQt6H`#oJfj|7&SjYoBCiBU7}`U;jI|
zaSu7~&YLE309xnvET|X}W4(&T{xCTOQgq8Ti*opeh0X>OV6$;c9%W$02BB<v=~8E&
zeYc{L(AM8sMS5{#u;>Q22XXl3hK(!+{zv+EWwFczSAH#z7(3#Vm!~Z2jqYc}laJte
z*rzt3kctEmbfBo5rIZv at kZFcVd?B%C;Ri5nAt=8~SZC=rIvidk!mL}C+8H;WxEb!r
zOo>?*WI6j*Zf8CPy{VKvyO_TWb?`rtj#02QFu1vm=al49fjBzrl4fam0)^-(PboP*
z95x7K@`f)z>B>Xbj|F7Xzor*5xZB_VAEeN8In;+OtXSe_F3ksp0|5e3BbL0;9{n{%
zC0IMpgCo$$^lDf9W0EWavV<7@b@$ep?G(%?``PK{=t16FI>E#G+f=?0YQ!97?I82G
z4m7(B4Qai#F at V(E!Bi(v=iNPI*{H8kQx1Bi%F~bvy|nG?N{zd}bL26yCTk{EL+U09
zBBjM6-T4v%p`ZI5GIxu5)p{IP11JPlG at SxYHpUaLiSoIRb&)vr{)M&9nA4Vymu^Rf
z5p^bFnY+BYGa8sG?xkc&s19jO6oZOj%eO!J8=aB1pR1TvGI&r8Ijio}Th9XL?4zg$
za+ at 75ed_d>Ow?Q1aU-|Qzg)%Owwa|V@>)4h|B{T1M<zj@N3q6Z#}ZC1fW>tDtZO<x
z1w;Jr0Jc0bAP+X$c}^dtt&3gGu8kIpL2?cD=$Q3LWG(I*aC=KpBREm@D!3lPAuQm|
zIGebUY+7TEZ92KFywSj-r_+y7=+u$&)XqJn>Gq at 5va*Hz%uzUZDicVY=S{UoQg`eh
z==i(OWp3YmzPh(fPI!y~wZN}L=N+DYI`=UjUfO?g=hEQ^EawF4%iZjb_c at jKzB$@u
z?^j3tX~c`QpuDf)xX^D8mb!#~b_zyO9<LpWiP(v4tMCLZna{46LQ990^C_=BWRC>z
z8~atnq-VOBjoZ~2!u`CY at vK7)B+QWDAQ=cN3%505 at 1@25my&m^n_v3QPTd)oMYEI)
za)%l^cvAe6*Um2M`hU=Ny)x}UNuP7)kpRMcR2utmppU0bEA8alL&hK*dFBa!)l63h
zq3r;V;Q7}e>CW~tJVNaC*Zp%_f;GYKa(=y_Pt|KfYoMu^2|$%W93#(McIC6MNr616
z`1bikCg_Bs)bGU#N<wM7b9L;$n_S at nnS@#OO+-a81W<Dd5Va3@dtoPOkaQStgjzgn
zhcEJ(h}w`C(lqX{-H1kKu1a=60p!P=e|Z*+J!c>m<qXC}<pK|7GK$Hh)zL@7Qofd^
zb9&B8MV)jUiYjS9M>R<QHFWPD{U)#uQA6toaVbPjK1wl*$mt(t_K47UU^3V*b#ES8
zd>P(jPK`uv*r7bgo*17ski!@%l;Ds_Uw|h1k84`f>KO?Po9AKBR5fjjQag{9o7XR#
zZaAGGi)X75z$#mtm-)W)@|v(LHpR6`+kv<Eb{}+p^Wl=vpv*aITOM)Vw<@ZHO45z>
zk<?|(pQM0$>!j(bk!y)v>jQ5<y8TinOi>^I^Lk#Lsr}$R-1sdwZA9_8oyxKDIhiz`
zt(p@<OI`K$_ICCObI64Cc$m))sbr6`L;4<b2Qn4&uK*j!{=pdcbCcPG2+X8M@2(h0
z(0r5e7$m%rL~P`fH%13&c4vQhv(HY2%UE6LHH_fW91lbwFTFldL}P|;QC}s7h+VIP
zol~>l-Js<0lMq+l)!;2|utagdy&6XG8BXA1yRXlugQmCakjev@jl_#^*IWsUdJZY<
z)8lsHc=P7oVRTqsWch!rqD7oxVWx1o=o{6gXW`wDLAi5$p$H3LA$Eznc+B?C)qKto
zi;&mok1gKiHSXWH73bL7Np7fVFRDKhDl5$2M;|7XW5#L#jicWd$+$`J6#E`H*L)P;
zuZ1Apbd-**jM&kqp86pXNm|<ZhU!tTkA0FIZs5*eov%$JB!o<fd!0X%$cd8t3(Eq~
zWwi0`B^$`MwX9snpB_bdHfEy3FVudq2cXSZOxy`x3$Fy1uUXmeP3Is6QsH!2Javo}
z@$`(KpwOC7eR=J{cwc8~)71x+`1+tD%Z)l(HT85+J>i5O(z<2cFnWOVZcrN2*)EFe
zA3XTCJ+r17El2t0co2Hv*Ad7}(oe;UO)e+zxXhUVJqTOJ at LvD_;Yp?ctzZ-K8ORD}
zamIZ=aYDM_r3x%`n2?#{WpX||78Ay<Z}p=G@l3>E*yI)cy4OdfYI!yEFGeT`tJ{z-
z(4IHG2bEWy*xK+ at 7qmyQy1o^L?ZNA=eo>>Zz}f#+S=wuWaF0Eg_qx2txOc`}jet>A
ztR!bs7!e}DR_H#1{pBc(8G^!zNyqy=4{m#?TIP}lt at vS5s#CG5B2_~x%52GjRE-aw
z<`D=i>}7S~(9jHrbSG-Jn8r!Ef2i-e7 at VNxO!Za}CFH|fs|h%w)JrcH+VM@<L}n)e
zsg%^DUbLk1E at Lu$pB=o+I3KqLaY?*dZ+|5!uS4884LtcT!PIQ`q5o5OY6G7aZwC}M
z<G2l#A{53JhkYIe-nCz9nZB#49uudU5!s*b9GICAFb7Llj$X#m@clLXZIg1T!RWl|
zcei%czm*~j#1i|APbRxM=3nGkEmcAP%Wo5dth&8L)qo=n-KRYxk2YoS+Vvv$Tj^t>
zT8d!nbA_%ODbrTxRnbBL!8<=+d|A^L5~&aRJz4L8%|)M30g)JbKyf_|DYdf0Vq045
zW4a>e;W-oOC>WYKki at 1d8R4(RBl#MbohsXkV?NeAH^HOAR2cMYL6tA~*LTzNk)sp(
zO83k2VmJREaNu=j2|cD=B-snTobcdW4Umn17_zQr8#g9|RW1rY!4at(F6`58vKhJk
zL0qJ#B?C4=TuZVBNa{eK$UYC?>>(^%XekRwTh at iYXI+AFOEn!^{8<D?R*S5Qd!%ex
zCC5)S9j>j{uYRcIpo9Z8&NzrFDZ^4z8BB<?K+TOof>*TUDzj{;7Bktm+K3 at iM?L$C
zaTxSk&B%|4Kxq!@g0rveg&$@{CiEg2Kay`M;0%=vP{_DjVvV^#qY8IdT;PJ&cI11n
z0o5q7D)qvBOA1XhfoB<$cufw_sQ$Y7REJ^TBd`8c*o)F5g`NPo&7QKHTm(Ua5Gx*%
z31wk#eyjQ1=%quok=R$&?HRSt(07<sKnRjc(POKEgheKxh at wgz6+;~e6);W%7zO_s
zGeGLxX+brBDk^~(Zg5ir;X$=P?b_x^l~sc_24g|MK!b*%@$|6ePPeZb*PijB@R?z(
zste#<NF+f$Ke``Gs^Y9wwQdZ6{7H$QP`qPH>7&E)nD_Ho{w)bN$tN)d_Fw~bvLww#
zMDxry9PO=}y+xURixh!DzkY(?ur at F3hbGu9_vZ;!2%DH-FUg`uS9~3bSP|xI(f(lA
zo+nk^y|klmb|{3|qjq^=1h)FnxovL`&g;*!Y7{UFSc$BZh)s;+y(pfaF9~bc-xdw*
zj8{9~XiH1%25o7G)3cG6BK4dde4fGI+urJ!vf#P?l{KYce|kecZ6gwnm{EmMrOGak
zGTUzW8Lo^V=r#Al3ydL)ioyEr{=pGF()PTW2EBoZ1}3IFz=|O!5(E6_df6ZVy|RU@
zUwCNqcHCY2tC|M#&f%qj*WfZoW-tfW=xE6(?T0!I4QPodYD~_Z71DXion7AV*puJg
zXjT-3MJcl&11<jatcy49NR4?%a3FI<;?W#$$xuLTNrY9d1#XHETa<mcsbGflVF|?;
zihv^c!kPR)c^%&LxQog5y-QcRAY45BPw*_Hp7}|47iR3xY40--J5@Cx2GQHkG6GTg
zk|i3DrxK^DOJa|+46p~aOlJ6G3FUdbkRXxkMx#4cl?Ys1DV|lEf9Hf`Wa%>L#ecv;
zg3i&Ty82qJQ$&8Vot$S1W9FS at q*SUdGh|||KmNic3%p^<{@r%^4$&q(Jk!KNv%A~X
zJ<QROvK9q~@6U>Utlyo0;l6qnKtq9MyrRjqTw#^kBGS5vAkfe&A0@*BKr3Xqbk4Zh
z_U#vr4HisFZwK&DCW~;320(PaBlH!&+x#AyGZw=$Znl^kj%ly_hS0lf0(*-F+6}7+
z$2CHp&p`^ElNV^fdcOU2Bd9)Iq+A*T$=(Eu@$38btn+i|dA}3c24yjAJ&xPwI7b>~
zQ59%jD*JYcduyv4wF}=bO-c0lG&be^A}WC#?4-Mtuv6`0(-q&M;qJMv<x|*|dFwXg
zVFl-<j^*j^AQnm&%=;f0v9tL|2;aZ*BWsw^5ShWF;Y at cH1M6E=^gd%1d@QW?LmNHC
zeb3%<-+MMfW+MFpGAh!Q`{M+5E%Mv($JbmK`TQ9X>{!N){W>Q44%I-7f#$nIo!A|m
zL;<vy1d_Np1%>h(m~wqW`4FR)N+I-$)Yqg#ZQn1{`aQAr8uU)++-@<diILP=%@%*Q
zBwd*g1J}$p-Tr|1W*3w4Um(dq{KnsMFXPX~hEbqS+Sv)stU??L{RIx3Pap%jI3%Pd
zfO+>q80^Ac*eGfyAM+R=HvTZcezFkdoGS<9-uA_rZN7jeE~x<}o02FG|NVv<<Nr@p
zuV=}>)Or-HSv-+V$^Gu{8$$mPD>QyDH8srGDWUJ?A8Z2(1(@<W`98{Cj&Kc6ic(2{
zk~9dj_O1*yAk$iznUMvb>))in$#>(9#L&euc!WhNWoDNo0$vVvof7TIbKOWB<aUV6
zwpPl@_6G5??53>?frI>AWiC#abi~1jHw`F=$zz3-Fg=nUk5b5xRr!iW{LaNysR>2y
zGcR<~UyVkS3C`(0d%G48k<jZBzUcYQc$<o at brL#~U%kVbs(A4Zr51BVvD*tfue^6`
z$p%HSZKo6L8QR^^whw=6ULhrftdKvD39E&qiFvyayPszYV0S3--fC_(<1u#5cYZbC
z?g{or)m=|1bZ(#ota?|s@qNRRl}}!`!Zvt}K2JmLFpPl(Xg-{hDyhUZSP>2bR$GqJ
z#EEi_B-_eN;)GhY3Eg&p>&K|IojqO^c0?6 at uE48(JRu44Aq{-%`)m{2ImD2SVM0D&
zIy7EaP+UH4mAQ_+uM1=-QYr?&I^>DSuu?j&SWP%^UkKf)W%+Ug2*(1dX<sUV%#`JT
z%&|e^ywL0Tn9%RzpAn<!SlH2pH}ZpU54D4AGJh9t1xti9SJP!;uNj8#@4F)hV(Xff
zBla4PIOSKU^|9pWjvo@+V8gzrSnRv*(z}llKw+cp(~14uIf-88;Lc9bT!LHg$pUqU
zw;`C1?@opwxN!>4YSl3Rgt3hjs8h7y9(3iKM0u at -b~ZRQ=N(>&y+0w_=mMq4_ at OAD
zj6kf9&Ro~ez-3!ZDKH+ldc5M7TPOLPJ~I<|(mP|`a&W<^DmP_YYkac=Z*Q1rZP=U9
z`8^2*&!pImk4`&dNHHWTHaGf$;qO{RnhduT#s+el;rP#!MQ6A;JD?@8P1MYN7Sw_D
zeTKm(hiW}{sloMk0}y9||88Ka#t#iHY+fdTl%rgD4ClwOUF=kutnCt^86xmx-jJ?7
zkpn4=o?*hKgW8i(t{DRp6bPT_u;g}iUo?$4c0I{;v?cp&ff}XINQIC8Fy8OjqmQp0
zX)OO7BysD5d*3<*tdRgQv1Sb`ieVBEIA>LVNKRjA(H$bj6e^*OHL)X-^Xd8^ZOR-q
zDTiJ51&3jMSLM_J1NORAmbumYJ^(J$0Rt?l98$zsszs!*lNOcDir4N|If0(;Xjora
zdZTDza9i9M#tj^>yv at PHGTJdmcru-HPnix%Lty$x4D+c;z>4Hu!7ed_7h^*|k`kH4
zz-UB5Qjp)VoC-mP)Nxl6gD?}uD%xb(pvIpPuzm(BhHVU^$GijjI=g|icr1fVK8-Xg
zD2dc?WVVFqFk%s&IAKoNA<7;LTH<j=x<V~edLvHbDwszSH9JlP#P*yuguHYuQ_k74
zJ$86I^gW|!Xe$hX&sMav3>LiV68P5lIcCWK_6K~RX63l*x^*$)_McF-{Jr$WS^-y{
zoYaLgmJ(xe-&Vu+I#0UR8!zxj@=xG$ib{&$fb%3~XaqJnWE2P<XLmlGm&2 at n+lR;f
zzGklHStb-1OTRQJuF5^p18Qd=4s_wHyJpkJvVDAu$cPjx8%U1mg3k934tgaVkS7oV
z@g{+#c7M2)#WAxawyX%!w^q<S5da$l18&Z(^XWnD6a)a2De#P`Vx!ckJ>!R2*h<15
z2R1o_89ox??M2c?NS6GXF;JiivB5co!k`9y)GwtMr`Z+0qjYRSrIp5;y}{v<#$lkd
zdJg>M`!v%DrQFpvfzLT|F*~tkq`;a)TIUtB6%DV7Q(#cb6n+s#!EOsYydrzH<>1L+
z4qQm=d^lCI$pY)makH3NxPZ`#kdJja-QrYo{a5gp<A7}f)mWf(?nE?GA2IM={|X(#
z#$<)nB%}|pOT!^Wu2z{%nEydblK()`RwocElXYB4$?tZ8iI3d>jYWm>z*40-<l6Vm
zbX^B$La7iwGsxY`y4WTZ<i7mM#1i~$u;D|Cq|yHv>X;E|?06>TMhSCsOY&ev1>RNv
zt{_P!1dTkW_4Tzr<?%oUU!4Y+7b?_?52<(^2 at Y$QEvEu$BBhW_lx168;18`V`jzJH
zDH*A!-b_r6#L{tyv1S@QiF9aEdxz2u&gm05_kA4b;z2DP&VdYWoYRdq6|fI>)<xfT
z2syIf1j$(?6rW0L^?kcHA*MJ#*Ot~4k3Ia<f&N_RKWZaen>%8YtIJ6ay%^-gqd-$W
zi*34wI!g3;E7Rr}TL&RYqF4-w#v1xBrGEjnc4ng><|ha*9Z2#ZgFK(GWWRJ+qn6VM
zbpjhH!wix%^f`lvNYl(x9q%k%Q)aZjF?F1j?>n>@BjIR&{YCBVL_vwKPsmJ}+aqR*
zX~2=n0lv>3Ve#G~ckO^Jh8p{D`lt&pQ6 at m4Sq8A4-*lJx=B<_wps{FP^84M0_l6;W
zd4>SrJOA9N5O4^eY>UKOJ%deA&ucgdK~@?!d)!9WQkuRO|2*mA?*pUi>5Awo)#ZW=
zvE~dR1zi;2sw~+^GL*Et7?W9R)*UzO*=H#TFBt`r at F^%wG~D-K40_ZAry!FjhzCIj
zDBqK*9uVDcgIFs}BdF*lqlEQI|96yx&)L7-6PAThqi~6v<~ah395l!1RIl%&q59sz
z!fra;@*0T@Gj}}BAaqTsjH+D-E51T;>M{SZ4-WnvXd(hGgOqW*78tWMin@`AWctkr
z$g3-e?n%zAKLLn9Ui{MKOw4chu*|dA182-@*dt(Pw!W+P0603Iy7%D*c2HvGL8An(
z$lkV00|FHgWLj^8ppx3WDM(K?@d-zzf=&lEU-L%c%WjqRFE~{4blD8k*5XYj4LmE0
zW(>iXwV=1>%kN9Q^GX|7yPi>^*Gl0jG~$3dc0;EKY|(lakRYc~AhK#ex)1D%-?i^U
zOJrycDF&6c6wwC-6e8nTzs(f3&FGT{kO693PjdaCiI6?R9*Tz1Lda%9hU(0sNw@`;
zul at BvGbBQhJpPW=GOyJcA(&Q(xQ2<Ptuon!EjZXA6*np^QbTGy<YMP`glAKjR*9oG
zC{XJGW*KyC{RMVN%H_H<xK+DvQqwS~V5QQpXbfAGoSU%OOn5)F_HjR`M<|*ZSqvjM
zo5A0L=Yt_@K;J&A>fvnPP`eJbiN($}(2|rZ2~V<RtkYmoHnGM=p+H(-k=`*c`V(>?
zN;DtPN<%Ei&?0ZzO%8p?qQ435NElXa`g>={i!D8os)qgDjXtFRQbvdJ{QVWaEN(fa
ze*A{g1-|lK(;qSeTFHT at C^(WxN3(=Ys$QGc&6v^x2hQ_&{4&OmdTMNc6Df*UWJerm
zq4UqDVeQLYFkK$qF?}s0HU4^VW*hOwc}R8!oigd>b<$8;eEPd<oFEDk;G|CL83aC^
zLXxW}ypzj%vKfD+OB<B(rvMlI5s~7I#NQsZoZz&HIi2`lnUKk at P;LyEm@k(>#D$a%
z26!ZH-y~#`&V=y`B-RG>Sq}WacGtGA%oh)dpRm;z7~7|c1R-r9PIfbrA<*IQkr9li
z6ewZ~4K?_NcNwtiFG(ltM^W@RG^W+*bz%$hB?ds^_%jwF;2V6_5uUWDYNE9eQ{4=}
ziHH<2RwWiSp_c17L*?G4+G%lFKo%vUG{ySX7dS>_dUA3+j!w~3aSfXQ5~OVeDHT$L
zVPh<zvTYioM}%nl2EmmqNR`*|>%B!byEK~+)W0pR`+DWwWOSfWhjVdX*Kx5v372-&
z#s7dRNTR(8pLdOF(X}dleRu|~hw!}u9Xgt2kW)x*vlHM~na{6{K-8sj^k*8G7g>VL
ztrzZk`aJJO?#K>QC&Qf>7J8CXm^_V51PzR9gffc~H1^X|^TRMUph8NGFux2_bKT4P
zChbCa_gBxU*8Cb1fxK*NX}e7icopZ~f}~tE7x{!!D$iN=dK9XyqP5S@<6SFw+Ga{-
ztU*YD?fV%O{>A#k25KNzK=ErxxYo!MyDFbyLxQ*WhX$N_O?(2YQk|n$)vpJ3#g5u3
z4CX1ar5qLlEXyfP<4FCzMmimbN8snRH?L8IBPYSWI1L_ at hnu#j7jWR|)-uI at 1I0)j
zG71KdFU1v7BQ{pAX(GTF(*7B9yU(?TK7*Ff95Q!et|TFY!%EeBJW;dE%gDskT)lli
zu|{S0I@aiTR+5wr(%G0MEVBK$HtVr<g>>_QDqyEO0Yjw#5#bTNnPCbF at t}I9^p8V4
zhuq-}p5`7Bd4y|QbLRDmTC`0TVmr9~1pod_t69A_1nn4 at cf=Xnt{6jd at Bp-Kr!{g-
z<vjBUcUaKmI=||4G%qx1pdlV0v93O`H}f%r20}xO-R*-iZ-VyMfNO>a2y%hs=P!@T
zudt%nh;XQfT}F)mxkdLW0>%xK0ACEIVki8`iNZ6K at gsHS5O>Y#(Wy&G%tL@&G==wq
z5^~DI1TqYQ4-xU6RMzEre->~gXb_JT*fulc6G44zM_N1~SHhjKvM1ZUbHSCsadqAO
zWTM}paVlTp?Jsz=eZB*$A!VsozXZyt1VPnKUIs~5n?JDL9?;(TxhEH=o!Evt;}J+x
z1JYAfx1K|V=7CVwlusR-PFU at +v@XcShs|#{$3o&9{p6Zcz#!*+fw0!e0C#S;y<(HN
z^$%mWCxXbcg2qTOLUBT~WX??#CgAu*K^}2Y4c^_L)QiP9lb89r9!KIs&g2(vUX_O#
zLU7chw*PKT_2zrg|K{Wu-Romj;}p^_hG4{M|7$Qq;<?;2Zyp*I1vcjoQ@`>+mE+|q
z#>S6D%SX6ATMa|8VQc`|Mdc21EDKr>t8vzTwM6D_ymSX)rh!$+v1K^G3H=9}#a_>0
zlmBz=>DRZX%Zw5ZQDH~&5wBSEkftE7Sx=L%nXNG;693N&aFUIB^Oa2AhzAl&sZGof
z2(>21r=uiNU{2?UUl at -AqiWJLNc_+XWPa{2u;UuUXjtwC%E2NJb(b5_)zm+qhy?@h
ztr3v4B0cBWPhnDJK6e~<6Q~L`hGW~83U!DaD0Or#4P8)yJPsf5BQWN245~{DM;9dK
z9#x&2){C{LrI1L(ve%!oJn(Na45^!~-7wxgbI1<W36}RggV^LNg0BP`m^^*am_}-Z
zDFF#3cpxQYph-zfep%Aw{*W$^uu`Dgq+#qxj6VQ}fL7@Ex|&ub``z;|oRhA_$cBWv
zeXhN1o>kbtZGCHMze8{|AbO$Ty8IzaKQ^*Y_W!QoGr=@iF}&Wc^dzS91Md!@`2P~-
z*Ga)%@T}P;Y_%b}1{_nMSW%9fyK3?f0fQ<_Lk}~Gqd7+Y1b247pr0;;3?nUx`8x+!
z418PixVs{3+%+Vss<tyAhX12Hm4*#Gi$4llYF}&=D|3$N+qRPs4=xe|C4U)4_Ui!2
z@9Y?*&-(Q!JD?}t!lW)rCh!)Cj0q447l#mPN_DLVpwwhP|24VcwwJ2<-^M}vuAQ*=
zJ=TrD&zQ{0ryuNSpqu{&l8B8haki!RBm;Ngfb6|e7?m?z^xz5}5<jjgxrE>daTEiL
z(=g6mqVSG2k=~9he9Xqt`1L3R*Ex>~*z6NU;tb3q8B<ALGB_p_XJd`xEheJBH0=OX
zcf2Wc`5LfbSCTsi!HPmbJE-I9WOgEe)?=*eE&+?70qdITuR at 83g@=#;3jAs)YOHRK
z&t)PelpFg?!1Oy}Vbcz%78?yBb46O=?6z6KNJ^QQEoAJ!uL&W=%VH4QHND!Yt%XMo
zcNXGHBsEIi`B2OBfOTofov4PrnEzzB#z@i6OyNo{zA5Ys3!YqeE5XS#urWG)fWwlG
z+R$!Y>L1lLqFi9I;r#_+tY6R$z4xiL=ey>hTJS{CMY^F^JkXC-HO+Hon@`ud3Y5SP
zB*Cdr7A03*98mRFHA5pfcYY|@$yB7Xbe4W(3d&X|8r-?l`Wko~_}#~xtdhVJs??7S
z3UgVJ20|x5h2Orv7TS}w+cADseWNw5!8r$rga#x at 7Tpoi6APghwpQmZ$74&aE_M9q
zhPFfW`JA)<r0?q7P^e@TqdJXzU=ey*GeXQPOtOX$G{E_d5Ukg{F<&S3MwF~tGLRX#
z5iq>SvEkUb*$j7HKKBG7PlY&*k1;qKPf64l>J=}|N_!2d#HNU*o*q!>Rkj6Op;?*2
zH5q~WzG%%Fz{O%iO`nL&AXI1!$Tj8;K|KV~>i9?J$89?2Cr&<gBTXK6DSdw1ijXMC
z%m`WbRp=L08Ux(|6?jY;@LrsD{U6~6#@IhOm^cI*6i%th@gE}P!W63cY+04^>83YO
z6BvM4L{5DMN)jSXtt<7QCh>Dfl~Fk6iyqSOwznOq_lL3$ksPU|=0Ki(K-RLA>6uHG
z8T0Sl-A6Jxvz?4UbZhaDQu`z&57cU%)sMbkn78Y56GKkab0h$v6Ls3*On*mLF_ey%
z4~6j(!X1H`X=?ts4Z#8$dnHvl2H?*8b>}r}8aX5}xX4Y>h!h8U1%$~Tx*O3)s;w9k
z)dZ~*2EMSmLhV1zgTBy6&z~dt8eEWL(1C3#fQ0623~<$H?(WIKFs*-3Lp!YRH%Icc
zXW2EuFgDcEIPeilc;FF?j>Hj>*yL{P#}*;2Y)*{>VBxF4O)3Pp)Xp>T+(<PjutAkj
zl%;J7l_dkW^gvx7Y!wf(HnuWVW8a)JBeOSngOHpoJKUe5lITy^Z<04#qqLTQ0W?TH
zT>DcK6UujK>0RA0Q-(}VN#-wxqe?wKDE9x9)gpM4h0}g1<&&-*?u6+K!PM!mY-$&|
z8DouGT!~8vZ~@^U^VBL(ZzpKTiHCgL51-%okIjvJ#2Yh?;0Jadaq-ns=<JN6Q164*
zA(k9(27On&c7D%m`u9`k%Cc`rz|YKY!jh?oF`EYLT3NRVajsh7wDLNxi0v8#lluOz
zl}&X-JS{9yjSw at Frd#VINVfkr@`zNH({5owzGc8j=Khi_ at 4g0O-jHeN%2p}Iu2<NN
z<~x}TI~)Wrx)!Sh-MX{7n?|q400vzzqUr@Xa9`6l5C=nE1J<K-IAsD2H+SgCM#qH@
zY~AIUMUMq#o;(d7NWnG3O6BwCdBE>iTOV5RwWc^dKjF9f)$4LaF!RAw>{Ms3)fJ?V
zFyYu(4#aI%2_$jgrl99T at Q+=IovFsf>-p=+3&`b4czP at -a$N@<GrUf7KQ6NX^4YHP
z>&Bq}uIms`wM|c=BfOPn%XCU;i<=+0db@dnK@t3>6IA}th%w2QPx9}9;e6i=beR{t
zla|5G!M;31Qom6W6Do}Qe=|)95fj7PdNo`k0F;L3jnFBHi^OryB at 7<!;CS341vl8B
z4k9YjA>9;ztOUYbWyy|q-~cgztf2u6-~fdzrGWGXJNL$A7n)9&Jp5~rb;nT`INBy5
zalnq7D|k<mC;>Jf1iO)*{lvdPfa0RZTt_{Jx-UAztnP0j<A&7Y=WRvXb9PJ*?7yh7
zB*k_kyW!Xv|0{k}c1gBFLhCBjy(Gw2ZQ)#Ic*tH)jNH3OcAsZ88Uv4Y`GN_fi&We=
zQ;cs>FdnFu67<>Q&kowO_f(EGO3;w90+3bpCmo~SQUM_`)HFI_eJs4=e#iE2aQ(0<
zdC36F=`zd}vkc at 23+ej4xV+78t@#wUj9;7DAFn@Mmp;(bE>zTqPa^SSZS)MRNamAp
zauldlp|yEHDNRUf-wY`CC+fQcD^?V6te8PS4heU_+zx;4^xHf|X_bx-^>bz1Yt!$m
zot|c2y~C|>^-C{AgfA-N4_k;~i-)E$W_Jn;LR?9bf|OZLp0;^|4Z&a+vS!EdOyR?v
zUk#s-_9Y95CW1!t^VE(oQJ0Pp at YN$iQGF9zAD#}Q%Ck{+4Z#OFx{1d*g_L}sqb1Ip
zpN`}xBNB$^@?iCA!Tk4k3#9?)bO%rivViGRji-Wd6ZM?H2#ibDM3ER$Q2z8nfk{ch
zNlAIuS!Z|)22et~uW&i=Bt)E(XJ8M+0OP=av0&_dkRGLUSu*6mOorV~*dz)5J#$4u
zx8~Ooy)LLboIiaM`lvpd^&I(Q-{^<09K%TWG$FzC(8%16|6mBC;`TQ>1#Ux3v)U~2
zd;t->P<gzF^=N!%l@Ej?p2(7*HPndR#*vBReed8aM&;_4zUWqL5SQb=mp{qp#LVLG
zu|p=xXRjDNXfHb~M6x!Zht<y-IWGFS#suhn*Hu0TP0Gx#Vj%p6#v_B2i1n;|wUPxW
zft<);^L>dTHv4(dC51f#snhS_(F~<2S!9S?TPa-xqXrT{6#Z+tA2mJnZAV4{-*qPL
zVL+yZzcOuav2j;v4ub#nnFDQ}j}1%G^NQt51*~;C+?;XFV%sCbupNcMg41ru1v4Qa
zZrEsCp+D3?G~y3|Qf;Qx%(f}|o<<PwO9P>?apdEvg=X|^Z524Qnz9ow0V;-wJqqZE
zxk0BO at ZGxsi~6$VBr!h?l?GcmUjapq^2SM~Fc6+$Gk+V-mL4xTVRxa_NJH}^1h0VD
zY3PTTKnhGDT(a*DWKQ?Lkf~hMKwhwMFA#+XA8=;!bN==4^#&k)>Pv6kGC&E24+E&y
zKR6_@`$U^PdD@>bsMv4}Md^|&1V=A9IQ<gfPH37j6`Q4IbC9fN#<g~Nkbtww42f)f
zJXSbUMOk6!f=xmNo`sn(mx2u<Ef(|erTWpn_4sUrmO_XI^pRAz`a)sznh>VhH>)W*
zk4iR{fHgNo4S(okzyfST2P`bC?=+%nzRiJ~F8^@;^E9JXi)mWW5A<&ZBo+4A9BF^Y
z6$%ar5gKFwp-6!I$_Ez#pcP*xEboT%t`S??szQ%wMrr!0z>l3}x(r{BiJrQWke%Cy
z1GSWE at 9_dpPHtriJEhCiq9u5c4;NldDP+zi at E%E>oWZOd(2%$lWMk}Cqe6|j=)dmr
zNWJW-5uu8oTsE-2Y})A-{ZyUHrhCTn(j-IJSW5=6@!wHY7S-`7I0nqX($RIr9YKwa
zL2Ba|eHm;Iv4{-qdlLo at -Y=NE2GhD`r1}dr^|pRtHqnSc5h}G8xDYBe<bo_ZQ!q@!
zl+Ka5^6WzaYI1$Q1c|#|Q8ZfOuOE*_Mb4tU*MVs9GNJqG$+X8`?1Zf2{z?hQmqbJz
z2VeO!nOj{W2A1wM?|`2$=>sMpeI^PrTfVQ)solcqVk$1D^p6iTddzV#a>gWUTSw8<
z`pxiW37*5pbfTX}&`C3VM(B+L{m9F{z~Z-gV+HOZGR5y0&&UvrK$thl&GdD5CU?5I
z#g9jTA1hP%Wp%Z=)N@Lg7c<b`g{}YYuJ;*bB*=1}=x~GPe|aR<{Lu|F$O+JS5o)7>
z!tK8@%~K3$)^949;2w0?VvYsEfyt$fR`vInH_6GC{KKNZJlIzn5f~z~9*`3F(;I59
z)1$I9 at KFD+Wf}#3+{=HTOvJU{As7}lh|><hMhER^M1h8(xtDvV3Rby7#R_P-xwAI-
zP;cEY7yP=Ud1j<&mby`e1NnOs6|QXaUI6iplaN%YN+cn9Y1Ii$zb#}WLhcxtnc$*P
zLScdrO`*#h%kY6Rhe8db=&fo7S=ojfs5I-u2$3$@V3XLi^qD#^JPHk`6_LSQPUn0f
zVmLx$g2$5K;$_@;X_UX0evPGR3lY~7jop<|P^tR5C5p_uxx<_Sn2yN6yu;Xh5D)kg
z3Boq>-$8-G)r|GUtVjh3hlatNkCmNGOdy9;n!P5w&|^;)aH12U7OwsGr~sr&+T0cz
zx(-;Wm7e<shHsK+bts~%%@3<ZMOF);@}Nuc?EteLE!Pzc#qg_8WNzX|c$Lr+Y?li)
zzMe5~>zq1=oav))xbdXKmt3|!$9hE7el2Zzgd<>BOHPI>E;t4ccH+s=#P+)ZR43G~
zkEUNfgj*md<NUzZ2CK*+@=gFAM7vTWHc%c~9-$^sUtbT`g06cPLjsVAMV6sZJf-B<
z?j5<h|H71=YovyqHd^_aU{mC^ml+H~MsneIxNrkQc-)v~oeJ%3poOeSYXRA7Frm`Q
z#d4y;dlj{Y+tQED(PX&lBAAVe5BFKG%#t4gt8RTmo3_8uU<V%vJmycRNvu92vi3ds
zUsA3;*xC9WS at zL_Uu`Fib!zF_8}BP at zxo~wPlG5hq^sT8N!{?yLE89m_Xn`4C6zM<
z0k{2gSYr}%e at i|wHJj$KIW$+hWpt#zC`B?gHb95x2;+Q8Ncx13WCHBjGF*0qU5=z=
zI&3L}FycL-o}gTb+6wxifzDr-%TQzm6#smeJ<TdU^;M&0Ta$M)?!s;nY2fn{R)8IJ
zn9WnxX-G!TyJ<tMgx*Ak;ML=L&e?%iQ{dWQB9bqyUnUO7zgj7Z09B!RY4Qh$58Sl3
z@VM-i?SPjL1QFYyNBm7;87whKn>V7$RMo^gCMXj3-pXigj<!M19h>gI1v-|wb>8n%
zZVWG^v1X{ks-})MM9M%ZEMl>!5f%h_iJ_hI-=FYVNG5)0%8gRi15=xRy0Vk at 8&kL0
zj5|KEGSCe3qYrY1Rt)TKO}*cO$2d=bSmCK)3+QN6Qpop#+en)!N=9s5S?2ItecQqd
zBFVxp!1Qoq1UxIZ;rmR^^?xeL8c=D1Dgjpy1*D^+W+L^IeZ9<vrsJgsZ0qG*76!ap
zz1Z^uKXZ9xhO5NK0q_2-t^;yXV9;2%YIC&Vg*LwcH(wJH=itV6LWa=ViEoYCfM$;m
z?-U-&)NV%xwF`|e+4H>?YOWVzC#{Dl#$;uJP+x#TA~s5wnqXhYi}v&FR^hdCU~dwi
zK0I-!8>}Va$>3ddSn_iu36>g>>8#_^r-$3ANyqN)lP6SH1Rn1N9dX?}6`72#<CGE8
z+Sd586Y5xw>fU=~nc;ktPwc3*2Oonx6tEDX+tlBXcGnxAp~Fe2ifTgTYYEJ at PFy&b
zLrNF8+W!Gnq>+mtHAqDzU;#^juoajB`7b0zw_Q<^uq<`D6-q$r!K~xFTF>ccw&TRz
zk0?OQmWI73V5CD#rs`0)RC&mMJmU5Z&A|7|us<~>s|<N6^hm3E=TK3TD?7dEyZt@~
z8UpTdTQ}ns(C2cyAx2hR1LN_E6Ndf*GjF<mzvOi0g0ub>hGh)`$jxYGLG*xy0wZL7
zG}`Dgx&wexEYv;L$b;40++5YOE`G5hErr%Plj+jGyPG{T+wWEp))*Yy1mvfiq(>US
z5tAeS-q^Uha=35CKu%`)v*VGGCqqL<l>{SsC$Ef|_sm{&#ayRRBXI}R6fZBFa3$5_
z^PImMFHmb(>#npfu^!o;d~=fxG5~>IMP#QZ(plVBA&rty&-57)FO|?G80xp{ev&kB
zPMGqk$nONHTKJZr4zwCG5Y~wm=}Xmx5n^dL`<no(0?g86od<Hcz}#<mg)bSA_P95G
z{s6$v36^0r{|hS%KBfc+kKrmQ2mm}<@coJYbzB3-t7GoZNLnc*7R|9dh2eMCCOu~G
zBU{4T<pfiGSUTx#+;X13;5JNe|D_rYl;?h{fC`;b*sv<N;$-?R3+oYFjd}fLyNlb~
zmRI*(X#8OP;BHr2qieu3)ZXfFRU2(?uKn^RXuLbaUOaCi=1kRwD3$ykZ3eA#V-JIs
zhk|9XXC^WX?O+1lU9}^D*;CiDe;~P2wy(2qLiUVvq6g6gmVz+M!ZjA1EXKj%zcAVy
zF`CJK{&F@#KKHL0>illZ0vuJ4B>1d$?C6-f?GQ&>V5J|}wC=t){wvGgv%O at sh940L
zA%Eb;(*><RefPaLFHDotY&O20>47Gw^;lNYUVn2ZN$foAMG0me8vVIrK?&m(Smcs*
zVb1xT_ at N}yv#lw;NQ4z*dX5RSV~2I}%1!}uX1aBMR7N>Nyq~h>GC^jTMI&A7BU8~0
zfDof4!zG3hNVt^Iu&}XWxKSB=67<{#DPHeV;HKTh-sX)9{5>`_#a|wwvny-pSQE*_
zNG-lg at VvVOuXsFv8$M5Nzq0Dt*6S|!#P5PulcT5NP9NYB9SDX`tCQ{PGB+ar(;#U}
z`&T4~f|c2iB`U+V^!tm-4PVLe$x;_{;2(4pK8YETF5)aH#1Ti>m-cWT>xkhzZ(YBw
z{dQEg{7%%y*B<)j7nrjuW+d0J7>+r|{gk?j0yiR{wrCkRV$RwJW$&u4Gd{Q`PALFb
zb3S&rrK~4tJMYw`k23n1`NQKIvi=8@^Tk at b)0C?Y&mb4cWn0?c+7?s at ON32fhq#2s
za<vOsItY4meJ;_(=8n8EO@T?>D|902QB8gQh9eqkLyvv-q?;>iIyLHNe7XLM7rV{}
z{}w2O%p1A&=bAT<!xE{qM2!b+NNfO|j)g)cC6JqZK<0U>Xr>3*<{S5f{S2i*!f@xQ
z`7=)V!;@V-lH(j&KR*ywAMAuif?kz~r5qdDgBJ)3)Z)%(!9)wTXv|}eXJp+(s9aWg
zG;OB9nQ?8D)72ZU>V&9ygd_>1$#9-Oz)KKD`9P}HuOl67oQX}-r=g at nwYt8Ba<hv-
z<^+LN>62?GYUN)_6h|cP_ at 1iddJuw=S$HzVI%v$i6?!|4#eX=eClZy?Vv#_Mz=Q?6
zcycrW0cJrK$ONn&Vis1x?3m^aoyTp(z$(OrGXP(xHF~a>RQ%X2bebLp^>5kB&>QS+
zI&LSEHY(KAwC}ThYmn0=+HTsuzRk)%(_#GZ+4l3dgsnW1%sg|X6NMN*3YP?xfxZwj
zM;?@#+;3>`o^hvy(p;RkEK8T8z3jj`X#w at F<M;O~l`51MY!?2Ie=1dGctYw=SFkm0
zwsP`x>xf~f7kU`m-)7!+G}C#<L~P<i|AL5YqC=;3kdOtSL4E^-`56?Gu%S3%xp_cV
z)smrb)gN3@^Zl6xZb^vWMM%kFq|9*Xh{Tp{X3;cz!Y^hh4NQoNtC{40Kd;Y*rXdju
zz?XEpF3j<&U73%p@)QQajF8SjaHGA{$)0V;;5r=eh5oWW^ojJ;z)Jz3QD_*<OcvXK
zAu1IP>)-kv@=_`C0R_0F3!e6CA-KJE&X9h1Duzc|yf$A$(bTySjC32J^!k`yTH!kj
zHJd=<lClZ(xS(2{==_2Rxspw>HVWDKP at NJQ-B2_*!IUU43LsLTtZz~XVh{sZL0&$n
z-{)StFkl`U6HdrHfB$m`Oo0U at 6q>c()|9b9(2IJ1;RZ7my4gJ8Oo5Q86T!8=)RdRH
ziPtuC;}ml+eXnGnCZW0;tl&dCgq({(!4&K?vQk4BkSVNtqi at gky#=26sDXn}hJhsY
z=0r8^xbgjN|0j1O5TJC_wb`@t<93=Hd_iaY^Sl967Lo!i*Hyn!a2rlS*6ORzifxtM
z6CguCf3=_kt}SF{AUmuHt5iIVzuchQI;=!3t^wL<mKK%K_ahDQz2bhQ>w|vBFnQJ^
z)iO7hm<r@!FK)qCvN)!`&@MPmM+5nGX9Q4Vpb@5Ayv7N`HureLtiC8ACmBGb1Km{L
za_#m&yX?J&oL{*S#W5XOxe>&Mk=5FUEPkNzS4^boJWE10qOw20HiA)echJ3eOABz&
zo9?8U^Bv!&<;w&CXU1T!75(%j?`ZNWfr{fu5f9g{rPMGd>(YIU|3LUzAR0+nuPOIb
zeBP%Z0n>^gw0ULek`!^ygWJm%Y at 7B@z3fT2Q_(C)-v)Qzx8kE3J`)w22+0hHE|z|Z
z6X*W7D|=uh_g3?h8h8TFq8H*EWMJNzq83Zcn8ypl6qED4l&5^X5wv<4&^Z<Xzxp$g
zvibh?6rkhC8jeZRh5TarU<o)gXc@)M`hu;i&JZt?4ZP`b;(ZM$ds)APc&H~sj1s$S
zD|s1y<Bim|8S*m4oS~l7hKkWxMU0Gy1DKal?jA(flWVWwg7iXp<A(&*rkxOn&?yv^
zFdZrFcU6t%EIhJ!EF@{y5@*nWdPg<!U9jn|x@~B+Pnet*-`6JeuAtCTyWowE+T};F
z3L0YuL-58+h+-Oj3l_kih1>i%WEpR#W)^3;A(`SkhfGa|)d$eE at K4Y${OL!bB1@*W
z>>V4akx}Fl^1KCmyhgN7bs>wk!gebSGPM<M`Xx5^;lLWk(|H1eG_Mfp5e;F!x5B>`
zf`e&xYt{JJD#Z>E6tlZLzRsXe9B#<b_2k<yjUv$L*H>G>DwI%AkwG`n1 at 8Gax!L4@
zp3<)hy_d+)(IHytdMECwXn0|-RBr2dCJXJ--yN>ec3cQ&e?Vkej0yjy0h#CFx$VyT
z9-Pf8B$kzz4UtRd>woFfquLG8&1koRm=eqpA4%Uh6`;-_ at cbTr9ZVDP`1hhe6aZ5A
zx6IETJ<LDT6Sp-_;zTxz6;T#xG7r1|6VZqusJBFx`pxT1vtw8%Fi6)>DewFvv#xPF
zg7jLk+?PqzHke#NWOa{NMa!=TH04*oq~u-kAiyF>3O&i6CuI8jSUe+{Zu&Ge8&PhA
z_zXk&p8>W~yJO=C?@Pz;YXJ0*S{7>Km&%2O at +Y4^c*FqM<%~m=2tw?FmehoDp!r8K
zs at uh{GMgVku+OGjSL%=xGLKiWe;Q5}n6*v&%q?_Zz}tLFu#e{+=W!5*#u)?27Y=_$
zv02hgUgnt`?}6ftb0A%rdtSupIZ9UohE3%%J|@;`UP(qbWGXc4v!*BFQVQ$tmALIn
z1gt6j{6 at D6%KOxywtM4}kw)KeE$=Yl3C+`60!(l2A)(}Bty-bgU|JJ6`8(hf$w_*d
zQQH?@0z@Flakr8>!yCleTXk^c06;Ko_f*X%T9_4n-&=<l^xa+A?oj=Q7#s^9woAhr
zO4~_wR_)Wjn|I0N^SX)g;HfMNveMW(f@fy|e3?yYm!T=q-rERdd2)_PUVENEgJU*;
z$*le*2`*qT-x!aD>#&Jd<it3k&~46?>!S6)R{enIhFPSEED?k&0nykX6?lVNo2t90
z`Ykyx;}EzxwTZeGJ*c=ETumxQB_N$eU6 at i3$;RYJWHmQKEKf&jTk_YE0|4}=l8yWw
zD7>n?w|-gI$1d&#3d_n=(yLK8`Jo0T{R5hMJ54}%!i2fPqjC0pMAZMxIBTT(!V%F{
z9nC3ECii5-=?qpo;>LcAr^ahB_(fNGN<Pb;8e5P%V|JI`(Sj?JKZEci0?j59ls1po
zHPO)84g=~aE<TFW-a~#7Z6)Xw^7vZUs4N&9;v~1HVj^WS$|#c>%)tVWw{Fta%QxtZ
z*e(KL!{h5jJu5q~p%2^n2N_yTR=uzkJJP-0^&nrf)&fflWzI+=a8Dbe(k8}+g9Tuy
z>TIYlu8xN9CmAUTA|X<u$!+`Oem6s$#%GZ*4}?AM3C(0|=HjmS?IH<ylzl5>^I|el
zvXY~KoHsl_uWPZ7nan-7NsFe>9$}x2EY=DyG*90{r0iVV!5V!NGJnP324x15Jtp`y
z1AzNQ`Eo>b^B=hITqn&x<)bg~$pK}S<(;Jq*iG5@&vA<bheQJXJHMGG$XM-kM`H~l
zoDfbgWumi}L?bTT%j)(E7N8=P+;%G)GWvi2jO&6!Wf>A?-P}_@(b>BpZoT7Wqxbw|
zUiNzsaR at Fr&oAP2hmVQvUD~_H-#(YBFqK)t*Ju=laC#XjI8myBH0+q6U;WpzqpEjn
z6v-FVGQ3zV=Vi0~(OJTC5;%4Fh};8oghj&@L)h49Z6Y-{xphMRFwssKzrzlWP*i>?
zS{GynZ0^QKj2VNkax1Be`C7gL$iQ=2(&MDsy}Pmb-WY#M$%xCQQ%B%e-a?{c8WIT<
z-v4<4bjPAc4|5ATJj#1e2jOo~MA--BAkN%}_sZYRc1goQQy2(Bp*N`73{K^kSnZF_
zdutMMVKcT!Y|<cTQvvWEEhww4^=oJbJS^o`r(Dm7x}n>~CclpM?k+joF%OvAe<1`f
zyI_T+ui}%L9sfKD*}@+H`DU0*tgW#A2<vNi1BT1=0E=7yZ!CjI?8m;K<^8TdBHfl~
z-_r@=D-GcnSum<mDTAo&YNw7J2#Kgq&E41b|7iLK_RQ9%+1NHGwrz7Vnb@{%XJXs7
zp4hf++qQkO-|srVV6E<3jp`~}=@Li!2k0U&^$8L#qsz|)PHD|qUNbyS-w}JJ+)c>c
zc+Uu-3Qt7si`)+Hk)tFD!6e5 at Mm@<rARSlmD|gyAT>?Yp@(NpnJ-U~x68N`nh{E7X
zn<P5nb$uB_+J2P0K)mE!gz6s{bJ>Gwh|^(K4)2uo`sY^JldcwHPg;9z#%mJ~ie5GZ
zJ2dMk86u8wWigh at t-}eTet-#ZktBr?V>5yOG#;N|yR9fS!PL^8rhxH at ZvF6bBT~<}
z=WNgBGK0Hi<*oNiz=7+jE`oGyhptSf!d7|By%dIRmQ<1H3uyd*5LFCo-E>%sm;kwS
z+W~8VY#`@&h|j)vO!(lXscq)Bk)Pb at HVN)tHe at H}2$TBh2j(a~h0Y^6{U`MUuScM{
zKCw~<hy at L$6f$RjU)Org9kNBk*qeEiHM^Ih^`M}Tk~lMM2dtrPY@k42(p412s6FzU
z+(<8#?q%y+|G_)jkDov{e$bC*97sw_CVn{aAHts+``3)qmETpUl#a+Vmp;#H{C+oB
zO2l~?B#nNy?oKG=lcTYGG=60+tGO5(>9rQ)NzB~Hl6eRx{Z&^5r{f8iGfap>H}Xdi
z4C4D>gxWTPe>66Fjb!7x4olnILynfaFa)^3cNVCWlkGlb7MW~;i$^?w*yY{1e=t|G
zYs&!T*`8P<e-y?SvaZ{~(Gxy-5>0%$Kn-7m3M^HwsyMw=LG&nX)o#D96En;SmVh=a
z5;-A6o?lk~=-C-*KBSGyzfyAZuFXUl(At3n`od9xv$0;LP~su$8Vb{algu9IVGYZd
zn``X{Cq8 at _-B@fop--woI_5D-=>C>7M at Dk$A>tl=F$YQmzm at X2Ek|WT(<8{Ibj@(Z
zFi3s|GkhlvRUuN6$_lFC`9G5g8$)#Rc0f-5oe?3EvvtR2&@pj7ayxj4j|hQhar7^Q
z6v5du7>j+B8E*5uXhFbSFL`|~hB4tk7CAm#i0O0Dh3IGiZvJR?l(_}^?_4ynKXv3!
zC$`<Ehn~1!ZQaT^c}2>dBd7su&-{^TZTp$d0a7A=%DWyyEnVZPb1H~pB&a6lBPB2!
zGMtAwO`ic087qY2#<0_Iqb~xDqsjV>%&`78{BjY1+;w1>eWSyR066#!w(aBVk54et
zb6)w60Sg<Mdk6Js*Vb-UN?vcLaJ2M`iUq2`DAaoa-kP&1^rwWTbC^9jyu(+5LyGuH
zLEotFm~SR2ye>TmsZ!@c7BP~aUUu|%7(C~nlAyTP$VhJs`(B#_OX_2#Q0f7%s$6-_
zQHTqgx#Mb}a<c2ZIX=V@s8lM>zqz9YUid7KP3YbA(98LsYgEkAGKA(!We2TKoD>-0
zp1Lc~m&E2X5klAY(GPE3r%H?O<0OSJ($`zEM?xSfy1TE2(nq)ay74Q#7xy)qz%msx
z<nA8lV+W_p(=ug&H0qE4hcp>u3coJVi6T_kV+x>9l!~DLpHN-LPn{*``Qc3_hULH!
zk`Qvyu?hH34lfX7w!uto?{vHw%7_k?2^jSiL^Dsf7iE?`nwt at khasom&4T9BjX{rc
z_3z5PKQ6z5oe5ZSB`Sz>(cA6MMnybEa8#r<aJk^AQ768=A&;aJC!CE~L^(K{jG&Q$
zX*Butu&|j=iXI`8Swb8?;fph&W`MyIlDYEXpi&Lb7$YOm-jY$!*(m<I66iE|hE(%b
zN((ZaY7p7=Qfch(F|m?xE4iIxJxR&3uEmkLwR-M`Lv}kzGG1%F&pkhpTwOWHU;rg-
za2*A*9OIYWxJckvy5CWMuSt~1e>4OU4H0*N>gq$QA6UCeQc1=?Z*D`Kh$WGsEMMw$
zWkelda+k-mWz+`3{-oU!LG-HiYWtr}#CqX3KxuD$?arE=36`4lF^h@{?0UL%B1@<O
zd*HO1VVBo2yNMHsj;5gpm{ttu<p6Wywo*%S@{-42z%*uK5Fmg^vbb!r%{;d(H2`PX
z+@q1l8el07)wO~}3a%gTG=I;RiwuF%{_o)P4%8VG`1~Rc>`_U3xo<gA@Nb=m?1ZU2
z2fN&Shxsh^6V8VM%!Pba*93t_6<(wJQh#yyota-Aqk~HC&$Ms6+abzAgQLR7gR>i=
zT5Kwqm<@hQC9Pk$Q^@!dp3%CWUlkWJArLv^wUBe7LLkrLXx)4H^Ob-anG%O;&JtOY
z3B#&&N-|5Zd2(mJ2FwDn;DX~)9$#6b)U?B8&*j|dTAdHH$f7LBh(l0A_fL<c&YW^1
z(<<Jd9v{sWWd(Xqi_rxPsi32e@Guhe-+x!>H({O*;M~)Int=M8{5SChdCBEO<&2&b
zaS90cPdf)-Kv<2r3#Q`1DT-8U^=W_R?V0?C9TBrM{XQq+m}CtE%8iJ#?vtHbW}F^h
zmi~<o1zm#$Ev<7~>2)#La!^Tvs>fX-MUB?@g5V;ME at Yc{{-;8(k_OvxCl(vW&5G_@
zFN+jT>7M|PQm=vVSZ*tdW6j|pUC5v!*t;Oi>1O$hzmKdQ$}wTMW2*C;B8Fyz5i}ZB
zhoA3_QSd=NT-p!HpNf>vrW*+k7Z!X$@*5MR5|x0VQFV?(oLO!vG<4}sc^YMo0d>wR
z)8}Pa73CKUSS-^>@izy1&e+Oxzt%1UqVIN+8!ZW`>ndoUWTStm{Qiyyyr7(<YD*(M
zGr?~KmCCv={;PM9V179rS*Da>!em5yvQk>t#fla0pUG8?2BuiOSVJi<3s?UwS at aM<
z$ThzgMSqxwpUd82y##X)X}sPXxT7*H6EwHVSV==vQ6@dQdQAuW-m}t{x7pS6idHm>
zFM}T!n0sDb=8IUdWMceUfyOMaT{OGiheWQ$BEtZCmkqYirjpJ}=KQ&T-pCah<D0Ap
z$yCN-i|rcCDK02<V1ar9sV7NQH}H&ruz7E1j<4N<HFMOq``gzDgf=;~;Tw;tq$h{G
z at c9_+LSw5%zJbw3m=Twi<^mtwBR<g3%PYIOLnJ&UlYl{P)4Sxy)n`{a`g+NK4?p|a
zCxfTjd@<R!FEOx9?9OW9oN-h51ZiSQnDqb!0siPS)|4P43o2A(Rx*5CMK|k~w=l#g
zaIuV@+)^<PW3`M|b)o05OhUo8UB_$HiZhnMPG6HL+C@;m-Hs~I+EqkjzXnms3W6*<
zs1hU7?1|>jhyWI9s6v3H38SB&udUeln1}g34aiWH6T4}lDWMTfJKf}lpX<i>hzEYZ
ze>;15IuuB)pT{1VR`U{-Y<o9s5|Y1^;JqBBXQInB6p-Z%AL9M@@-hFZX8->MGKs-z
z#XBV!b!nj-A0$0(ywrB~t(maH%oIB$6m$L}67)@WA0G%F10CoMI6JD|q$@eDgjnh5
zxvX<J)q_#fi!8sEI{6fG!TD32PW*OdXXD{-u}%Ssm~?B}aQueI)s3XYv~6{-RJyeR
zy{dL)_)sGHy~*;1;>W)qnR2^}p9JknYaRXtt at Mr0xDxbO%1c3Kh2 at PxE|0k|o1YnR
zpHGrFx}h&XJHAYF>ojN*wKB|T=moPsdHg;Jbf at wI5$X!|%X1>1;?4HM_7U;a(t%dB
z1(E})fXe!7mG?i?t=ezm5i!6AZ&#Z*QR{FWQSu{?l^ndJJrXZ)*7dJeLWPQ#)~iUp
zD+j>B+$RUAV*>PV*dbcPviU3q#DKoEmzUbW2f915XJZv(ay_ulit>p17FAtO|IBKE
z+FvnS=YL>&D-GI7KJ0G<$U%LU1xKxzkRzc*sSsNVT*@6da7kT3iUXe|XfJ=O9;Kv6
ziw51@#CiV+#JkkPMSdNA<r2A-IoCAEPD(*u<CyiEOQ%u<95=<r=ja(LQK~UHee1t;
zwo@JdkhCuRZv&DC&_P%(T%oWJF!$+BE+J}4{E)(5gh^anKWp|k84Hf-q^SiVk;>eh
z)y-_PmE)OWbqkuHORg^KCyIlR6jCMFPh<_c85}gSidVaXg$h3PSk@S21-s`*qQi_>
ztWZRU17|a3(Pxt0{=#{Z<8dMy5(OdZZ5SkvcOpW&**=_!Jvs(%|KZH)^1q!IXBL9_
zzBIu$**R%velQs+YMIwN(G=*6w)I}?7Dr|m6$LZ+d!m~wNSavf-bg_k0(U;gHUTPo
zgW1GF5~90mAuUb%zi_%CM9nD7$EqfY*s~*(zKMiEpVO@BLz5|>IC8?%@(S{&VAXr!
zJ3iCBP7Wt0H-<om+f%U_SR{b0b{`tmlj7#*+9Bn>cJGjn8Fi6&{4$;qehZe5Fpm@;
z!U#b^?EmkO0Qc+7>`9+<-CLwiSgr$AR@(k&3bSfCRgw@4VZSy^xHY*;EjczybUtko
zA#L<mB!u_=^Kmf5zml28EXFSZ+M{@|z6D6ZTA`*2HGFCnywo(r-ac2xhm69{a7J~7
zNCy}+^hiy0FQ_a^J>H)GGb$qhvE6T8<YwkxP+=~%>>d?CUhm at D)%C}weTbDf#RDHG
z-zLSpy7XAiTK0VtY}UG>sKvef?`%JCThRD|0KIrIk$x=Q8C)HZVmb9}$gVH%!Z_&K
zqIXlA!EdcPwb#E~-6H*QV1xwx#$>142f$Ce=VX4RA(gR-ZO at lLh`70~rsmZU!(egK
z0xLnR9lq>NHyr(>eRW`<tNPH~Np{flcfEBgeJ}ISVeuuRq>I|PNt!kV3Y*`s-E(-M
z_B7!kCG*#zbPNA`;vPb}(shHs>AIG>ZaSmk<pGZZyYTIDDCjNEB3zqfV8C*#h~T9)
zazD-Usn|`TFV(LE8-CE#ntXe@%MK_mi~G?MSY^7_XR)91zEYw&Fo-z#5d{ohoneg9
zMpz}y#TuA>irn_~`;Bew-Fxi9UfpwcXG{ccc8WK?F39J}ChNzzY$=k-8zMH)kUj+Z
ze%G=l$Zcw9(%~wqB7HDMB_3`JG!0o=ZTv+%TlMPH_Pcz21sg9X^TN^ibZbBVuw7G&
zxK&a&{?PcOIT?F1`}gY~t=h6I0{{Q4TbB(JIhz_HF08LL{8%%<k63T=E5}5Nfa5(R
zlgYR?NsXM*-+zDuYO?BgMhvk$J;G>j7sJu`uw}14v2i3Pw*dz^ibv?N*gUEx8x08d
z`5>d!Mb!y0OvFhGcfkZr9OE~-Uk860ba>MH3Hl=BbYmkuy+~=ZWR5S_N?y77A6+wE
z*SdZ2ly2{K?vRwruk<3=@jT<Y>+QL-?nVB^Knj8l;#jo0;td}3;^VQL8is&Eel%4i
zG-)kmyJqA~?l3YMe at q1Oj6@3aC&X0_{DU^s`u;Jj)5n at S>l?}LsunKFT++>hDJ(ZP
z_db1MCo at U&r8r38(WHtw@)7uUgN~w)shY8AD%bIs!NL||4H**?4Ft^e=Eq*f$$bdO
zXnR1<b`yLigyML>f|ijr at slH3V>U6Y5@$fmbwcQ=(-(pCaH}hH%Qqg- at jV&mutG}q
z-yZk=kI&#YjO at nPv@24Bmp!LQI`O{5oTN=vUkex at Qumu&e)rHlkQAffykx0EVtr6?
zkj at E2-_|ijdnC&K0dSf1K4uOf%2PAS5X_(&3Vk#}7nppA5L%i#tiYs at mam_M^W at W<
zgzyN9`p7(EhKya^{kZK-3`zxrdNVAChGNy^JA at aZ$I@1QXaA5cC@1Ivtpr%#2VCow
z5bXN<c4I==ck4`YlDZQGv$I8>o8y7Gu!NE{BBsJ$sFAS-RmAmgZx3Y29e`PAXYO;;
z*}GodgBj>*Vw4)b^sZ8ps at R|#@y_ua_Acl>*tWuP at T2@f%ERM94(-*uIn8FL=N-Yb
zs(mDKs>T4^iAW258qxUf5AN-v|Aa|qvp|BWAm|Y$AgwGZyaZlcU%d$`1NnbPPXi20
zeuX&G`~w4n at 44Vb$a#4d_D6>5VP**s#Ig8AQZE80{ph2Fl?I``PDp4<=J^}u9~kdD
z_4bQZJsSa)?ncBVZJQEp_aeC%T+~11a@PAdg~Bs+ih|1ku)e5{t8xKB7+t?7&c>hL
zS9uh%x&N=E3&cmJ?5m-3Xy+dlrNp<9i#to}^&|&=FW@!Y6I%^~g=XUMWD)E&zMza%
zc$p2v_gE=PoS(}3-}{OaE9l09-a}f at K#E+bVuX0O`|<k#PgQI#JQSXR37l0_)bhpe
z5vOsu5LExF1J?090(6;q-~zB`JDjG7KJhNPPR!J`PUs*jq9<oc!Aovu at O_Gg&j(uh
zD5-o*u_q at cDMYA}D@p_moJmNQ*MV>2rS2uG4+(+>oBYn}x3UaWJOm at zpb*3G1PDae
z!zL<PsAFa;=WGcm!1OLbMsaNkREEPz{{RKYhaB_e7ZE_6GkzQeWpR}LRq&Iv!Rt}7
z>tSI<2*vf40mB8Dy?mtr0hWnwKs#s0Zh9wv;F4fT#&9ZN^CYXnhItdt#7%^JNwI~3
z241&SH(4U7zVgZ3$@r{T*l+N81tn?0;BiovF`_87u<Mb*wVvs00bxRgacMXWRK~sq
z4BgE-3_@VrdsiF7(19ScT_5vAm8-cR2B%F=TuJBW10(m+xDWK86VYKUcFs5O0CnQL
zS&r>rY(k9z7qAv?UVFL2CDzT%q8!4ta7M1Y?Fh>P`;?wP*d_C!68!)6RQ3A)I*$lB
z5DcMz?U&=r7xoCPQ%k7`lCVYrye0VMrx72*Z^YOKnf}0c%+-VHlVdFjkbxa=W{MR=
zafmb_IB)vKwIC=INM at U-*qK%r{3<WucwFQ)x*;GE7FZU9ti*qbu?q?yh0-&Gg-`jx
z?LTUHeBk;TqqxLMwxqOdE6o{_97W3x)4#2llH~fvu6H56wh|IfH)wQsRy)7!95)G&
zTZxF@=rVcKg}NDfHs0!?{+arjHNN$_tjVrj3&QxT1C!S!)@fC;Yq@##{4CH at 8~ZsN
z7v~gy@aCL7;_^3u`$QotTCQQ2TTg^^Bi`~QU00^qvFo07y9TsHg>@r+;~m>+6s+%w
z3#N=&a>Jve*ybMyRf0(N2A-IdpmkXUe7ft0gu^EpHuJwY?8(eRWaEJx=%EDfaI8>b
zU=s6M7+wf!!aT-pmxnKHxrH&NRGX`RY3`^GWk3{^hrb;cD!JTHfeKLPli4l*H`Mjx
zb;F;Wb>!^Bc6)p2U6-I{{P|%&NfF2?IgU^Y=qeTU(@Ze at mS%rVbbUE_NR#m`K~TPG
zbUpr)y-HQzn5IIQ at x+O(kiMUg3ap`sNGZ9CO|u>W@*6A8`9F4(pB|z9H!QL}3r4Z#
zv2TQS&QEDa!OP-To(e`k22&(*uvf`~_PP_7jTb5X--fuAk6H0Xdkn9Q!hB>sM(78G
zbVs1x2_bq{0k3)-lvhSJkxC#2;Y`Q>Wol;Ckl*VtTqB3D)74lHK1e`G{mg)sguD^P
zCciUejG+_Xf<Z814cH@fHcIe7^Ii&cjH3b3bEbVGVdg2H%FGWT#wZt%$k^QJItH;!
z>;L7!xa}Cip#+f1IG@#q0;G><7LI6kdLufV6JWuj_q_*1`1;G?CUA1I`AOEueXMUW
z4B$1li-=QaL6)LLaZ0Wnlw!wTBz<hgy%8(Xf@&@loyNEr{CLY`|K|$l?{QjDB4+8y
zM!CaPcr{IVmZI6(e>2CWbAN7nqfb-Naydn;hu7_f0dzLGoEi<@X0 at P9XLNe*gaVY-
zh%5-**9@5aDL6M&M!VuV9VRbafpP#QV6~}^Si^VL|NF%0gC8$nm1FVJx5li>fd{NA
za)K~>ifA_`nKK~}ma#8BTFo63`DJ`ci}37I(ICRWi9nxHwq(sa2ktN&Q9e^2R4uwM
zx8`mxsL_j`A4t%7O%+iIf%I(a1_iqq`q_V>#!vOQA{E`Ci2Q3Ai~tqcjeF|Nn=nm^
zkQ^y(sqq&ClW|rBk-yGve2AnOj<s%vzbX+qG}t-WVu<A`e{_y^^5u#2W(j%<%MavJ
zL@mM}z&CpQ^p0$jerB~2(@zh!yECs3zTIM+G_Hd2uUBtwN0oi|b&<(El)Zs2(!Xbi
z7Ee~N4@`Rw^ui3mvFc%2-Z*;aW;T*kfS~}zUb9lZ_gjNN5oQ!zooIQml|1%2<=t&P
z>E&(XKnJN#e#citpdyamP8azSLa~o4k&{VnOwYx2=ki%?gt>8c%SN9s<W&=9GugYf
z`LHo8lsY%wL`_)ta6_>(<L=s=6m1|RUJxzVJ-pArxPtkIohm|!ilYyLU~`j at W=iL2
zvJtY4+|@Ub86M6o5`qMTft)g`OYu`=vZyy@1;GJ$)O(`b0~c}5Y!+fI!vO+q+8-0x
z2u4y0nHt$czaVq2ZIZOqThFENB4>w|{v6BjPEt8*``#kSnTIQXxfvTh)Ghw8w>T0g
zK_5%6KC}m at h^VmmLvRgJwJ6u|<6a*JRCdVhwwu0(?L>f1&C%kQ7UE(9dNe3a;SV`a
zJ|F!ri-a?zS8mp2GW0_$6mh_lc5 at Mto$4XL?bx*I at lWs_BBa}&4e^H;>YhHweNc at d
z5DL;zFNzA`vgxsq?on;BNqA(Q69f_(Do#CPL?`;?+L#@ZiHVfmisvFMj=x*L$US5b
zvU8X6E48c;ptHek9R1y4J>4;`mkk?7{aXca at cQKX_%%U(^5<qTq^f$sK)3;0qs~I$
zNe&VBXD(6ei^!c*^JXSkimGXJWId!AnHo&;<>(F5nW=zvRWfC>RdTffdh8?lL|&jC
zR<Dm1w0#7ct%SL7u%|^2)s~kM4e;h^I51R)<Wj~iS`t5le62~(ogLp7Q&w=6qAA<N
zMPQQs{aU}P-y=th{Kd2}jBL72)a6pvv8wzK^K@A0zxR+PfDhIiL{jF7;pR=tj_h?h
z3HT_1;Mt~~<wZN=r2^fUm{T|BZ|**80oc|p(1S@{^6-K=w>qYrCTNi$Xro^#7UZBT
zvls|V{cwt;^WL+;0r_IsrdR>7HlP^CaMp1rxs^GA3Qs1)=ra3WMM}l1iK=-|k|4yG
ziwSk56)4%;GqOzJ&x4T&-!#*yLdN`hxp&XPMM9z2IM`0s<m8*D`-JS5iWhiLLrPLm
z<FPaGIQwJFFrs%jUlVZN3fPuv-2``hQ=qTIE>fgQNMK9aPF%p`1?)0-Y(=#D9jwB(
zR$5$;YCZxZ!bENjyQS^WVSZ`X#~fpDGH5?#k@!W~dl8;+<w>kuQBP~&Frl`lNIEIG
zFxjslTeV*sV{v8yL?YKvlE7z_FRP^V(2#qKkBpMKAg*Z!Y;<crF1=u+lrF8~58a>p
zLWC)dZ8F~KNbG(H at ASm#g+i_*q3wY{O7TR&Cc?~809PwPLeTW#5w#=4Kl~!GjCpqi
zvbT-v0cJ&ivv1QkApo(glEal1P^5pgRp~b751sXXuy4nqlE at PS3Kl$b-ge*?hTi``
zLOpBaaJ|Leonn#%>NEGLpW74)ZEK^~{@&g4yGz3MQsV|ZL>)rD(({leACRukKJ8*5
zYx}=mfB0Tzd1e|bJ0Evj=6IIpuzo_|-~x+ at q75`hA|N at THR3uez!M`%L`IW~CqyQg
z#hb59i&BuY;6#;%h3Br!6oLGWV8RiSk0h3l3xR?PmF#YJe<%P<ty+Gqc;?hkcQ&t4
zpXqJqKV9FKT>(68v)Wv9I+r~^RU(!W0AWe_QnNF(P!X}l!amBbB#LJNlBqB1D$3{=
zS(Bn=ks7pTkukAlXaW51qUvmx-M$*tP|@+2Q;l|3e6)*_fiy7o=&p-NvfMfEpI-@>
zjhZ^+>6V~;NR<=?i at dp<_X~l@D0nDTR0G<l6FlyN`c<vX<}0BuVgy+*Z?4#;{GDRw
z=E8p(oZ$Ai{*7`X0`#PVJKJz{RFfR8zd!jp)*&4%?k2b<CTCVOCiL}fhoeOuy^-Z@
zWm}tK^JHyigrY|xrA)E)WpzHaFL^w?3RWuRlVl`7w-1)Li5VQ)hpEbkBR>1_vn}i$
z9|la=&8E}&oI8;bKijU+69F1WIag?kDod*{;)QYiP&8vBTk_&n(2z7qOk~n3r_`Rl
zD at svTNnsVlY5r;Un2=p<1pMWpBQn{y7DSfv$(Zbz4|Zc3N-Lg*+!@|Y%d>QeR))rQ
z0H#lx)Dk?RYjvE+55d#T1|kLQ3InBCe-W8NbsSL;X#dz(E^*IanLi$2aC;&{-BdC!
z4VH+iqu8FTg5Nx(dlwL#F<4%r9NV(?VJF<CJsQ-n3_xAfOQ<ia!Zzj-ZS3hN6?&gD
zCEWa`*G$5cxH+YZhEO9V$2-kHArE*>`ePrl0DmwfdQeC9qiuqu7Er#xek~eU^)h2t
zXVJs_u~v*`Z`z+sC|>*Oh4EnkQ%YHonp8#A7)$MJX2o)DSYf;q9O7hVYKOELyv!<1
zzgr7sDX*N>yLX;mZyio=!bOq$+~N3*i#0_}z4A`aV2KkYxQ|5wo;#Uo`)G(}$xUK7
z)S0wPsL_2qxu7O65nu}5&rexn5;Z;pDX(3x_X0mB8RNgw#zoxK0cvgEW36~V-#xU7
z1THT=laMC8CM23_zfb=;R&2+xRN23PANCoN)NutYCPDd!3YTF=VLUr!G9f9V9Y4h6
zKr0GnJH?m&@S%iq at IK=MZ)y~VxyK;Y`?>NhGVbQro<eUI6%nf**8j%>=+`y)(l&^W
zbRNJwe*Q&|RYx|dP$yYVM?!)%pRToa$hu<da_`jrVfUQ^QkOjc$p*%86mH#wu!5`g
z<r_z2uND}1HxR{_yOwU%?~)5x9w>?K<Cn2iC6ZZWn4??3en@$FbJDQLD1OAFyE!;Z
zgQ~k0*hcv!Q)8JQm`HaDy!MJg-pefzJx&Kow*%60eE74^P4L-0CG#?l>Eax>ajc!x
z=k2q7aJ$_)kJuAK26Sf~wTYGC^4mf=zVyZ4)ot=URVs%9iPdg9a6+f4u`*aZhQ;aI
z1{wVR%82?Bnm!CadQt%nFA7bhc;Qytb4W|*q24PUucW+lqKnYDA8W8;F^o?YlrdaG
zJ3fs9xLS!mEdlWasAEWMA=<-ta|Dk;8*7k6y?G8>`mucL#vhwy2o&ql(_!}>%TC}J
zaKzxP8sU$#jxKgd?N{J!-|wsfgPM*Jor4AoPH~T{2|oaHlP2{WRcFmo>b$BL<kZrQ
zh}9S`_sY<NiT87pH#-CF?PQfm4N!$xUmhRC&FyDDP+-LGjEEuQ79972Dwo-CR%S|(
z1qI$?f|mnG;e&!~zmrD7PRt3hbMCANhXhJJguM$)jfwAYWeZSY>BPP^N`Ge^q@(fA
zyufyBNWi0VdlDaw*QObgE_W>`p2FGQYMT|8{tT?3_J||<%MmfW3~>*5q4;FrEl*#x
zO#fw`5IVZJ0BT`H{kw7?@bw6$1umhv!bJ$iI5q>UudlOHwpIfbJHlDrnDM&Oc^shU
zp8|8<i-#k#68F(=sdislHT}-#6$^H)aiR>iY`DNe8c#ue0BIqs)S}T!#96T6nePcC
zTu&oct0J{dQ+ST=oOD4M%!*jM`rE4NDBGn4qLO&>I7SE`Z}Jr4JK5Be<<{!FTg%5N
zQ9tk9?`mrtV&IWa+7#h|$}p(c<*G%F%gYc?EL8y~ZnXXjZ|fsmgT^UhHW^g16YWcj
zn&ztSST5Q%IiBgyLSJ<B2Tl5S6tnPghhhk`@Xc<Bd&obB*43^}F&b@8PBrM~4z?A!
zPRIN9M=r>wSt&#TtbHhyfP-1BT7Vam;X}AjitdqJ^k?uO?}f!Ej3ygDwk2*_AT&0p
z`cMxK!qHy>E-`)%N4uHjv3Azs7IH%f#2V_TuneaxIUcnsfil8&fEc?-Cg{RHKY}JR
zas`=!DFXG8Y=);86oh&<JOhLi5S?Yd7BP<+p9>Km*OJA?J3&p3&Dtwjj$jcL0XIv9
zPUpTBBr`I at 0Iy#pIVyMfQ}(L+B(eI4>Ev*<M3y4&f5s0gT;ava!t;nm<pxJHt{nNV
z^sVweQ0H8P=Fhk-589T9x!$MshSuP$+bIi_Wu0>Oqo%+O!14~yO(Yg_Y!$gMOvZa@
z+bC;7E;QZAKj?39=|9oY1mH|!+lkaq6j>6sxATLgnb#QJkuAHO8ZsL>Lv8GflLEhj
zq=uK6&FKhoBhJn?9W8&rT|l%+=n{Nm$<?Mt<18A*Whk`0SY*!?M&g1EQ9gicVM65u
zYxOCz39a7)H3d_3Nnuq&T<^^J?oW5urrmQfn~F@<kMl@erWun4x2k~89}rUhmpXa7
z2%51dUHjK7e)$xafJ;6=FV><tYt@r5vqh<;UVd4Q<XD~7){AFEVspE3ZsKc74h9T8
z$EHBg=KH0M!KeBfKQu$Fet4#BMAkdW48??mmd`(w*#ex6tH8E3$kyAotm74(cnc?#
z{I{#8&m2muvQiwsa$JuwzK(Nhru)s0{|FqOw4k|{la8?(CvSj2^U2rT#v)_3%g&n~
zX1ya@!=eh>0!R*j1RF-Pm5-;QNfc3UaxJ>VUp6B_+Ovf$<X7rWLl>#W(irK<=J{SE
zFZnzU`&m+Nf%6V2&XVQ-R(q4%>a_wRt9zo|b6oFST+=0Q`(6rk{#^?Q(4aKiz+1zQ
z!;z at Z&YylHarC~{JSXJ3b|%=J=LjvoV-YsN6Zw-Tg8*r2{sBU5WEu#3OUAfl9H&V+
zsJq=a?5bQ>|Ame6M1p3`@~n6jT-K&A-|3^5ZcYlCcd#|G_v|v$WnY`=yjAN^ZvWnH
z(E^YC<sqtl&t34B?ZvL~{JCLx-1CSw?nhIS>jq+m1fL~(Fu7qjL7Ui;MPumF7`@lW
znkB`%``V_60UHO$!EYAyVDgWkt{O6znj+iySm4igj0j|>XJA<h at kaad;ZnkU+wm&@
zWFzQoCG6h1yiQJO-5;-so_?ssVn$8{{^%Zb_*(pP*f{LGkwJgNby|u7AMMC%Ca(%h
zXj0p;cN%eU!2r9u9bn?GoVO_%mPa$pwq@fuIs$B>E64D7tq3Ws+&H;OKsAG}{HaXD
zKUbB|-5GAM;bJc{#x!=4f?+rHH{$T(c`7a?r-nNGV=*cHD10P#0Zx~PGqg*T->C;h
zz0n~q({t8lVj6B$Gn2RpsuE$pIn4TO%vsRao^|+J+s^Jy)M>S?`I7&+|HC7Q!^g_o
zWiSxYR+J$)c$ZF&F$4R2AI<GhwD82F?*$12L<0g9fYR}Y;blWWed5s{**4Xz5x)rd
zHPE?kN+WhZ5S0G&-k1CRN$jo|ks(f*1~K-#gS4<~^ZiW5Hs<kuCe{ebp{3(Jm&{>m
zEGY9n?zQ6<6Qi|I><O-fwSqFpk#PjB%e8lOYy0Zp9UHMrsP=}85wvBnmfiF~x9M(y
zA#fQHAwDyhzyI6k+_ajK(g!BgnZ-Gf`J7$-exP&^5MP#?pIRh*-Us=*zK$`bPLN4a
z&2tOYYGYC~zR)%y%$cElLmyp3K+_D5M@XYvCpY!dzFl*R5X+`_)G`s^u~h9sLe|AE
zM>wVv_*4+Q`&|08j91(e=Cw#|`UH1#A~hnt7(vQ at cAWa}3?4gjE%rB%#)W#f_}hnM
zxg_pVOC3#7x`Z)qE|pC|LoM1?k37ji3FUoPv*gtK5HZ(2Vm9qHXB`|+lKP6rQ(k(M
zVv<1wUYlE3=4Wt_!<4GtZB+1*xsFUky#6SzX0G5aAQWQ+9rqCxw^%qQy at d^}UTuo+
zkCuj9<grZ2Sk~V?2uvcnAKtXUWPi43^pO`y&05V78*oomp)XuB+v$;CO_7lv*H*bb
zQ;HY)?0EX4(GcEk=ZDUX{bQwUM)_T<V at 166#Sp83#w%G&4rAh-7s)=@Lk$p2m@kPL
zp;*e-(r~|<oEF`6LEm#4Oj-M-Sp|vs$<SAX(eBop>z=@~&Ufbai0!Fs2x>*Ae2^wO
zh9`L>7&Z!Xd}RfEei}Phx-cEpOhO9T&r(JQybdP_od(CYiXHkfaPYsEXwL4G)a#vi
zT(wMN`!nSY7TI7q&~vH4-39{XJ$(vdH;rR;`%lP)ngTYHX15wK&&^dGYvHER>$v(Z
zz{B}Of5>VXWiji>l<PA!2?9c4afB(yOZj7lGIzMUo~y)19rXznxC>nAj&8QwwFPP_
zm9nW(O?JwzlQg)*4Bzb|beKyFMScswy}jd?>VaCMjHFFdrQS}$WnpvfWHjw*iHk%j
ztN at f`lxhotpDz77Jrh6pd#%P95jF4hySw2U5R{zsaqBnoW$RZ=p_o~i9gr)i$qnM|
z18^xA)ZxZLVbZWBS~DITb+4M=F?qCPg2U7)O?Bgl816fN<9oRF9ZPI at TPEF;Bz|03
zSMd2*7 at -W(COY!R_i6&HBF*)3RO{wu6pX=$Seh!DW_s2d)oYp$4_vV)$jvST_jc2|
zxU^@J2kC1XQYi5d@GM7ToO;bJKQ!^TWo>+ET1^@v#VBLj5r}wJ;lVGy`5T$fYLs95
zgt^`au`fBO3VbFh7)J6nesqNOqK@@Bs?K>a8SByBK^Uhw;C6_kNQxE|7h=v7t&+5R
zxS)q{(MpSMW;xE!$zgfaDf)N>^H=zUnOfq;Z64**x+EF2cO2OBGV?Q;Jud(;47D3K
z#QWzKjc5i*$ShqVg!)-U;cwLcs3 at yS(<3Y<uee!74<|@TBb~d5V at Mv*7RtmIw<f_g
zlkb<%V`|<l=^o^AJ}tuY)w8tXN3d#!W<V-(aA_c^e!7G^f09WjsUj1PiAW5S!Ayl2
zG1e5=ME@kJ1DS=<TsP>92654erMd~ofTJhY)Vc+;3Bnw7xzl=FUcU9>-}I_1-mD>;
zNv>>D^l(F-)qSf`mVbemc(=Gi(t$0CBSCnX2zom*6B}6 at KdgrH^7NOIz|BgVl~cg?
zf}cpM{M*i0@)%y`A!`Ck0RP-^s!nqv2t)*XE4{w)<TyRlg-|0&T@1erdB-$TS(F8#
z7(u^JbY`$8SE+Edwys%lv#o>W3<N5B-^6fG&cugF`_|!h|9(S&0=Pg@e7%B1a}pIi
zW*%i8H~`gYIQU7^xg+Bl-CpuwBvY>b#&&Q}7K%Hq!OXs5Lgj%KH+y{??_kh^=ruq4
zg!JBdi at F50{^h<|>2W9{s*H5%dd!$ljdoAJbw{uNQl2zh3IE|2yIoDZEwwxBe5?T8
z96;RAmE9b4-!!hkZ-4Q_TCnOk{R1a7$EH&3)?;jOIx~9q`P0M88k1JN-M402aAF;B
zvd at NO>kx-D{RColz*7P}=OC?-Y<B4_)1a3L0i%zk{CO+AKCvN3)q5p=WrRm6?e#r0
zHccg{T=)LEz<_A<MML-<6u%Cj)vLRsLS5cAB13{`IoDhet8RGS4r4(l(*|&$`1^<Z
zvbEf%LD5l-RMLeEsSEI$1)e=??DGn!`0E=;NrdK19?hm~j}Kox!Uu{q4vo5>s9G)O
z$<n;_lD~p#e{3avx29iO<h*yD=&HmSO0EKF%Nb)bD_$xWEKa{z_$QZ{Q7UUq`?Jo7
zq(O(`_k7%{(0{AB)mMGz3rO)QDQnBk8gBw$?Z>OatVWtyGm#~gmzIzH+J1AwGSmr)
z_|@ZYNqwA`5t#4mWwfl7`}VmTH1S^Db2)i=4FXEck9vVGgX%AGmI+z;<Zb?9skCHG
z5?rd6ur}6%c-#Z#4=X#oKJae)n!Ud#(_f`(HAiy|+&Fcde?8t4FngMjFSBdZ^%9)9
zmotoHFn7N$WgnDhc}U)5OyT0J#;lQcn?(Pp at saCAmd{M;uo4!0IWV0f)#6o|v6ySW
z``v{v^i6FlZFG3kB7ZSia5JZSX4-|Dcw@00GK*=NFjbb2-aZVevWGLO{AXIDAIg1*
z=U_MyLh7hGmL?P<a-;n>Ll>6^g?shLnh(bx!)zaJ^M8LG9V(`j7Q0P6T7S7e=n%Z8
z2n`swiV7QSPFeuDJ++Y3ydSkKX`y$je&2Ta at 5?mViOJ(Uqt~k)Kd-U;A*!vI3y*Gz
zClc1AH8kJjERak1+vHJ|vJw6)#u;+>J{x;lA(axoW^yNzO6u|LH!y{Ih^wqb>rz>>
zx1f8j$__yu?*Y1N$d$7AuO7f5g1ag(%O+jfEn1?9n3V8m{pDj@@Ya;;)y#WZ(un}j
zsWbUL(y+|$3ZdjR{WoSS-9o?_Y_M@(e6UTWyb}+^J1DTi#o5O|LZE8*dSN1882Jb`
zi6sPP1?u$_ at njHl9~vG_c5zkWc`}JENZjck7Y&Q*FVt1xAP)@k28_!sSD>XVOIFq*
z*tF46f|dl|51~U=r_l+14T44(Zq~q!qMVI3EFJyPs_G|ysTv|0E=V!9#tgG<vz2lw
zKZ6_gXeCd1FLyC=WjPIQ5TVB2DEr(t^7aCCk!-SQthU0A8AAaH7ry~MTKr>`(a~zI
zKttKBLfuzobk_0_v$r+BQaBi<+*c%n=G!3G04{<Fk;lOvDfjyFVSH!3G_sr7*4jBo
z6<Pp2h^m}w8@s4vp!YUj6k;kB3zl>9at2Gjws4&blkW3{2Nld62ralt%;3kRh!u}}
ziO<h~^Z6ej+6Po+joi)h8o{r1ul|$YlZ7iFQI<$L*85VtYpQ?28#h*g)JlMD$UB77
z_D1td84uuR7yd$U5M8?YD#28d$y2QxemR)BFKAAm(PgA5<hCXJX}|_29a79&yL>xF
zv^KqLrF)nJw|bJ7EkgxWyZvd#GKZ74acImMNfizN-j<~H77k=pQ4I_6Ca^pUBnsu*
zA*f#)+$3Vbw3?bGn$`$OHuqIJ{7Pd5pd5ypoORvSP4K<YSS8ZK#oNx{L`=X8!Qedv
zDcXGjo_m=Y@&AO1VUYu{KDH2Yd|`E87JyiElyjd|W)*G@yD^mDAOa+Z{vpEz^1>bh
zuExV3oO1u{>oykqmMH^?j&Zcf+ka=q6t$bRiCze=A*<z4r?9b=@Fd#4#8b;NU(cXQ
z#WQFMfA!J54cZ1ARkf~9=bYe@w0c%8GPmkA5eYOxf1cMT%D1{4U1nQ>N at vk_he~4E
zxwh+cT*g2OG|wq`K}r7_<1g<CU)L=@gND`D-{uiI9q@Rc=ERlriTJ1lXJDOTb?R2>
zm&OSD4qm at Lyw?C%1^~IR*=tr@^Ne|gB?c?769}%EkA9m$O61tre+?ouSC{L%DdvGs
z1g>?i+zW{{+07n8*6f3Urg+%g?!1;U63duT>CgNoi>yPEuiuPYm3nzu_!}dcvT{~D
zN3^qd0?t3@*CtY&g$;fwccX+W`)9cSW!L?y#lp|R?=znHJ!t*G at mjUhq=m<WrqX6@
z^wX9UvH{Dzh|y4m1v@%DfsAlz_AE+^PZ`ar6t)v1#Uwg0M&*5{);lSh(;{fY^$|BH
z5_mYcUiVgOwnH`H{a^KKrq#y^^ipJavg|;vkzV%X7`fS1Md+F1>?|jDXWBF(U6Hre
z&=#Wq6={A}m9V%4PjKCDbic;;6E-_^U_R!NHIdQ4H<L<<1ugbPV=jj_mg3zEUgjn%
z(h_NG>mS{%6lDbzIkc6K#68<+g9mj@w=q?F_)I#ac_Y-iHz)vu?&t<il(fgUWWz7?
zsQh`M`Mi*|X>9DMY4UKJz4~q4DGr?(;`dl)ZoE_G{q!W|Bw=l(b-miwA|$eYL|WLQ
ze|(SC%e{t18ACYi)Y=zZ{MD74=3UhF#bmRB&h)}Hvt0T8Vx;ngg1)It=Sl0W4|J|4
zYnQ$3>Xo0TvMwkBkq+-=!tejcmAxeNgy8#CWx?b9sKc)`4S7|n=i{uk-h4nAki)Ns
z?&jqXu$XEUcY;GzWJ;&K!t$HyfDJ<$Y3xwFljep+J?m&B@u}7ORLKTGEfq%aGR(rA
z#!VF+!ZN>NJH<wyH6|!9>JDD4&zE%ktFC_2(R}LmqDiG@?jU48%)}a=w}h0l+wR3T
z!{<&nuQU?2Dpp{J-zEU|#me7s@{bM?^cQF*x2e2_(v{ST1M)?RX83kz7Yc%l1K@=h
z-f)fuVasZk=id5gF*@|xeZD%f-pbkyK^p>|#w8-&h=iB$e>XR%wvjiR03Q0%TYuFe
zQ_Vzuk6`+8vJnT;10W5W;PM`!do41FvnNs-yZ&yr2yq!uLatw&M*Plw<l8$@pd+ag
z)Vq7{4?ev>3Vu@)yl|nnF!Bvlhg*DgWXl&=p60Ey-!vxB8k;cne?15BiQ+KJM=7iV
z5-ufT-v{W|;~&O5L*_|vNlpSe`o&{B(pseL-oS5&pLbjSCEahJ#)YY75g+xXYS?ZL
zz>V1gr1<PWXg5<Rh&Gj-RJ`X}R~l8LM`%O^FS7ZC(=T+}%HwM+f3pTBY_Hpc3qH92
zh%?)4JQ8Ad`qEdLVnljX{IH<_<K5yGQODiN;LCi6<NBR|*c)QWzfW;G^WbT#vjDy_
z=sz`a9E&q)$QD2Y@>`xutGGCuxk$c2Jasy?1$@s;_#FdaZB(%Lzi3ZSihND8rUFg*
zBE3O2V{4_gwnhDz>-J+>KHkb|yG4AV&OmTybA`n?PRW|Bj?7E2C(dD7rc%0JX%n4B
zmS<*k$7~rQ^bAB!l{`}Nug>untmOK-s^6^k<7F`607mU^PJtJ+H3T{XEYa)5nBUVp
z57*7irDD9&T*W;(Fc%sq-NRc8g$BaD--?I+gFG$oQDZ0A*q5fQ$DmmTY1p9<{J&%P
zW2gL##D{&d+cvMkk}riCu@;-1yAaR$u^}!2mKZP>Q8liYz!&PS1h_6L5GgFoA;GcK
zeR53wN&?S{BKfJuKa66o_v4-{;-(xdCj<C<NY>4zjW=nRUSFGvLHtz*BT(}~pZvPS
z$NW$emck=EM7!xPB1(O8ZFU(xPkit1_o|*t-reGfG4 at xUxcT-;g0SkdaKe6oyF`l1
znMIzAZ at kVNf_Nc!p3K4tjiM9Ff8f~i#jD^L3rVh6c5&+nT={$G?41Fa$`9sNY3L~)
z7w2qQN|o3?$s(`yz2S6OP)+?6 at WFg3mF+tb9GM*&_uGRA8kD9T(|TL$0n5H~N<zWX
zv_VVeT7#VY8DWZ3GM#XugX#ND at ERrE$tskq?r{}qu9yP8on)Q?`3x9!v?MfH5Ejy&
zdFS=%LVE3z5eA={uv3pS-EW#8(wj;tQh5-Dc&}k^UHN@94hgStYgrK37Azj80TrDw
zYdvkT5jYWNtr{8pp$!p$5$e|5$G<-Ivcc*zXp^Qpa%cl;6&e#{>koV1{6Q|QrwwU+
z9)lj{W>D_S01kXMe=b=pb at 0jnPkCn^dJEK6bUx2HkCm7#Pp1kL#Z&CCbLURMVZI^g
zI6NNO5m)AmwF0*-WsZ{^gb-<w&qxl;hgAjyQ4V;u&!J&7;}M+t%=eg${t+6uC#AtI
zFp~*rj&_Yb;RdTK>H;izzaq)f+x2GDS?7IXlYkw%z&miJsj(W$CdSmrx;QN0`gwyc
z(DrVA-1q9|^ESvn)94_ at 4untUdwpI==e*3Xu}F8_JKQ;GozS2>L83xpKxD-R!1CLg
z8m7jAAVQtk)=Tfsk<dblC*70SqQ;vOvJd)v at Gkfnrn0-xk6S~;gf_@IxH*H>qIc@>
zNaT8!;M!{M^9iHMU;tik(w|6vv^LKQdO0&yUpJe at 1EnG7(u~|OM<IHCI?#k`)=hzm
zxXBa)t&%2hDn3T0>SoQ-A~=0vuTP9sTT^Kkx%W!~_8xzHgk!sR-M2<Vwicz(#mGub
zy>TdMhS_~wH;VbL>!vFJq#0E&e)aj)kIrKhm{>o(YVDK-GT&%+)B_vYre2afKS=zX
zNma*XMjC;euHf;`e~-*x-QV;itZbaeCmN6cG`dq6p#FSGJ77uxZ3WmA&wBI5!*dXt
z<%4+D9~x=KnE6Use~8!QHg1^jC(_)o_HtPz`E;bvj5wS~2wYl3EilLq#nnf1>DG_X
z at p(jB+f6Ds9#aXu)~-kx at 2P|vTc^sNH<>c$dQuvZu|vkN>_H=%G4vv`ZoasT-^OS0
z8FJN>{@r-#6zsUycQachs5mlbgZ9vd-O%+2rCGgNhU?-40lSfbz=x=;SD)>E(hTIx
zF-AOc)2pQ2(Um at SOxf2lbcX=35wiup0sg}c>QL7j3qDMJpRKAF!*V0NgJm{JQ)9GM
zT8-BH7+jj%kngM#FPDy1pRnNX!wy$aAI(IiMY6ybVF25E at r$hcui3XW*4HS|AmXos
zKh5<rqAL2$;CvUYC;dRFfQurHj5qQalD1FB0I`{%3Exf{-9A<{;8{+Mq<YtPW))ol
z=S)C){L`$z-S(8t&KS|#F0;K&wF%%t+3ayws^!yy%MxrNdV;O!F9=3NFOxd#m`>va
z5=X}2&Cr%@^(O{#Vl83xL8`wFqLu(F>1v6pHuF7&mamtPy}$8+`ixH-vFtSEQJa-K
z*8>2JRYUBHFQ`GhKSp#oR43_pa8}cVS-gk8u+o3ebHu<$f5ax}X<7sBdzi`Vx#R~g
zSmPVk!yO!qC*o$i1gKrMV8$ZbhUHb#11`tLJ{zkb*DjXVL$|_<%W!#^-ZCHSj6T)p
zvZ$gip6dq0oN;gf=ZLhpg(@Fy;@vFh-yPFj?$Zs{(oHah(?7Pc7~zaLgaep<BHc#U
zp}g_m^s5+IUyT~8!6 at Ap3w_f;OO-XxC5#_G%(_iETK$L;<qkXy5r4KkQ-Z?qf~FL0
z?Iy+0dkuB<kIwDDAmQPq$|Lm$<5}t~nQY&dznpT1Hg??`k_Hg9Le1OQ;*bBW2?YtY
z$OjUX-F+z@^tCqMTu(QSKqq$&LsuH2ap5%387DaK1z@bE<ZZKGDdLjcBYpeiRcYna
z?KM!tDuJ$mxWF8-V|}LeZn0*7fBO(%ZfREgP*aUrr-li!olLo$(YK|tl?X!QH}8d!
zXezH2NeO^60Iv9g&L<L5=+gV;WwDKi69jXN;)>`rLMYqh%;@AU{Dj$MYwOW at G-F+o
z!Y?DE10@{L>m>eZ3qOS#G^?+`wEeC at gmLKByQ-h)GA;Mn^9!R7jqwSE5*yZNXd_tv
zhEhjep6Mjl?BRRH5kGD(+n9tWfl;kXZTz`yn`M&Ve-$zip+_?}$V}*!@>wZC33SEn
zjGE}S{YqdXx7o3{deiykM)P(1WrdFDv3z_%X<wT8o%;_lneET>%|3|+9Bs%`9?Tzb
zE;XhI<_i#gJzzA)&d7AlMaOx4vqcs}`hT-q;Dhu#`a485JmBq%Jx7@ry^*WkOmN!*
zDWKP_iUMt93+^!zLjxPvo82s5=aKsxAq^tKXy?ICErb=QBmvQ9wc(OdHTWe-BJyI}
zJcpLkj=bW~F`k#g>drf~$pl<|pW{hZt$jjtYmihfObr;^pO!~dE;1osm0Z})pPH16
zv_|cOo@$g$$2HoqQPI#7Um94Q3=+PtNTypQ+-gqO>&!@0hNID2E|R*`DU!u-#`o&q
z_ZWE8rHc+WJqL1sD=}eS?p!)wHpr)6zUD=~?6<GcQo>bx^RAo`m_cG+KSuSf*$GTW
z5$laYpjPw3)xp}3!h`5cXywF at sa-H~v(N^BfZz~+iwY?*lBC-&k<dg23k?&tgWZ=Z
zT!5|W=yAZdfj{^Jd`9_s1|?jrmD+COAfi^7PVf1J;5YdtYVC0!WjoLt=x*ztmV6$w
z4^pulvG|%CJMy%u?_NnP9RDfN0Q<P*O%);~pgqn}V64-Tl2tdlyZhrs-Jev@H-fF%
z;swg>+;I>XI82}5Vay+$&XHr9eiqoEjEzoFV#A>1`z5K-8d%o6jLhlt<P~j2Q?N%a
zFY@9;krBKb+zBw3G&2Q4+#%%p9!#FK#Ti%`ddMd<Zh{J2%HTLRWw`bo2IxLNmqYAC
zr$IVIo+fVE#9VKbdt7ccXeiG3tu)WcAoSZhl46W<eJ|(QqKaBii_Z*$JSIq>4_;-D
zesf*;c+X{fuxJYRJ=l{!kwpyMrw0a7q$_6q^q(@{frYls$G&pOt#!*Wu+ at 7A_+IIC
z9warsN4ZcsGj|%QDWbayM;*&1!&R2}*tH>G`IbcT)SQCGJ;6OjOuVF1Oi|%hIj)uu
z`;kg;QBjH^J$NAeeCjJ4|6fU0;?MN|$5CPKvxv%OW`yQyQ8J^<HA6A#N7Ce|m^)X@
za;|dc&O~91vc6f4IU+~Ny{L>#6uEMI<vV_(=O6HSzaOvX@p^pTkN4yKvgtEz%M9QT
z=PU&IHNK{(O?mrmW{Qo1YItj9kfw?|WTu&9cNew6!EMb;+^3hAH1=43>)1y4IMY at _
z0OY^^j)b!C|D_;+-w<}`YK`Vt!xL6LnvayhXe3wBoC?@=BjD5u?4_Y<zEj|Z%B1D5
zH5RBjx99cDY4oOJL_-D^Og7!^Svv8UY#x?GZk7xgoMj#2`yZ_K+FE7462;R4tmp3Q
z7!k$l3vSEAEA>F+)2CtFzjlLPvIDd^uK=7bULtis72nT9{8r~nCt};AS$F5MI14Hn
zh9|57PP(g~l>w;@8u4->-nf}CJWoUW_^<J*eXpC%n=N@-l-~y7Y=6RqyWCf;KVWAU
zp#t3aY)e!p6)Y<9d$ivoAO_%LDci9TOiqrtv5YROl%Goc;e~x*ZlI!)1zX>Y?9qF)
z*{Gnigy0T|?K<tiJBcY~HCZuU8dU$ggwB3$|3Ym65p-6{0{H0uOyjmQGUVVLVz`_c
zjzYeaabMP*tzOb)o=k;UJK=PXJ7 at NpbJ<T7 at 0~HS<qfo+ft8<f^SLAS3drg&#G`l{
z-)${ETQ5u&BZmF^#QId6zJbh)WscD;*QvP)Ovj(86lb~P!!bO%Td at mtNOdq0sUKA5
z1TX<bpu*a`vNLTIj)Vm6`a%tcZtEdl(sB8%MeBv(#?_J18 at O?n?HK{2k@~6H&(a0a
zlFjH?;D`*KA00~Q6)gm4ew<co4bl)t)&x;b#=g9sc5k=L^;LzsYD$8I3fS5T-u6(I
zY&n)dRDJmL+}F*(vS~|46ka0@1QIN{Q4<{e7H#55gTN5zv&Td$=H1E=_ts)u*AYuU
zegiV<PGvMkw;4zPJmfX>u`x3NJ89Wz9#@y*gyg=oyj~e`Gt3rHcq#j>^EG!u#e;la
zpi_eerl~;Vg|-Tqi*sq~cltwBg6Yh-%F5om+d3-u9uB>BL=2aBpjQ{&3C^1lt)cyc
z6%sCdUh!k8i>Al`C8^^Pilvm?FMxjtkrz__X=PqDoHbea7og-5oY!a4Lc}i$^_)9g
z{peVNOs*x0iyX1=*L~KP2jJqO7TI;Tarp+h4n?DXatB<GJW6?6`qT*-SqwV^?&1lF
z+GN?5!2#W|C^<jHQUT@oN}q>CRQ8U6gMIxQ*Tj{sBl=p~#nA;3bA^~pNzKXU4EEB!
ztgseoDK4Hpop=y;lN=xIFQJ)3x0gSZh_dRLXvae*v1KkRe?Gl2F8oYbm=#~%awEpL
zU*orISC>vdkOtFwD^2&%NDI}fV}E==v`s(^BniTPRlSoLzur%g%ji3`j at T;|_}sv;
zB%iP=<z!<F|Lm28Br+Q=_SS%t`(X2DbBJ1hZNptO^2))6^IEw=W$#zEEl?;iv$h=U
ztK=e4hwKkEhjo-`k)5rUUWp;O#Fb%fdeR75kY8;6YLhbX0EuebhujB&84ntacM^W4
zNh`U<2wKx4&HGf!%&>iGQZ(hdKhc{vS?2Nag9QX4C&kf)P$9*c%T$uXeg8qmQv&#x
zJ9p1;1ejsfS+u%uAXRnDmlcJkg^*LV|26o>vHx3wKoW_2P_3k3hC<0fD7(Y>z8}pF
z<7RJ0i4(1W!Fu%@LiE;0MUEF2zxMojvi1)EvuyJf0N4hoRi0Bhh at Jg-J^OdhmVBcO
zNu3@(;jKSoROl}q%qG?&P${D$Q-0436ajk}626@JUjNcrA?D419z_#0RadnlM?Fkc
zy1#YGPhO&?x0;sw3RrY<dgn-7>HB?Mb)Ix3Omd(49&b{NJnAJp3_pLM919u6s=WH{
z-J#?vSjiS~8&flz*U#Bs0bq;$<y$!+&@*-^-(Vq&ukNI3>kDq{p1*6|S$3~_*I2js
z=Xy<ymr3*a(N{QeBIM5+k&OV8bor#<wufX$MH7i(r3H7Dv%v3pql1BuIeOLi_9$oz
z8eudY{~+%S$bhp8r+F;hjq<Pew|_q0*TJ%#f0C-0NW6$ozIukK#DGt@<F^UbSz56r
zqa{Awr$v0!9rh)ULLaPmZMnS4ahCt}7>>uKxG+P{D81Oxoa`~l%JfFf`IbU{swIA|
zUttJ(I*wH7t4#^wfX@|Tlxc6zY?KXy3sbp({gOOd{<ufMHg@#fQ3_b97~w at 9SGjcG
zNJ0HuI+3_z)`M7Me9|dIYCOl1^-NnPq0^R!pTjHy=ikxSB0v_A`yK~#D3!@o+6GnS
z<t_@bq7RtVgpx4!r8^B;uMELp0g(GkNObNYxufX|H?;EHq3Cv;NM3m>=@ZBd0fjaj
zmdoUUv486ld;)A;60%_Bi at hzfaXDEt4+`AiZG^#*CS7W$tA?(a+t&r{1;o*g+mXA*
zrt>_la$bZ!8~-s8O$Kp_GH9u~=OgQzmqbu={SvDd6C3vACKPNeEH`_jI!eH-o3m^X
zN*CFxymxx+=3WZq&~mgvAnr}jHm#4%H}Xj6Os0Bjf?L-XvtupzuLy?Zxwmad%X7YM
zjqw-1g;GD%Dt^!N2tCpF)U8Im)@t8`H#8zIALDaqq5O~5W~s|(9rfEW^>PQCIxrO9
z-k3yN-T%^%v{oVnM5xl{cP3+nZA1fw|2WwR`NDQLl$*jsp at m#txqdE%>9L6;Cv?I<
zbKhXJXYz*yd8?rEF*I*CwVBf1%-FrWL*-C0XZ66jl|QfFiKg0X1V+W#{BWB!gA!7c
zFt=j#%JqTVz!r7)#|TTN5$Gos-DpA&Z0npZCmRXZ|5l*hH7vvICtCVWu;<Q#Eb_Bn
zRfJL0n-cbx&i5$&bHMcPFqJ*x>?MpV?CmZ(A%RL0wM_nlBw2HoOX77ZhaT<sm=O|i
zd@mNIqz>9)o%PWay$~G9P{^q{O83a3j3mJM5p5a3A?cy+BwqvEEK1e(m(%k5DX(CC
z!26ONMwuqFN=cvIQ(<Z<4^Wyx(tT1i5bbiIQ0r%$pQzlHV=?Z28pVz;B0O#MJeifI
zBM~LW+*RsKuja9fy2?(5Vl<|@nWeI}`xW6if|1rm&aW*lm^xS|mSFsOdQX?Gqq!AD
zddMjb^V#VyyVQbi)E~8G{`Vzjd3E<Ni+d<o-);=5h&2Rq;XdB}gEbUqZpUE`>-osa
zaax-q!=Bc6CJb+<?m5!4mQ?qUKTuCjf%PUiJa`ptCOrC_^LP6a^DOxBXF1%-6g8bc
z+*fW(ibCB;AG&JdTbgN*L(5X!CeSak(IzAzJ3OQV#U!TdE46$n{&2V>y#K11nWRON
z#9x6NQx>VJ3M$L2viN}DmF=LugBwFBxAV9yL{_O{fU&D>>!?-KUO<m<E`504Tb279
z2_8)ns~cGytzn%al$U@&l`cC^77>5VG|JG$YKW)#_A_keCb7HW8SfK|EtVi$Udi28
zX6i2BJ&U`YMVqKuo+f*)0fRZ)4gCyL({wsr+F}#3X1rsJE7dt57G|Z(!-d5Kv>6q7
Gjqrc_5zfE>

literal 0
HcmV?d00001

diff --git a/docs/sponsors.html b/docs/sponsors.html
index 321dad7..7ab5bd6 100644
--- a/docs/sponsors.html
+++ b/docs/sponsors.html
@@ -2,46 +2,145 @@
 
 <h2>Sponsors</h2>
 
-<p>Throughout its history, the Buildroot project has been sponsored by
-various companies, that we would like to thank below:</p>
-
-<ul>
-
-  <li><a href="http://www.mind.be">Mind</a>, for sponsoring the dinner
-  of the FOSDEM 2014 Developers meeting in Brussels, Belgium. Mind
-  (www.mind.be) is the Embedded Software division of Essensium, which
-  provides consultancy and services specifically in the field of Linux
-  and Open Source SW for Embedded Systems.</li>
+<h3>Current sponsors</h3>
 
-  <li><a href="http://www.google.com">Google</a>, for providing all
-  the logistics for the FOSDEM 2013 and FOSDEM 2014 Developer Days in
-  Brussels, Belgium.</li>
+<div class="container">
+  <div class="row-fluid">
+    <div class="span12 sponsor-main">
+      <div class="row-fluid">
+	<div class="span4">
+	  <a href="http://mind.be">
+	    <img src="images/mind-logo.png"/>
+	  </a>
+	</div>
+	<div class="span8">
+	  <p><a href="http://www.mind.be">Mind</a> is the Embedded
+	  Software division of Essensium, which provides consultancy
+	  and services specifically in the field of Linux and Open
+	    Source SW for Embedded Systems.</p>
 
-  <li><a href="http://www.imgtec.com/">Imagination Technologies</a>,
-  for sponsoring the meeting room and dinner of the ELCE 2013
-  Developer Days in Edinburgh, UK.</li>
+	  <p>Mind is sponsoring
+	  the <a href="http://elinux.org/Buildroot:DeveloperDaysELCE2014">Buildroot
+	  Developers Meeting</a> colocated with the Embedded Linux
+	  Conference Europe, taking place on October 10-11 2014 in
+	  D?sseldorf, Germany. Mind is helping with the logistics of
+	  the meeting room, as well as the Saturday dinner for the
+	  participants.</p>
+	</div>
+      </div>
+    </div>
+  </div>
+</div>
 
-  <li><a href="http://circuitco.com/">CircuitCo</a>, for sponsoring
-  several development boards for the Google Summer of Code 2013
-  project on Buildroot.</li>
+<h3>Past sponsors</h3>
 
-  <li><a href="http://boundarydevices.com/">BoundaryDevices</a>, for
-  sponsoring an i.MX6 development board for the Google Summer of Code
-  2013 project on Buildroot.</li>
-
-  <li><a href="http://www.fluendo.com/">Fluendo</a>, for sponsoring
-  the meeting room for the ELCE 2012 Developer Days in Barcelona
-  Spain.</li>
-
-  <li><a href="http://www.synopsys.com">Synopsys</a>, for sponsoring
-  the dinner for the ELCE 2012 Developer Days in Barcelona,
-  Spain.</li>
+<p>Throughout its history, the Buildroot project has been sponsored by
+  various companies, that we would like to thank below.</p>
 
-  <li><a href="http://www.calao-systems.com/">Calao Systems</a>
-  and <a href="http://free-electrons.com/">Free Electrons</a> for
-  providing a meeting room and offering lunch for the ELCE 2009
-  Developer Days in Grenoble, France.</li>
+<div class="container">
+  <div class="row-fluid">
+    <div class="span4 sponsor">
+      <div class="sponsor-description">
+	<a href="http://www.mind.be">
+	  <img src="images/mind-logo.png" alt="Mind" title="Mind"/>
+	</a><br/>
+	<a href="http://www.mind.be">Mind</a> sponsored the dinner of
+	the FOSDEM 2014 Developers Meeting.
+      </div>
+    </div>
+    <div class="span4 sponsor">
+      <div class="sponsor-description">
+	<a href="http://www.google.com">
+	  <img src="images/google-logo.png" alt="Google" title="Google"/>
+	</a>
+	<br/>
+	<a href="http://www.google.com">Google</a> provided the
+	logistics for the FOSDEM 2013 and FOSDEM 2014 Developer Days in
+	Brussels, Belgium.
+      </div>
+    </div>
+    <div class="span4 sponsor">
+      <div class="sponsor-description">
+	<a href="http://www.imgtec.com/">
+	  <img src="images/imgtec-logo.png" alt="Imagination Technologies" title="Imagination Technologies"/>
+	</a>
+	<br/>
+	<a href="http://www.imgtec.com/">Imagination Technologies</a>
+	  sponsored the meeting room and dinner of the ELCE 2013
+	Developer Days in Edinburgh, UK.
+      </div>
+    </div>
+  </div>
 
-</ul>
+  <div class="row-fluid" style="margin-top: 1em;">
+    <div class="span4 sponsor">
+      <div class="sponsor-description">
+	<a href="http://circuitco.com/">
+	  <img src="images/circuitco-logo.png" alt="CircuitCo" title="CircuitCo"/>
+	</a>
+	<br/>
+	<a href="http://circuitco.com/">CircuitCo</a> sponsored
+	  several development boards for the Google Summer of Code
+	  2013 project on Buildroot.
+      </div>
+    </div>
+    <div class="span4 sponsor">
+      <div class="sponsor-description">
+	<a href="http://boundarydevices.com/">
+	  <img src="images/boundary-devices-logo.png" alt="Boundary Devices" title="Boundary Devices"/>
+	</a>
+	<br/>
+	<a href="http://boundarydevices.com/">BoundaryDevices</a>
+	sponsored an i.MX6 development board for the Google Summer of
+	Code 2013 project on Buildroot.
+      </div>
+    </div>
+    <div class="span4 sponsor">
+      <div class="sponsor-description">
+	<a href="http://www.fluendo.com/">
+	  <img src="images/fluendo-logo.png" alt="Fluendo" title="Fluendo"/>
+	</a>
+	<br/>
+	<a href="http://www.fluendo.com/">Fluendo</a> sponsored the
+	meeting room for the ELCE 2012 Developer Days in Barcelona
+	Spain.
+      </div>
+    </div>
+  </div>
+  <div class="row-fluid" style="margin-top: 1em;">
+    <div class="span4 sponsor">
+      <div class="sponsor-description">
+	<a href="http://www.synopsys.com">
+	  <img src="images/synopsys-logo.png" alt="Synopsys" title="Synopsys"/>
+	</a>
+	<br/>
+	<a href="http://www.synopsys.com">Synopsys</a> sponsored the
+	  dinner for the ELCE 2012 Developer Days in Barcelona, Spain.
+      </div>
+    </div>
+    <div class="span4 sponsor">
+      <div class="sponsor-description">
+	<a href="http://www.calao-systems.com/">
+	  <img src="images/calao-logo.png"/ alt="Calao Systems" title="Calao Systems">
+	</a>
+	<br/>
+	<a href="http://www.calao-systems.com/">Calao Systems</a>
+	provided a a meeting room for the ELCE 2009 Developer Days
+	in Grenoble, France.
+      </div>
+    </div>
+    <div class="span4 sponsor">
+      <div class="sponsor-description">
+	<a href="http://www.free-electrons.com">
+	  <img src="images/free-electrons-logo.png" alt="Free Electrons" title="Free Electrons"/>
+	</a>
+	<br/>
+	<a href="http://www.free-electrons.com">Free Electrons</a>
+	sponsored the lunch for the ELCE 2009 Developer Days in
+	Grenoble, France.
+      </div>
+    </div>
+  </div>
+</div>
 
 <!--#include file="footer.html" -->
-- 
2.0.0

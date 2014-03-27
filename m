From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 28 Mar 2014 00:28:31 +0100
Subject: [Buildroot] [PATCH] website: Add a Google+ presence
Message-ID: <1395962911-309-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Since we use Google+ to share our news, this add a logo on the menu bar,
which links to the Buildroot profile.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 docs/header.html      |   5 +++++
 docs/images/gplus.png | Bin 0 -> 4760 bytes
 2 files changed, 5 insertions(+)
 create mode 100644 docs/images/gplus.png

diff --git a/docs/header.html b/docs/header.html
index f64869f..4823488 100644
--- a/docs/header.html
+++ b/docs/header.html
@@ -16,6 +16,10 @@
       .button_column{
         width: 430px;
       }
+      .gplus {
+        float:right;
+        margin: 10px 0 0;
+      }
     </style>
 
     <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
@@ -43,6 +47,7 @@
               <li><a href="/contribute.html">Contribute</a></li>
               <li><a href="/sponsors.html">Sponsors</a></li>
             </ul>
+            <a class="gplus" href="https://plus.google.com/communities/105232314127123366079"><img src="images/gplus.png" height="28" width="28"></a>
           </div><!--/.nav-collapse -->
         </div>
       </div>
diff --git a/docs/images/gplus.png b/docs/images/gplus.png
new file mode 100644
index 0000000000000000000000000000000000000000..0ec57bbe26a6f62fd40a78c8f90d877e3ec3a643
GIT binary patch
literal 4760
zcmV;J5 at +p+P)<h;3K|Lk000e1NJLTq000~S000~a1^@s6at+^<000U>X+uL$Nkc;*
zP;zf(X>4Tx07wm;mUmQB*%pV-y*Itk5+Wca^cs2zAksTX6$DX<Nq|rShJ+?|L<L3^
z5h+$=RKNj8hazJ|6bplbV%G`s5KzX!QA9=M-HdAq@2xfS-kSZ#S>M^`x7XQc?|s+0
z08spb1j2M!0f022SQPH-!CVp(%f$Br7!UytSOLJ{W at ZFO_(THK{JlMynW#v{v-a*T
zfMmPdEWc1DbJqWVks>!kBnAKqMb$PuekK>?0+ds;#ThdH1j_W4DKdsJG8Ul;qO2n0
z#IJ1jr{*iW$(WZW<e?f_&KbNko{YOt-kK%hql^ThT$m-`XQO-vWxZ5MngHeZDAUvU
zoJ;^P6q#Sl=O&?Si84hL8SaVl0ssh<#5ufj4vYCYXr2Igrf1}e1c^yvrV-beY31n1
zX8Q57Q~6>sE0n`c;fQ!l&-AnmjxZO1uWyz`0VP>&nP`#itsL#`S=Q!g`M=rU9)45(
zJ;-|dRq-b5&z?byo>|{)?5r=n76A4nTALlSzLiw~v~31J<>9PP?;rs31pu_(obw)r
zY+jPY;tVGXi|p)da{- at gE-UCa`=5eu%D;v=_nFJ?`&K)q7e9d`Nfk3?MdhZarb|T3
z%nS~f&t(1g5dY)AIcd$w!z`Siz!&j_=v7hZlnI21XuE|xfmo0(WD10T)!}~_HYW!e
zew}L+XmwuzeT6wtxJd`dZ#@7*BLgIEKY9Xv>st^p3dp{^Xswa2bB{85{^$B13tWnB
z;Y>jyQ|9&zk7RNsqAVGs--K+z0uqo1bf5|}fi5rtEMN^BfHQCd-XH*kfJhJnmIE$G
z0%<@5vOzxB0181d*a3EfYH$G5fqKvcPJ%XY23!PJzzuK<41h;K3WmW;Fah3yX$XSw
z5EY_9s*o0>51B&N5F1(uc|$=^I1~fLLy3?Ol0f;;Ca4%HgQ}rJP(Ab`bQ-z{U4#0d
z2hboi2K at njgb|nm(_szR0JebHusa+GN5aeCM0gdP2N%HG;Yzp`J`T6S7vUT504#-H
z!jlL<$Or?`Mpy_N at kBz9SR?@vA#0H$qyni$nvf2p8@Y{0k#Xb$28W?xm>3qu8RLgp
zjNxKdVb)?wFx8l2m{v>|<~C*!GlBVnrDD~wrdTJeKXwT=5u1%I#8zOBU|X=4u>;s)
z>^mF|$G{ol9B_WP7+f-LHLe7=57&&lfa}8z;U at 8Tyei%l?}87(bMRt(A-)QK9Dg3)
zj~~XrCy)tR1Z#p1A(kK{Y$Q|=8VKhI{e%(1G*N-5Pjn)N5P8I0VkxnX*g?EW941ba
z6iJ387g8iCnY4jaNopcpCOsy-A(P2EWJhusSwLP-t|XrzUnLKcKTwn?CKOLf97RIe
zPB}`sKzTrUL#0v;sBY9)s+hW+T2H-1eM)^VN0T#`^Oxhvt&^*fYnAJldnHel*Ozyf
zUoM{~Um<@={-*r60#U(0!Bc^wuvVc);k3d%g-J!4qLpHZVwz%!VuRu}#Ze`^l7W)9
z5>Kf>>9Eozr6C$Z)1`URxU@~QI@)F0FdauXr2Es8>BaOP=)Lp_WhG@><tXJG<r?L)
z%2EcxFktvIQW>R;lZ?BJkMlI<xzFRz+cvLhUjMu)mH8@eDtwh9m1dOzm5-`SRd3Z4
z)t#zss!!A~Y9?x7YT0W0)h?@z&!^9Kp3j|MH2>uMhw8ApiF&yDYW2hFJ?fJhni{?u
z85&g at mo&yT8JcdI$(rSw=QPK(Xj%)k1X|@<=e1rim6`6$RAwc!i#egKuI;BS(LSWz
zt39n_sIypSqfWEV6J3%nTQ@<sT(?tqLQhLCSTA3%QSYHXQJ<}!q`ybMTYt*H&>-4i
zi$R;gsG*9XzhRzXqv2yCs*$VFDx+GXJH|L;wsDH_KI2;^u!)^Xl1YupO;gy^-c(?^
z&$Q1BYvyPsG^;hc$D**@Sy`+`)}T4VJji^bd7Jqw3q6Zii=7tT7GEswEK at D(EFW1Z
zSp`^awCb?>!`j4}Yh7b~$A)U-W3$et-R8BesV(1jzwLcHnq9En7Q0Tn&-M=XBKs!$
zF$X<|c!#|X_t<oHD7%Dx)e-CH;keH6jN=C<dnd8eNvGePS<WfW4bGzr3>WYh)GZit
z(Q)Cp9CDE^WG;+fcyOWARoj*0TI>4EP1lX*cEoMO-Pk?Z{kZ!p4@(b`M~lalr<3Oz
z&kJ6Nm#<fmSFg8{_hRpA@25UGK8Ze!J`=unzN>vN_+kA5{dW4@^Vjg_`q%qU1ULk&
z3Fr!>1V#i_2R;ij2@(Z$1jE4r!MlPVFVbHmT+|i<Li|H^g**v03|$raa~LixG^{4<
zdAL=0et35TEn-DPL&UpCkI2%<M~jUXOBQ!V$w$RS)kjT5dqtN;OP5$IS+nFuj9QE!
zracxP8x?ybc5<or(%nmk<Lu%J<L)jqT$Z!!+H$q!smsr<kYB-BaVj1gA06Ki|A`aA
zspU+r^k2Dm<pkH0yNCOd=f*4NjqzRhW&Du at mxQu}(L|TTU5R5!u1OV1;{s1XwcvHK
zU-E(Esg#hEqbW0~(W%X8gtYjy(?TU-im)qPGd(B0FT*sWFhjb^Y1Qsk6QV%TkxVFa
zS!TPKj{Z#bNQ@+#C4*TDvud*5XGdk9%2CV_=Je#6<ZjCy$@9tkel=z_cXemJcK(L^
z!8Pt{4y}dOu3X!>PIq0wy5aS{>yK?9ZAjVh%SOwMWgFjair&;wpi!{CU}&@N=Eg#~
zLQ&zpEzVmGY{hI9Z0+4<v#n~|mm*%#^<vB7isDZt+>-0xS$$Xe-OToc?Y*V;rTcf_
zb_jRe-RZjXSeas3UfIyD;9afd%<`i0x4T#DzE)vdabOQ=k7SRuGN`h>O0Q~1)u-yD
z>VX=Mn&!Rgd$;YK+Q-}1zu#?t(*cbG#Ronf6db&N$oEidtwC+YVcg-Y!_VuY>bk#Y
ze_ww@?MU&F&qswvrN_dLb=5o6*Egs)ls3YRlE$&)amR1{;Ppd$6RYV^Go!iq1UMl%
z@#4q$AMc(FJlT1QeX8jv{h#)>&{~RGq1N2iiMFIRX?sk2-|2wUogK~{EkB$8eDsX=
znVPf8XG_nK&J~=SIiGia@<PUi@r#KUhdNhuKDxBz(w(lbuHMUmm#<#&xpJx7z5D!C
zm#b&4IbAz_oqfIShW(A!9=o2FU+jKq>9y}|z3FhX{g&gcj=lwb=lWgyFW&aLedUh-
zof`v-2Kw$UzI*>(+&$@i-u=-BsSjR1%z8NeX#HdC<Dw at DPb!|OKdt@M_}6Bsz4Yv$
z*I>`Hh-Z(6xI-`hmHDqv!v)W&&nrf>M(RhcN6(D;jNN*%^u_SYjF;2ng}*8Ow)d6M
ztDk;%`@Lsk$;9w$(d(H%O5UixIr`T2ZRcd@<kNR)@201U-mAVp_JRGO`(yOSk?HJD
z_)nFejX!sM3H<VSCT(Ws-}i*``!YINegFUf32;bRa{vGf6951U69E94oEQKA2mMJz
zK~zW$y;f^%6xS90?(EF0_u&VuF|08d+Yk~bt}zLYLu#-gfdYw2gean}ss>8iw5mcw
zl1lwkTdmZpQd{Lweh^ZjrivmQRgD6PB3eS+6dLnz3fQK!axo7Z{J at W0?`wAM^t*R$
zHxQ{mdscVuWA5DVo^!r)&cXu({!gN?Orm*b0IT?^rf<O?YVxG($i%onG6pX>24qG6
z=>moY_`(o&7#_dG_!WpbOMt>sz;(D_ut}b#j#WBvE}(YW1UXNLSH#he$4o9 at -p<Xt
z!c(_jbvsVL9pKg?E>^NHse=gL$BDWY4@*zMi{0Wl3!~;sfN8-S<J`7$@9hv(u;FEr
zKsH0PobiIDv28f*6!4(uHDLD7?={GB1L^O#CBmy3Y<oe}^94ijcvHz63!jgdmoV51
z)5moK&hQXM-#moO<&zNec_|t}b{~h=OG7lw2O?GQTt`qclBZGC)!p0gw>4m3Z>v+h
zqXq8bayvFWVor>Y!_Es}ZZvv_gPmj&naN3b at fhM~Pa}Jw6QXDd!Lslsh7kVlFJV_M
zL;O?+oMUgmD6S+ZZ<3RAHLA7Y5q<tg1}c~0`iT>`^7J+gw>*OWryj-mmw%1e=xA;`
zHFXnHxV8T!TwA&fll%6-OT{1p`LqB{JKTqY<_##`{3N`(hvD|z;ye1=vguOg5>NE-
zB&{JVOL&6=7<qgHLQ83qss|y`aU`F84*wdvjeGa~5P@(Qd68l)`1;crJl6rwNkQb%
z>{Ao`z<@_?X>#e#rLQ?iC)kqk{PZz(tJY7ofo-b$qBfs=a0}AHf>Rhp-qt3F)}P|~
z2k&!7PJ&g-5Z<we{yIw*#~?>9LJpmSM?-koocX*=MxW`9{G01MS7wQ)2-GvJq2s`r
zoPZ*?k7n~yNw}&N%!Ty at UgnR75o=tF{E`xl8mN8%<JW<}zMUxAxS2roA;AI_75e>x
zwat)cI$;Kb$RrYQ4!;5K=qteC?rA`SF+++gKvRVho53}iOu$!M2lwRLnCgFV7SLCq
z7|v)|Qiafc_v`WOgT4-zl>w?zl+T8bAEQM$sIJZdD!N<q=7EYMtIQ%jnuOs%%}H0d
zeT@H6<)oY_<_Y3Vo%{$%hKr<zGL=Hfy7dHGgqvOG5dX9bc3~l1m_*>8J at BpO1=`!E
zHRL&=B^5d?IFsW{Ds(af*I at W5@M+IX!vU$mL1d>mJ#_?f|I0cC-4wSnR6xMkg})=U
z>zi;Fa*gD%AE`w)vIISCU&)1qI!Q!J5!|;IsZ$pq={wgGaP1(n=@eYL&Muy(0iD<+
zM&Ek}S(RKOi(zeC2YU-!E&cD$(|fG^0@#cAP2(om>q)%4uvVbDdV3B~P6y|r9Xquj
z6Gx80wfxjfAn}(^;otELifhOoO8=X`N9<QG0Tm6%Ca2&e;&9n}aX=*o#RJvLL25 at 1
z$W($MNK!C6DbaCg=wu6&uBwOg;c@)q2hSkcaaxB-=*ye1?70_U`u(_k@BoIt^F8>R
zA7XN$p*=RnAWwr?S&Px%y at s1d-=WVh!@stM$Y~9t0%Arq;Q6=S^6qVFf;oRa%A1-I
z`Je+sbh at H?w7wp};$rmv_8<oKd>g at LW)T%-PKIDA$L3PBYv#c?a|Gt?L0Hk{@IrIQ
zcJ8}NG~lI{7H?>28SJm^Mx?eDg^SBk*0=_CAfUGobbf;V-FpzA^Ig*3%a9>6V7$Jo
zDiYmdL at FUl?%_pw85Qi>Mt34=K>zA`xYzqJ(AtJ;e9y{<^?iMaROA9V#e}VV6DXJi
zcY-N}AVPtt{Hol;pR3lC)~t;jQgTl{{LDiGy38_O>0;Q+A7Eh}gF(%d&t_yn-AY{B
z{SCxkKZN`ZYvIPmd9b1s%M~}dL>B~>oET*HG$m#}zoXZHDzRqIokpA&RKoI!tDT*w
z*}7HxAsC6E_Q!2FPcz03ypG_SRa~bhX*NOj8Pt}p<ec@B;4>uDhu!tifT at eU2s~7W
z=;IqvSXsp!7|=vfdxc7Sl%hq8vFhi)K+m$}7=GbJ?N8w|sTqN(lF~{QYYj{-b*|Q5
z-ucjgkA8AWl-JfFMIR)`Cy<WCm}t_td8rp+27H(-RT7vp7b~9Ki%Zn_#;)B6G_GWJ
zV$LOy(vl at l|D_?Vxch(ju)MxONLKm3?f(r%|8xwg4?ohMDBS{EHeultPvV{}TeOxw
z%fj-nwjg=+3dUQ1g21{4&04J)zmhYc#Jd}Ewg8_!cu)=<*pGqJT?jI?%<@v^C6b2b
zN*;Y5y=*t@SEAwIA(YhAXhJRA`~=1bsA`}3kE2SA(om_W`_Jg8^i`Br1z4qLta<m{
zZGJbg!dF|D5_5`#uxyuqmLz*=ltyJ<b+t@<d`c!pZpqShk4e@!$)J`)XZ|X^u|eqz
z6_P8YjN*(TB>l%G)Lda at Y{Rg!o;O%z6&})z2z~M4E`M1C0=GwkK__E|Jl6_&l8t>P
zW#!!*up*7CtxWqLtn9U`Dom|{Xw)h!Ewe)L8&=r1tgz3p3QUvDXXRV$EuU3rnI`AK
zB8%h#x<q?>Mw7<uyY|{-ejwi!qFG3p;kEv2enmH?C?D&cDpMmjZXmp(4hbfMI8&d>
z`wn}P17$9gW;N+hn<1k9>X5&7!p&R=n)n%C=MsjpyqYMWb_V74>A70_oX|(J(l&Fi
m*4d at c4Z6DpHB)!h=l=(4CvAqu-9}yj0000<MNUMnLSTX-ct?Ez

literal 0
HcmV?d00001

-- 
1.9.0

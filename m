From: Lionel Orry <lionel.orry@gmail.com>
Date: Tue, 28 Jul 2015 09:04:33 +0200
Subject: [Buildroot] [PATCH] docs/manual: Modify GitHub FOO_SITE
	explanation
In-Reply-To: <1438036804-23970-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1438036804-23970-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <CAKAx1cgf-0HekX=5P1Q9RJ9wXCE8oJQxx9qU2-YjMnQu8ZXX5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

On Tue, Jul 28, 2015 at 12:40 AM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
> GitHub has changed its layout, there is no longer any green nor grey
> button, it's a link with a tiny icon that indicates if it's uploaded by
> the maintainer or not.
> In order to not confuse anyone, adding an image should make it clear.
>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: Lionel Orry <lionel.orry@gmail.com>
> ---
>  docs/manual/adding-packages-tips.txt         |  18 ++++++++++--------
>  docs/website/images/github_hash_mongrel2.png | Bin 0 -> 19029 bytes
>  2 files changed, 10 insertions(+), 8 deletions(-)
>  create mode 100644 docs/website/images/github_hash_mongrel2.png
>
> diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
> index 6699951..896be00 100644
> --- a/docs/manual/adding-packages-tips.txt
> +++ b/docs/manual/adding-packages-tips.txt
> @@ -63,11 +63,13 @@ need to do AUTORECONF).
>
>  You can see on the release page if it's an uploaded tarball or a git tag:
>
> -- If there is a green download button, like
> -  https://github.com/zedshaw/mongrel2/releases/tag/v1.9.1[mongrel2], then it
> -  was uploaded by the maintainer and you should use the link of that button to
> -  specify +FOO_SITE+, and not use the 'github' helper.
> -- If there is grey download button, like
> -  https://github.com/xbmc/xbmc/releases/tag/13.2-Gotham[xbmc], then it's an
> -  automatically generated tarball and you should use the 'github' helper
> -  function.
> +image::github_hash_mongrel2.png[]
> +
> +- If it looks like the image above then it was uploaded by the
> +  maintainer and you should use that link (in that example:
> +  'mongrel2-v1.9.2.tar.bz2') to specify +FOO_SITE+, and not use the
> +  'github' helper.
> +
> +- On the other hand, if there's is *only* the "Source code" link, then
> +  it's an automatically generated tarball and you should use the
> +  'github' helper function.
> diff --git a/docs/website/images/github_hash_mongrel2.png b/docs/website/images/github_hash_mongrel2.png
> new file mode 100644
> index 0000000000000000000000000000000000000000..c695c3181abc3bdf4661692fdbcc4332a02cd856
> GIT binary patch
> literal 19029
> zcmdSBW0Y)B(56|&E!(zj+qP}nwySR8-m-1mwr$(?)cv|=`s<#VAHCL0uhoAtbH$1s
> zvClpy^PG708yO)lD+com^A`XB0E~pVup$5ep#IP2CkUXQS2L-x+n+aJCqW5i2ndMv
> zUAY|q0DJ%mVF6`#-Af;EZRO#o at 6E1@zPj-_4Nh at 2>Kw(q6_zLTd<s$prAeuIzq{WZ
> z<`Ys3eA%aq=4F`ewF6bN{)9LJo?(T5bef*uv)f}pT@6A&0nK>dBQ7R3n2x=tH?Dci
> zOs~Mg^2mXpgaHTv5a`1IwzNqqf*|-o at PW{Q;_-L5{eM1F69Pc?5i-{R{<!#q03HMU
> zIO`(-io>Jk2Ef1rh64~ou!G|R!2?D?@CVjFz*zqqgfGy;@#7AmE)0MeEMl$?{4WC}
> z(A1B+a1Y^6Y-&MZtbc>V;q77n<wO06ZGeEe@^27-puf|<3Dx|I9W~Pf_A>|o5hMfn
> zC!4>>Pi*yIFxG#Aex`{1KRHEsnkMyi{K>7Soq9h=YS-b!)7Ytu_!9~xJoN@@ieQ17
> z6{jTDkvm at Px-Ss9>dy83ci9e1N!)}c at w#T-mkW(tUA8zE at YqgnTVqR3!rgYdWXv}R
> z!F>38OiA0!&F{f(y!86BN})l+7rwm~x?)UbPi8{;2M~kE$fB#csbbxgOgIih<|&kt
> zd!KOsOGqHQX-7unBH%)_qOv}`?@yUnh){&i_y8360EDofon?H_zXy*CSwwVTsm4uZ
> zQ)60W&lhiJhM5USX>fMy^)Dmky9)^5;K~sH&Ywun6N0ducSI~8<T>xlW7x2dj3#E>
> z_iqA!0b#j{9k=iv2%(-MgkX>Nn`nt?TOA*R{#{j{_Jg;sq^B2=DIQ44MFsoQfl?|q
> z#=9{rPGU+Bf;sgoKn10uY3(}4UXVXkBf|5ZN2wy$o2>EC$4cO_UB=qK)!066U*>d7
> zz;v{iKAw(K?1h?$#=qT9=Z85TVh&m|kGsSj2M7YGrYAg^hV3O at mYlk&YmasLUdDI3
> z74NLL3dkoH`N+w=*Y?Dgr!bCZlx*%*(-$;t{*)5O6wqE)Bl(dWt1PlHvo=8>yQd|#
> zx2JQF5t}~Eq1+E~B~HYZCn)RiHGHqMCUu;#MuZ;hV6gi15}jvfoLh9Y*QyRub$IR_
> z98UZ`<D_j)sK#g7=wR2y?jCsw8Ap?O%-w8U{EP-q7vlx$7lsFb&|DcS%;@)O^^{(C
> zJ%$p7GNZQ_jb;wy^6PjWGW%|D7Lp;^b-4Zj=Joq}ak;q1^K0>Cl;V=Rl}$VXBWjj<
> z%*2|5dP#GrdZVDG?N%`&EMzIp5kk7kwNh?A-e#=<4&3QG7UOU}opDL1JDq#K?s8ho
> zp$!z*q`dDrK1xMe-r8>WNhl6UuTQ^QqjNL+v+Jp>{qn9=?dwr5r6QeFke`d_9a;DN
> z>h!!tg6I9Y<UNi1p0v~UY1jGII_e^6Ahb1@eMg(s-S{ce(}EhAx4So`w#}nZ%4(qo
> zkyiezmyGN6!cH$v?|GLjeNSg-gSHWrTfY%Dz`&b4p2I;&U8jX=tiI*fzFG|Z`+aft
> z*(mI0=R(5Qr<0twcVh9ZDw4KgqIVmo@)r3Y^sdoX3=^F^0h`B4N~8RiJyn}!lU^sX
> zGl=4MdGW*Q>eRX*3#;?N=Pll$M(=W$MCWH$3p%yt46pZA+>03 at p@ydiuIdkM%4^li
> z67HKZQ6*P;3mf*%%g^#qA^6RZ+`b99Y>##>t_O74q~~?2Y2O5>=WNd%#-(mpA_08k
> zXL~jz?)9-Wn0l at L?pmX9!1*v<!TVHtqua5<deT=WX`dPAy=^>gn`K3iQ7Ycv#T8O2
> z$@2Ncz at mKob}w{7y2*-Vwz1Yz(t}+luB8tqg{7Wh;eCv(eL^B2?RL6i%c~FHh7K%X
> zjlZP8bx<R}Q7=9}LK~#WC;iqw4$GITJj@le@i&bt%7otUVkW}yBgcHcU#XkZ4V9l~
> zC~6b7VB4aQk1S*cd0NlSo&IQhj#MmS>3Y8o#>CM^JTgWwoWowQtD5Nsg97M3nv3bb
> zC_>ve&#tK7RY3vtbZ1r?vIJ&UC@*1up9PL;NDsd(cYWyF1k=uok(dl`d%f<L>y)Ey
> z<5s!vgy=I0-lk)Wv)haM8915xwv$4S6A>pjmwCMuGL-+Vh6Kb2FWQ%F5<m=WAsO<}
> zkVLWng7dlYtDblqX0%h*^}6bO)S|PH0H&He^{_dUpZ49m1Y8Rlp_=}lPu8SAy5xQn
> z_??(F#zJGJtNEncrdS-7Q_!Nr5>oU?NICLy%O*4i+O-diyLEebUcbQr%+gV at nXb2*
> zNH(vt^x2K+dxf&^2@@D>yZSwj8EatJ@$it~SNTdTHO+Z=Y}>?rG at reB1Qy_uj})*Q
> zjStT~I+YZ!>{#d;qcGa(SX2ka`)Bd{{X~I>%U=_l<|X&CeaXYsrG&??RFuoW;^%T(
> z#W*jwO^K+Xi+rm<^fB*?b)IEYD^#_zgXPE73Har7Ce0@$79*thx}EZ>=?VZUcB^qS
> z7PafCvBDP!7GTk2J2&@u?0=~^8u6v@#>ne%i8K#$0bsn3;p-c#V<i5n$g`W*m(jo6
> z2w)Dyam1%*Gg}M%5^5&n`!pYS>;g3ut+Uv7B)gAhU0WDXOn*h6(1~Wd*5Vw{#m$}^
> z(KAVgR5SFE-H#!Fk6F0D%uk{yzVcaoO5LKd4%#qX7DjZ+lLB)&RH=^hvVM&6ru*1@
> zb(0MTb_>8`txLSC8G5Cvg1lXp$OkX5hi1Zh%Goxl$?-mv2 at JE7Ucg>1fPfWj&(v1u
> zx>mr^tMf6pxd?b~<{U?J6Z<6)E1tV6t4Oi%xk(P(9L0P3Xy<pu@wo7NX)W?@ZUf3I
> zuIbUbziYf)=~sIllx822gzY8}HaC;$rT5by(Pbws>CEaAX>wzCXUk2_azQE+A`+f>
> zc>2yUyYJ`HZ6|FY$}>1nzXUv{Mf*s+9)R<$v>K-<eA$#|f4b}r7LRj>)^$nt2{y)V
> zxH7t}oGy-DNXzela7ZVi_-Mh*>a{w%=2D`+$)$^J*9$YjD;Afo;FvYmxb#6ctpF|x
> zO<CMMV3r3R^z*^GZV6xA%3_vrJHN#6pAr?Ek?6_Woqx-VXla<9#iW;}dWevaxO{X8
> zp?XNgKt}V{0(M&GzYV<X$DN?sOS=r#7guHo(oQgIbjUB5>2U+_>fu8$nQH>&L>6#B
> z8d%r0erDmC_E#JI3fPrqK$a01YDe-vLA)r^c^4|oEIN0fPHTOS=Qm1~c8A2P(A5W>
> z&SE6%If*|@Cm|FOa;^2<oZ{mhq0lee^+ruG7LPdqtb)ws!^QSPZ(~Gnm$#TKoX*my
> z*_r**?B{f2sA=GL0kB6;v2EOnn9GsM(a2wCmdev1d86KT{-+uB<%!hPAGZ5rDK*=z
> ztJd}_W4I~1Ea?f24F)Gm{;rc>A01Lq!H=o`07DFyO#^LU{{mYE$Olr+ at JeFU=SvBv
> z#1oaEO)lL)J4-&fNR{=E at zS~fLwJOKf`$RoBNt9z-$olIkq5r`&V~eO=_kBCpMCqn
> z<nfm8Ugc*i>3I`#b$APCIonrvoZENpJ4GypjRSJ%sTZA&6%wh>BBQ{wj)D<Z7VlLq
> zT&ynN`#d;ZRWzPi9fpl#W5L72`}x*O`D%vO1UX3g5C~Ae82s-%BeM2b9D;$9SA?fE
> zaQ4~R#MO|(7UF7+Zecs1nzqX+oPAWFKz2_K%s%Kkxjkkwq3PK5=DEbj^GsI*2JD*o
> z-Ux;cbVWBRCMF!MxEWO0IpyZu$!aj`KY1TBZlgo?0BA2K#bioV*&mPNa9i$Q39X48
> z5t&7~fxWoci>XF+U>fPOE_eMiB2$wUSLatl2|B}c>fcXj;IvyEFT;PnJzPb!Ya)yq
> z6pc%_udW>)`tWhSxJVJuNdspf>fE~RxXobVo&P?%XM6$1x<!XGaoj39U5E!1h~ZPw
> z at VbuF2tv|6{blW4{Tn6^d at RjiikD0VTXe2=_qh*L+Y^jSFGHuTWPg(5+Xy6(v5yGg
> z18sp(qJvp8wzg8J at eukLp{r~}TVURjym;wcm`k=u$J;WVzIXm!)%=(GMZY~~HEb#k
> z+m&8BEHWzA_r0~t`}VU`5+jg^3v`&q?<te+yTy6Gdee>ujy{!y2GoUq5`E5tsV*3f
> zN1%k0>bIYl*{0LG^t6BjuBT(&Z4yfalUITs8Z}K=bH}|{?u@&(ptj at 7=CUsv?;FB^
> zRWFcVVtP6%qg&vum00puMUI&@I}%gu4mL(%96d73kk$|ZDMgPpr>)dA^bD;s0RzwZ
> zg0Z7mnTJMq$G20Z28qK21)R)zpoqiyryB2Pu}HU7!Rf?S`{5)LslZ<aFxcH~&KfyA
> z-|hR+DkvBo1nk&7R*TWKR#Fa_2w5W7!?75Rb^Sx0pT|=L*U#y5G;9`e5f#PU0=K at M
> z*ORB>;Z)-Z<L<C87PIf8@ldCpj{~`78eUcgS3&=v5=uUzb^CcMg*>v(j->||N04K9
> z7CLM<re>`L0jQ|kxlJ16nw&Vk+1X1A$y9c>fjO{Z7##-sb_nQLEDVOM1?!D&1DVl|
> zQvqlZsn^S-3r(fFlOn1u3WI&h>GU-nor;oi*siXVBr|uAuodkLJ*(S84b7FH+6Alc
> zlWF<U`LFkp{be*>_^UzuQ7+7u#+}DR?8Jo`zqD<7d@~_3euW^xo+FTe9K?V_yb_SM
> z-((#xqxbvm+0H%nh}&P?Vv at S-%4W=>+KKmWF}H`3Ml5EJQ{U)vC}&o;)b=@mqckj_
> zg!H`pd~psBJL-1C^US`zVpCBIm448_+P~;<|LQ#L<4G25w-B<9EHfKt@ugV!GB=I|
> zznUvde?CW~WBFEJol#kkPtZelO+fZCAnE#0a6bCAf|34F{c!5o!*kL>C>~5l?R82r
> z&Be%17RomK3nT{Xev`S~?aLXxL?u4RWXSscHa~tl<+F2v{e8E!-88`YG}k)prNtkt
> zCf!ntHR>YR@}&dPc at y6{yY^s&KE{91$F$#Ut!3%x+#n?<*i-lH)@|TeP|xvLw2Oi~
> z10|MyGY6-~YwBI!nI14Ovp794JFzN#r|~%`m!8Ny(de?c+ks}Y`FY*4D_CV`qJK_L
> zp#Kh$SG>2QR+&oMm78c-H0^CKVd&pE$b~eG-hCA{4|k-;?Rqvg8Ql>Hc1dB#oqUSH
> z%u8zfG#7RxQagFIaK63%w(EZjL*qGsoVc7*+BN@?;N&4X_+d8u at P-qarMZ6d4sb!(
> zGU53=a_SN0_wg$2so|2yFJtU3BAwoDeQ5+ITB{r~SS6m at yA)~HjGOv?ZnOm^hPdKT
> z{poFbwaN#Z)!|%T5=$p`<2ogfn3%%*^&qsn@tyTPTVdkvxw4iye2k{c=XGW2si31I
> z<>Vw4rXCWHQFUc&d&O&@WJagUNVQ>cQXHl6`0uL#5SDjyGR`A}2MdjWz6+u5ofT)_
> znd|ve1NYG513((0^M?xYgNRc7RKcR<$2nW@0S5d4hy(Qg&|&@%(W*aXa<uBSKqmoE
> zzdrzRxB&nLEFc1U<xg>qUYQl-DFhM<_)~oM12AF(5z=e^RNoAmJm8O^5YWIs0Yd?e
> z*+GQ$8-8kb!v;^-GZ+MPu%Cd?z$5k$;XUReKY7d_u@|ri>7oAx1dHE=hYy&I{K+$W
> z#!<p1td9==6A&7|p8y{yALS=c{-Tq--T%so)0cd&62=W<Rk{lOECD<q6}<nqoh%i9
> zpbkFJGZhg1V2d6P++`?)dcY53_`l5Y_*ZJvLhS at Vsy{2-_bXl>ExhOR-(kHk-p|;E
> z`=k6r96-b?poI3_KWnq+`^epZMW_$@vt$(jkgfp`8`VD^|KElVdh126zf&m8sjX{h
> zXeelDsR)(3gZMR at f{)jPV at y;Z-YXg26E4yt%7>nxaDPT6DOIDWIj*$U3T9Y9KlP{7
> zybM5EL38M^{Pc>m3LWj at T#{^0l$uzc;U9|e at 6m@4B(kZdS^h03q0tG@=w?XH_2O7*
> zT$gywZnHyAI};@_L{JjAEw7=ftqnvNb><4Xxay~EZa&iDun)wIPCSBQ&npNbN)8l+
> z523LOx9(dxP~VS)L at E{x=E0?KTOzrjtrBX2R#=EKiC8%)EGAo%LM7Os1FuYCT}4SV
> zCM73ZjaqNo)n<|#c6pzH5Xq_xMMysekN(hEYC+fGo7-B%h%5|+uY2PRmj%HKhhL&O
> zr>ayGMJG8|ja;ZF0N)WLcGJR-R?t{i(IJq7Ya$O**>;u at R9d|~M33>U{(+X@*<B)%
> zX;!tQQwE>XOupdE<tI1X%JlgMJYIrTMRclC{TZe?<f88U@<t-bSC}f~V_vOQjS|G9
> zQW9~VcVPImmpGf)O>i4Zy5C5guPmL_%2=#h^1TRBSz);Y`#wW#`|O#>eL!P5uFGwf
> zTRku*WK!1ImX401(}Cc72o#=<zO!}%h!{>_ixv<`8)!&Q%DikuuG5jCQZx^NHN}`E
> z1wJ)nXS5!P9Mmk)1#(p9#EZ{G1xl0et?Z_3M895LQx%MN5)E<KuPuJGM!__6EJRFh
> zu~{9wqONjx({60e_-#wFiyYkhZhbsE#&;;r{FD^yFTq^d-eP+?!}({Q9Phayl~*Ox
> z1Fa{_L|Z%hPL?YUwSfFa9<KTcgH^3XPrO4b{Uu{K+QnvPYNV)bSYCPvpxnoCt2h@(
> z0*VtIu@(p2HHGlAxxI3-Ly__{EV1W?duXS>Td8y?p}C0TE?jP{77$qDOjOxoCXj}V
> z%Xvh%RdsWoDn at Ba7H@?acwYVd1%F*j6-}W)NX}kRSQ(NY)GxAhB&LDTzgUjw=R-{{
> zI}vt7)D9qNtoncBYv5-`IM2qUBJH+YQicmb25Hi;aT%xbZNB~dsuy5Gn`iT<MbqMx
> z8S18#L?|mApQbyR9b%}|I~C}7(r*=ig|{UwD~8a4)tmq?>ty<UEK#j;zAi~BG&N?F
> z%)7ciy&ma(?E~PLe^h;B-3ruV?y}*O-mPOA#@2@}!CNKcmH8U2bFL!<Q+&CXCE6W0
> z)3NfAU1L)Dens0;hNE$MdO=)1w-zR3zdkKhdD>IBOhPH_il~6w-bZ?1hGKcW2IdS4
> zg>Ph(Radi`G?zy>x0l at VrXRI}2i8W5<WsimxUv6Ho5Qa{BA_<oTv1HLx#n3;7oK@m
> zAi3_UZT#g;Kx`B46Rmf at xOlYA&9a(>ig4O#5#W_0As9<(!d9*F@q0^`R?xzFX)dJq
> zp7YmIHcC(w(ei)~2cY%PU-5Nzo5ZyCb7r>mi|=_-Iyvq<RH!MPN{)o-YGg}zpi#CS
> zlUM5PL0 at Aj=t|_sGw0{(uy<)Qo10i75E*;Z;)Q0S@B)>MQqx%&)4yxl&Xkvf%GBmY
> zGMVoB9718>lonq1`GL^Z5&d6!-*$77WQkN2UrK9Z!`cD(8Rl$$IyL^q(sKIqQCb7x
> zZ>|Z#xOsR}$_M<=0?B{6yI&0|1*Bbe>zWfH&iD9WfX#FFik5=ZT9z$|9|c(?30rF~
> ziwE7SV+>kP(M;d&0zI at 2e~%Ya`Hmg1QQE`OPP8%sEy>jtTj3eqy+x9B9W|x3N24P?
> z9xKTn0Je>03?OKjS@^;x*MXR!^?Q_lz4i)2irmd!1XaGd$Ot&C+jak<B2{3l18w^d
> zAxSwZNa5Ztcy$RXF1~6~7^lS at du8vY>fUXHWa>S3Rl19eSU0?E3+qoy!+M=Yi*jx*
> z5F{RLRk at SS+$%oz`EZ6PB_{Ko{3;Wy_AkhEv)6O2svcAqAFJH*?&<<V--)fwiQN9!
> zWgA?ME{C)<k<sW!GoittBI`smGV>iokb8J6Kw5;DoZgy^-`I};>0BeXG>AdF#=D%5
> zwE-aRqq4G-X8>w=8&6y7F~X&~vYr3SZzFgxc8aEIZe at J=ecj*3eVOfpR;XQ>?@S3}
> zS3n9B0&*w9pV;9Ufo>x2CB(=tG;uzsq4;z`7o(F}s<^r_z~zzVmg~MTE$7+dW;TJV
> zOHYTOP=Gznu~IhMl-H-ab(^ojQ8}wO<<@X*BV~uc+E~^6;-$-^4I<zyrG38;^wp+>
> z09>P~v>iFK at fQibERZn)013Z40VdGKQM{%TCp){`rKT*>t8{W-f^A1VDP6NgXd0G%
> zT7S8e7NWU<Bp+tN{%{g0MC_B4=gjiVuc1yocx5)<hvE!X*B9KCDCcpbU%Q&^qo+Wq
> z)nZWZd^G?wdj~<{w|4ieb~J+jYMyMn`Zfx##Q|De(#cA|-r?7Yu$Q;hd2WL&LSCCk
> z-bumtfXbAqDdFhqd61un%b!?Q)Mhrza`USvS<^o7iioq_l${xS#c+I_%hXI?Kx=&M
> zeww48U-CetwE}fOzq0(7onR2mEF2WPMAUNEjM~X0K`g40C5sgrr`416=*;I`5~v0+
> zgEyth1JDDBCOughis}w(v-zz9 at w;-xSX<ZwS>%&nUMzUH=s!11U*ivKGDkxM>G6zB
> z8p+Z(vw(9o)lRQKm89A}D|-n+7;OycVQj8OZ2CzR7a#NV`iyk%2;ebf<EBVlF}+Js
> zov~%nPE?mtWr^+Yp$9ml(xL}K4TvCIUxZ!d0N!L6q-phq#lG6oCI at maS3Rs^ZyMt~
> z+lN_Ywt5J5l=t+yM?OH)i|>8~fH at H1OU_0Z=c;nkTF)NHA)V}uhEn>-ek8rBu#}+U
> zv=V5y=4o+9Kf|tc&T_$TFjJ29+A;a|*b19i1SwvM;ggFLKg@;KFUfe4MS~RWj+wu!
> z at m7;J=>tX1p;E*75+ at yr<FB~b!>L-nGjO}{B4LLV(%{aYreak~_9C6n(9HfGg#Emv
> zF;t5>w{+7Ux<cazf+OYB)b__;orWRHmIlsEeDO>+L`e at +8+Vd)sZZl&i{{k-v))=C
> z<Zu~6PB=mHZma$BW?$CO<h!haa}ThwAPHq|?s7%BgdTW{hEPl<i~WKHr^p^t!h{km
> znp5NLYI_6MN3B4HBfj|?E|18A!`_E2kYBp9=OhU9v}#=s)(5~kvBc!h*T`E5fHdu^
> z-ty}?t{D at y`nXx`LmAZ|xa;!C^QN{>(=^*Pi&X`ah*9u2&(12Nd%L`jvRNj6-vNa*
> zHM6MwQ`Hl7a9m-C^)d%8NJXqTj6)xRy0d>tgOl>$v57 at Lbnw-aHT4i|&W?CP$o=N?
> z=M2PGT>popZhhMB`eRGKOx9^YEik$8S(5%4T+E7UmUa=KWM1aSgRD(r{yUKXI+wqo
> ztAih9-rKg at gxDJ{Q@?JyWp(1R?wmq#XE4Uzp41F^!^RQr)t*BmYK^>>gxI_wIFd|*
> zju&b}e#6=2_L*eOtbOi1;gT01&CFX;28<tMdsF0X5-66@)&m)ctg~q$3jmYUJxJdu
> zEi7U$jE?-(8Rj%2Qso2oWS<*%|KVtaik)c?y5QULZbi4JGZA71JCfBBJk<VU*$|hf
> zck3q1Jw2=(NgiWvLtfRsa`F^t3GX*U>(~NRXRwP32<hwKIjaKXLh3zxH<~iA-)Pyo
> zWzq$?5n&`H)6~KD$f7JA;(4Qs at 2;u1kNnbO?k<mYTNsFgnkrHa@OqnJ#;$Q)W^L7b
> z1Gp5Tw~iU>{IYRvz**k`KDq$Dp#|ArH64(E=3;b_9dR8$BSmGx2;Ye0L3=h@^c at IZ
> zU*&_?tAwq7RPUT_hZv#x)ha#kU9%0{l-Y61t{Rb$2N8J8!%V-(t*)MV-cm at U<G5|!
> zeqAvS%*M8L0mK-|DiR&)@ftgJ7{|YBONy;h?m}9nu7+M>T+btOUKaCapt0!n&VA=+
> zT-jT!*unhbwYL>#STyM0 at e-nLfBzV+!ry;-E$`VY=M|BMy&qpbRZu#3 at ukxj>7LMx
> zs|&^66rqy=MT|l>3!N3{<EYP7@I!+Huo|P<$SeoQ=)Rb*7*ac&>w?+o$VCwCy>}9a
> zw`&$QFle6W4A7N;MG-ZC4mz_=z>EX3$l{rrS1Y8$F+Lz7Bug5$0+%IaaHTZgH at RBw
> znM*B;b|Q<gbeCAfhkZ&FO+%4o%Bm4Me(_C8Y9{b|39U~?)YRZxdfH_B?UO%{#0?A#
> z-PTzN%V0X%=iCd+Jhox2urQl(d5s%<0KlB)MvM9y=pDg+UeO7fu84uLdp5CUl`>&P
> zyWR`pnYyf}5AL=#wLrtBEU0`Rv&)G^3OEsdqZpp)O4ry_oC^(lEi<bJ!Y6HrJEX&N
> zPHj(aZQ!<O^fw$6OF}WF_e!&_8_Xo@FV7<g)HLK|>gC%TVdM#DP-T}R!E&l+P4Wzp
> zttenOKs}0kk*S at Yl_+7Vs3`k`%XEVt_bdcmFwvRHAy$5`uahg1yx#w*prdN6-|l@~
> zEEf86rby`np79+0x7+Nmia$K_Xlm-#h*(mp8z(x-8vM}eWx&=nPraH}iSS|>EP|*T
> z2&+{<oGj{E66H*YT33LpX`pRpi7#|5y>7LohRvfJr>nk~tydr4Y>YU+a<i`m`+WKF
> zrZV~1x-zC+oh_$%!S7$2rbrPN6)p{;D^I6(jVhWE4KwlIQ_d$C<f|iX?Xw;)Z?J**
> z;j+84T_1hXPGO8w0a}@tVK_BITiXxDXS1vfz$#H%R%0%7!GApV3eWyeEdX0&4M$x4
> zGepc?p_Whf7AUzesnc&@MW{eWhx;q%Sc3#b$0u*36g~e#e}I(7>hJ`O34KQ$q?Yku
> z8NNe%S832`17&%Y_V$sBpz^RR_LSy)CPE;ol15M*8n~H`hTRI$0j>`@E_FsS&bsA+
> z`oE^~Gf8?>GxflmkDY%6%{C?tjN(lO=CQsJiDWQXiW_djj@`{RXLugY_sd&!7Vv=?
> zkYXotUO9IbabVK<D$9Cz_PswX^+7;4xG%duD%-QMk3h~kxArM(n#^MeI;$9G$KkIc
> z)(6`f at i~V%P>sNai2$tNQ;0Z_FnmU)+qcwlPO$*~VyXNoT0*s`?(?Yq<d2bbyx`wO
> z$&8SmzJzOk9-FPGtAdLcbD!6T=;Lv?jEdMfoFKh<rzauVQMp=(dM!nRxwZqV)2t17
> zIJ>YyS=>=0q||DR)4JH4qNs1*y2K`Q7l)-n!ja7a#lkS3U9E^Q(N9Mjrm>M-rZo=i
> z7c57b#6GPpfm(D}1W|MZQ_q+;{!VS>ou=@|pQJ^?iepjlkYDG&z0tnX?FR2aQ`WnE
> zyS_uob!87ACu?Sq8CUUj;%5D80A3?Gw4I&jg@>A-81(K0mkup-d*kbt>ZAu1Yy9qE
> zP|(dNkV3F{CLt5qw*DdL at -Do@g|aeu#YFnu){`}1$hV{Y$d$v%`&_7#skGtnxELtv
> z{|kV5%q><oT~|%RM7+AZhbEHgqPwX{m!>{_&*oZ~==4cruo;T2T$>PQA;g0wM2AdA
> z8sO};7~@q(C#{_AGKCjgWSO}MdumZ6WS}5*%9>l#sq;q5dL4=iTdyy3Aq}YC1jK82
> zkU_f0(BAf}^f>&T7b0+GHIRtYJvtqlmnr2WALO!{*I1ikZjZ9d_b%gUnV at L;{LLlY
> zfFJM}2klGLW{S+M=Rx3nJT2}I1~>^{4W)OoRJBM^R}!J{6r7HBiXWKP>w-PidV|NW
> zt)Lj at CM^VEc=Pfl5K|wmgnWKY$ripO=a>U-f`@(#=X!~-jz*&G79fgb<Ym`oxl(xm
> z?{~&Pc<$863F|q!r8@0I=V69-#`<nn!p{U1UN*myN&q3Kkkrsmnc&0QY!hp#+ev>I
> zf_m&vNSPI=s^3l3zP7+*6mG8`bdDG75h4g>dx1lS6OauNS$7#=)+ojGI;EmDHG8&D
> z{0c)hUpm>|hHCA@!CzG91rwIJqfx>e>n`1Ck*2Q$GNx-VOEPZd7xvG1%mRPOqlsp8
> zfJy!3`Up4Q(O2ZATEW4<Te#Fac@4PUAs0ZcjDQ>;#VT73lTNMi1`H-;ZnE}GZaamf
> z`u9&|t8F8ny0yJ(8|st7THHCO(omSY^LH#R70!L324n6=tsaonT9?a3Oe%koq)y!G
> zPet78B3Rg2_~{bBr*mX(U5k_ATySp|&!<mWpg2c4-Zq7lpLTt1cka5scwdJ6GRPDc
> z%9|$>aax*o#RHdB(j*6F1-U+X8=~Bey_b2-^h6z6Wysz}m*rFPDbgmySL_ecR;9U#
> zDVy{=fLO}ElXTIwUKwcDUCQHappAD(_bOCWC+hRE$1aw=^WaP|7^UN>z^-vYoxyZi
> z40`GPi(ocRPZhkRGp_9hI1V(#hxsg$w92mkS0%7t0K_`lp9YtTRn_7kLJ1-+!>$Bq
> zly%nj3OhTZjVT&aM4^>e&*j?4&+b42m?aQGJ?<Z@tLfY4luDbjAo_Bq@EBHP)61ZK
> z7acWIr-hA0t2utsTx${}zW_o&2ZiWC?x!S^Xkkh3E~jO!C$wmG*Lkoq=zMmmM1<lJ
> z01;*X$L(C=Gp6~xI-jgdOR9t at h7ne*xxV?I#S*#maCYf-)T0P4*v|gZ%rk8;lpj2b
> z2V^>Z0=<1>PyEBr^ofan2r01__!$^N%kV$+Hw^3FF9agW_>aogx#ifx2Y5yQ at I$W)
> z0Cw*Gf82X=eBlCz=RZXsc$xrV;ePZ}&<H>`Hd6#ZsF5KM(V!sukqoFE5H|l||3SMD
> z>g1?|^r-(1>3>Tz`hcC{*e}18C#ymh{23xu8&Bp?p77cV4A7^5ALW^KOpm^uCZU<6
> zc6=u<tU{w{A+orP6+B2X+hGwZ_U91*5J%tARL~thkkF4OWFG;!!IvOhC$fftjU?c7
> z1DKLtBE0iQ`!*BU6hcW`Rf(^jrItcegFudAqByQKm!92IpL;b38_+~TMLJ<x<UIyf
> z^*F!TH at J}-*$T|k?NZDyuNYSlYZt##%;`&aCoRXlC%G at 111KI=chQ3}w5)IkL?Z`b
> z(e|?{e4)cWpLV6?PhFQ<ZFTS!K<x@;R#r$`6J?usZX2sKVPCa9eY11|f7YT+-L~>N
> zVT%yqn2(9&<;1PFE?yDK!gmFUVKKZyU-^Osbpl*h3{DVh5qS6aoL~(mAIq<<ctz5S
> zLuI7cmn-EM79~l$+O`wJ-Yv^$RQ}v{PFWZ;x!XdH6Rl*nFKYIM1*?W!At*^!{G2_O
> zOKz&Pjv21M%)~i6<`s|imx{5;#Svk`yvUX$KuwX%x3ImC_noySQn-x1nl(andw|%r
> z7qc(FtL+*hdp~UtD-^@04$cHY1TP{-zhfGStR at vBUc8<+cvqmmk}}5N`RWD&3=3Op
> z(q-WJlQGPw9RKom2giGItZe|e-&K$m%PJBga}J(ChB;-Q at I5<TnfW=9(z@oPCH^}9
> z*|RABT#Tc|AAH$9URIa0{U+YXV{#Bi%*A8aOjii0P|d6CV at eS{T?O<eT4Tb~yKuC$
> zqcXQXmMka%1}(lUQb^vc;>sAOvVdQXfKOrKnTg`y+VZMuHqdW;*!gqH*Wh2ZFsv7`
> zx>J?Db=E=DtUEdsxIMz+peKvJ3$Jo_g{4)_4 at zLM-ymaoRW-k1UH2`Q-obqfQTE%U
> za4Cx%K8ZPUT}9Z9Eo`OK_uL3Qmh?GNlbYSF at kp4r8!=c3<hPyw_?<>q)aQs#zfH`+
> zm(2nJ0ou1up`#vZwPv8A#)QZ{P@=qz&@&@F&*DeQ_OAs3DQ%9WHzYBqoH<X}t!=lu
> z{yB*Sre;gV--Jk~pDv-7LP7l7OiOPJjTB&nAQYlv^4b}x5Pd&eOgs+mK%g5g_+dX~
> zXB$x}cZlfXk8G0-s9(-6-13+^Hm6+qzi=--gO03a(g~34b(v8rQd=frJh$?&B(2U@
> zZy%VJ2^=gKm2lXPr268azsn_Qm>$Jn2Rai_A5Rpq-K>m?x9NNzMK5V1^huf;N=r8)
> z8d5`J64!$(8o#nC5~9`3h$xXhK8&uqz<5YT+&}ii92vDe(|GB50+=Y3&La_q*@(zJ
> zedV36Rua4f)|7a69#7?leVAb%=8&^xy>?04UP3I=eQxl9K77 at d2-<Ue<Ytwo)Ns0q
> z%oPwfcrcLi*w2wNwA+h_x9sY;j<e5vnoS%Wl&xAzno(;^;UUyf2s8=w(hZ4Umvr0H
> z6lv>L%K#RANyXS&I3L}I<}zEgzAJcB<`q`TKqA0#<B0U}bin@`xoSpnuw|IyJd)qy
> zR&Z|^+yHLy>tC=yYrM#zON+D$@pSD`$j|S@%^G`JoYK}X86-PhLt&5k*h at gf;gavz
> z$kxSfFeuCCSrT!%7oHtum9kVPz^I)Qb(uXB1m at b|0Gx^taK_9lwYt1Y0X&1eh}Rzd
> zLqvNa-WE^^nG}q{Yh~t+#b;GiufvcSVe1;o>j at z9h2ZA>^muvgRKN`DmBy#C*3)iJ
> z;Me~(1ojz;w3IktDC5d6S-<9WvZaMyfk6mjjUu3)Xt>b{>3;UHNZ{s6(Yg|<Q-0t=
> zS{x9k3Y&n5aMpo8YnB_w>LVX1OAO@#D6*0_noT+*P!aGyFrq*MhWFYE%>M*^=#~32
> zE!x0IOa?<o=|B+yxp)vX>TK<h@B}31*3*hS+8fz$Di$dFZZ=+}?U9=}_ZTv>T5rpc
> z1wz7XBT}eYn+@~eaWCZ<#f*|;kRkp2+H7}2*^MTX+(_lcA=VU>-zMy2a7axl*TD+N
> zcEV(RIq?i+U7T5Y=OGt at F}@&0cQHkN9{+<N_SlFFiH7fx#Agx?cixtc;#;TOdk7<+
> zQl_7fGwEo*_h8 at mA&oyxgx8SaHb(E73`_rTO)yeV&*fUxUUau()nDsGw<nscrBAr}
> zohMu9RorP|TTZjaFsjrAa&72r7uram22J{)Wd9+V(G_#^V*M#p<n4*q`d+W7ZCJX0
> zFI(T4&n;=FaGQp9vL>G%i<_<@F?0I{*vbT7b`7BYIAec!XJwx@dbb^qK`^4L$}cMv
> zSDJ;kydX0FLV3Zz+NH%^8*BO<OX_4vUKwv)7;~4>#MS0Qh;|K=;E%)K%MtRzdsVvF
> zBM(+Y)}pyJR4oQCr&ng%+mbGS5mm(4s_zvWh>CePs~yTPa<T}c3~yQiz4Rkf6Etn_
> zY8cx at m^ChNy@@tJjqSP3CB&5Q4V%nUbV}>tjDlF93_Ni|>(2xGWP_*JCwmWs3(Nz`
> zDrsn9Dz5l+gw;!DE^(quA`_DnN0#bk!ltq=sveyvY at _E8CxTmuD$LxO>Npoh#XH$<
> zWG_n*=W at xPxl|Wb5N?0H4>~%ZoKbE%M-zC#X#QhzV%7e&3#FwTPD{mLQ!mI!SU)9N
> z#9x*#=>?mAP7p^H_7<N2wht6j<izh8D1xpKrX2vEfir=tAoMzDVwZ(hlEJ~H*6#HX
> z!<xmg9%h~vFvCH+FCjBpnF%B5*0dGDE=I=hP^U?4)414Q@kdEN#N^+-Q0TXzIr5!n
> z7v{#YJK}1h2=SghG+7wM4$`EDrR at HCcCu-pSfOUpYLRS1#@U&T*eoDVkbTj+dx-)B
> zF17z(a1^EHxI9IP36~mCM?A&$Rde?bAW#{X0hjLXpHqP at P5{ooH&KN#rgheQX=h1P
> ztLrnzw^qgHLt#9OTMsAa2&g83jF=dLNtj}j!wA}hZv%Mu1r~T2#NQ(d5-`Te$zQOY
> z=5easX(jAk0XK;{m9(tF-3`7zF8p_^oedl$om|S%c&IL6f^;UdOrhr1;y4_CWxw;k
> zu#qW|5zSX^98PDhc^h%-DVNMsAri#$l^}C56MuCOhzsP#5^Z!&A9)p<$`X}`z3>Bl
> zyfk2?>cZ)czdRDmQeLP$+NL4KZ8-G3zpyBv%Yf%7gy9W3Yg8s5mUxC(#_rmxK5^`;
> zVWj19STWYs1x-55Wr?m{j*cU_QCv>v4Wu$E-Pfp+S0d2o^As9`B!meup3C_2B?E2|
> zLZa&jgU<puKi2qwRN3qF2ucd>KDK;3^dDu_;~g*WZm)g0^(@}tPt^PiVUbzq#g>PT
> zzqU<uy_UTNxyH`r3@!kEu?!%{88ecdPN_wvyA?;7tck(@fGwWw;6pTj10eMkEFyMp
> z8Nctb`f-ysWu2vshUy8*Kzt4cA?JmDD{k!~K2Yka(yhB6?(B8Xif3gd=0I&HW_B6=
> z4|RZrun=zb)*tF+Q+)HL4zsZ(q5MXmvLSA-5pph=QGB1rX-xrB at YR^CZYxBnv;_zc
> zIEAEbaLbEFa7l-ssgqEUko{7yPm7E5q(2*USjx;&gj8y)9)_??s{@SS;PQ0kf#g?&
> z>=3?V=zuflB>nJ0hp!O<A*k+huIzO<D%YxMrgv@~Dm*JVrq2Fbw?x~KKaR9tzBLM*
> zh)vU-)qIwsQ}QPh3FFcl4YlD67(kNVj1($t2S=5ZGlLt7m2oDoUIS}fySQzqrEv1}
> z%|_&XF=CAdnww%qD?3t6cf`9a_)tt9SvmZH3hMJr#DJSS)$x*ag-Blaji%lsPl{Y5
> zD`j>mQYSnrBNhjn(9 at mPt$G`Hq`YhIar=-;@X{VgLDtqNEv4k+$laQLd{k9j6k=&r
> z+^jN&)WkI4UDD-J-%})12|yrCg_0F_d`3e8<8Ky(po6I=!DS2!<EwC;uNs7kN%rJ-
> zonU_!aw|`)>0_zt;i^%x!!*bsmtk)}UjAYGK8+v<n+0e3CTK!imnv-Rs0c@@NTps_
> zFKm!V4=PCRqJVmq<1Y4&M@$KJaC2K_P%kC;6G2gB_!|Dix>lhN>UiN`@@DLQJP*e@
> zo~u(YDclqn?MKX7hTN6E8N8<6l6S`hJLhYF%5J%~GXbTqc88m~s0hLnx)@d&7iNua
> zl6+HMOXoV$Y~WdNP3vx)%JJ3k6h6hB<Jmp*CprSbwd`USp+rulCeq(W8<AKb3yR$@
> z`8kqN55bc#rW4fPuvEla7DTb=o%GHcDqj-TYD!9KvqexiJqFRTO25%_vLI#?F#3gI
> z)!dp&G1?N7ewWqRl;X4HgwBJIRRLVPp`;bR3n3`qlkSh;_Jw|X&!J-P?Bpe&s7CZM
> zGVw6G- at EtYlELRE6|kAZvmMX)sxeE8h4`(*0;VGbN2b5RExUSR5bu^o53|Xpdlr8g
> z!&aB5tgYn6=ed)PPxTKHIHWz-$!jhff(Nwe+eq_QeU-4NMKfkz2C-MPLT)*AJZSyq
> zryLEr at BSmfmsQrOO0`>lQ^i|Vj`j*xVA5&3X;s8dY1Hq;U_ik_76o!BqlhbcXYUps
> zckjozwuKI=w85U;A<E~F?A58Myi_LtdlVb)D1-ePCE*Er98S=Rm}qG=yqK%A!y@l{
> zu&lrJ1B|10ao*ugIlJI#Pwl%`_n9>%;4}i>!YPkDOlj>pypuy;0*o3->Ok`-fuwkW
> zG#%C-zX5W>Bn2XH=*w at K1MN%4tufF|$=~Twe+ugwMpm&c^}>hz^~0I~kvs9y5~KMF
> zxX+GN6aai_8k}75JxY<=$J8JOdS5mSrVh?(D99%i0?<Y5Q|g;a?2q)PY1`^%^jGL2
> zPNS-)_vcXy#QkiDY~T|cwc_b at H{kZ*3EUik6`nPS!3cGQ!c5U>7z=P8uTT&`z~P&)
> z at FG{UW=kz^=d|;RwRFgha?=C}DK}VFZUaV<8;yAl2!n9ypw2oV9l9)teZh)I01{vI
> zTj9d~CjI#n^_3=114Z#!;E;<IqWAK9Rc-w)=#O&7^2O<gE(xjRlqduPBph~`D2zLq
> zosR_p4Lv54LeG#Y_r1SHGW(hgFr)KA!war!vxc)ktdj#2{%eCGLIZ5!<aYD{W(k7W
> zaQe|{Z8)LvgZ_tI9G+;IO`a*dhezy3v&G{Es0=_z at Ayyc^}om+?6!?9 at W#C at JG$#w
> z_1~o60|*2Fx~_PLYXo!Q18M^Rq#1 at n@p69}o__3z1Mxk-LIgpEz<&72|2}4Ycs>p?
> zst<$p>f|MJkvR3n(^>Q<{GmEi<Q4FLeQYd1L7f&6859lzPjBqPi)qP<_$-wI@XA|1
> zrH1`OIxxfmgccXvSP%sCk0%L4SWfUO6wiaAaY!QtDEB<3w2zG7%+FnO8l7D%=d3O7
> z&8O5xgk}ybKvIU#qvq1Pa}{d86LABAUaZbG(wuV2%({aXIP()PdNWg>O?_C4jq-wJ
> z4WVZ7v(S>ed4JMoG-93awK;+AVPyv+flAMva7ZG05CP+|tUVAq8S42`R_EDkanR8K
> zM<3k2R&jNOxFuPk@$$Z*(gN{SCn6}*CKO=pudCN-)fi&oBr$9PzVh7dtXL@?G6jne
> zbI)H?E2_Yrb#Ri2v{R+~=a3{u13J0C_5*G|Ej5OcrBSq~7nMWifXHp-`wR9@$a-l(
> zTO?yxeyG@%XDmNqS0ET<2d&mTRGB?;-RL3b#Z|T1_A1ZIWue6I_4fZ8j}U`!&zFGt
> z`85=>@B1L$Ub9kD8WTCP)#yPO$Bi+=?^CV)@@)np4LOmnvK>P(R2#tcqwyR at O5n<l
> z<M^5iX0dG>Cn;teAhK7~G*~yk3jEoTR6U^Y%>G5NY6%2Gg3bOM@#W+|ll at 6Eph&HL
> z1qP^9nD?KsLx!b=H+F(>&4OtYuF8ld$r>uRkwp^D>P&?Bw6}Ndcxh*4PHiStLLMw~
> zMw86{Ap7ymL348Lc-FS- at 3B1XrJMIN2h=Hz>qe~a)nV&g^boV{{2g=1n_#uqmBHUf
> zP<F7%)}$KnOK@(;B7I>)r?_?1_&b}`!($IYnPgnDl1Blb+yc3|Jp9TQwpQtLX_y{c
> z<_e`z-TumQGQ!)J1fm#%cpKo)VZArnd%}C@I_Bu-dWn!A?bo~HVHdS-BS>N0->4%{
> z(p<0?=`WnWS(d)zcA#hRBvl#h_r(~Xp{0=*HO`2S6P0Pv1tY?5^f4T)KYam1ns)iD
> zgZ#nxgC`J?QBbZmqd}lyWb*#_ at bTs#ewzu>S%Udz;Q$3#0lUR~!i`S2VlygbCTMVn
> z-Wk>Ol#^CSrh(I!MF%KI&4aGDQIDztS&FugNB55`J9KW=%*q6uH%e1km`3phmX-&Z
> zZ;5UUbT{k8>|bl{T7!09H|cv;g#GOQy|AYE(y&OK2%~mNRGIYUb$G)E##1u>_GK9E
> z(75FR+gaZe$V|Ct356)uPE?-Wm;b*?l2l(NFF at J;izKQ4D7m8Ya%FqtzA(=-0do*3
> zBLm~Mc1upysP?fTkAgSzsZVAsg)JZGI_a`yL-U;bY9<PowzDWUaNFSk@mVt@r$fo+
> zdauFVc1B2iv>#kp0;|{#h8RC`3Wv*)PTWfqJd1KZJNDf?!<N2d+t_W2Z}HuBd~dHL
> zKV-=>o%w^Mvx9*j<>s>x9r(9YWA^B*PKhi}R;{zy)e>KM+ at Uja6QzJ=!0<lAir6yX
> z56-;$*_xYTTCowy(2A~)<w#<aL&mjXcm}xCqi|Uhq2W4-D%#V`&BC!?I5DpdE3Wft
> zoR?A6xRq!_h7x4HixQJ`zTm%g^z(F>2`!C%Qb${yL=quer!F-JF&>b_S`_&M1#{tl
> z48l$ZHfs at HRMqHp#KzAPfb*N`)o~yMM`F1ziYRyzyO|;YFg$MWxYI&oga{X%kWzP_
> zOAqy8^a_~~+f3Ry9Yv6==~gy-)ax-Y=e at I{REoy^wR#DYqt6)rK|5}A5zWMFe`)&u
> z+4w$<9QIb>0-)i3C!nG-m9!No;5U80*(J2yzS*R66O}8=?Bvu9w*Wk16w4|g#iZpm
> zV9==ijU3azI<|&%ke<n#Pvt*>4j1J+&cyj1F)xJwdC&p=e*+z-G8(l8cTxeuJ+gAb
> zDHZGM17h*NADW6RwrnqDz^NJ|>HkChA_C~=Azf@{+d(NJzniO-M-qio(}pWTz`d4j
> z96LmbMS=MB<-A!3?J$%^aV?z_58seq@{qcn#wiV^(gY(eXMgN=H~$LZRF+@=B@q4m
> z>t0<N?Me;-o?9nHdS0Wrbh2bpm5{fd?3;dF7wx%}6H|9x#g(kN(3F;_fhraePqJuA
> zm-Dtz9jyL2QHQA8yMtOLHoFG at EeIU@qW7~(;YfGP3x`Nw$PS3bAk;5#mN|y-(0oY%
> z<Tf3lHo@rbgJ`bEeMdH>8AYmd!yskW=}Y6owjLsHS_e9+|9PF?w7vUrtbtDTl?Jwv
> zEx2ecO8GxQlH!QS>2XB!^HbaDA;X_4E>>8JeLJ(T@<{D2tx^wrQ8$n3KSV5J4^G7O
> z7m%2^-Tcj at eXe?YQ9m*mSYO`h=?6{TO(zo&3}~v7^OE@`CLwKaNX(F5-tf=%XmB<r
> zKN6Qj4wfWU at uoRZ52<yWP2Pm4=TPyUABjzdpf}$0f~7t=@H~<>jotn-QFt-kVhizt
> zOw|`uEW*zF*<FpF-10k+G7<)?f&RBdp`vqKp7vf}vozZ<EJWT>GcK_8`B^)M!1zxz
> ziP`!<HTsE|h(!y^M5v}?a`RjQyh)Q2LF^z=kXSgBS@AoriOO89-)`H>>y&{rMd({A
> zyH-CyJS}Dk|6z+jaY*h76c0oMlv}~V#!Ob@{Sdp0)k6MQms~D3E1o<h(2QMmMOrU0
> zRm#P{F<$iITYxsjHIS?RnW-!r!yoS9TC+o5svxuN%b6=h0eRN;>m%pYlVk8((hmRt
> z^6}sQ0;G+(eiB0P?LXB;>(0IQp`zrCOG>X-#7B=*)F)8HpOwsI_0w}7^!kXvJ`xbY
> z41r?G9Q!|jNWtd8wgM5bb3OP7!yIEDbWw|2<%w=CQBofMa*Ry-2Dw>%>;b`Jj5VdG
> zOKiO3_dUj*aAa}8j^N!4v;UB#vqnhL(|$Vg2pCJPcWP{Bon at f;VJ|%?b(+?Rld98$
> zTb$92m|6$}@dfCZAst!OV9zXB!cWEs5$xFgqXxfTgq^a|=3k!73R8C!N>NRkN|D-s
> z%Ru1@{-783|Ab!fApSe_ at +iak2t93<lT#Yoa>X{-^8f-&aR4B$-3{eaBIx+3`8dn<
> zbD90xA<4+p2`3xO^tbm)6VN|v&hcc`H<D1+*9g1fzwoW!zre`JBa6LDd9!&>UlXrT
> z%YKNvk`Vf9Pl&<qKZd-r)&zQ;I=jnTU56l$Qx^*hf7)!S%c*vaiGX)5R38F<;DR!J
> z-TTCdQ1pB?3D`?I_8U93)|$8;vLV+JnP6?5gAn4$-R^jqd_z5yT5oA=d0M<J^OTjC
> zRiQ1`IS(;H<wBq#KX3(=%XXf^QlXXJ`7NhxO;e#9aS&m&mzNp5NLMP`gTd>!dCC*D
> zr!*H8@%*Jfr0R;efjmyUEI}Z|c}S&YQS;T-9QpWp+ml-l%+D at Cz?!kO5oGdX2Twaz
> zL4w{V(R+|#qge2 at 6&$CC!$s$bdxm7k@%+SRXB?q=79}wyYO#3m3Zy2|asHgHnFaG+
> ztetPwh?2q|UYw?ZRd4?sMg0X)f_-W at _w4!rjQdF;iy|XDmH#J#Ls8qHxgD0FEAtQG
> zsEz(tgi|2=|B7&C6$%e7UP-CD0icn3`nJ$}cP-u`NT+H4oGQ9#IL&u4mO}&{3_#B+
> zz*XPcr+%GOwG?@dKQ}jDOs;!ZRN at TQcHm?-5-p)RH=rXgg}Z}Kr}+64eY_jvZg0r{
> zK#Gcngo{4d*#tqUOF6d#O-$ie6PE5Ji^aJ=KWrWTzww(vpbH+&3ek*DUd{7n`rux`
> z3xKyWlu1)oBAQ=-Fvw={1ca4`-bBCE?FyMYi at 5lHgudV8?32S{Jm`;m>{4dU{Jy`i
> zWq;s~=E`zU&7{9S4IzZbW1$sHER)`5U}s3~I18-`8IRfPKvLt)K8{Wny56HK?%xCR
> z*T)W(<_p2ji;NL-v-X-C6+8g>Kn^Aic982D#@XEijhci2)Xd2>^&`&3pB}#-1&STj
> zTD9zgt-+2&z}A~`$DQDj5(zb5U|x=3fu6>R8r`q`-O(f~wqD$TyE(hmNhBRXio1sB
> zCe;f;?E~kF9r)RPr&g~|Tz=h0l<IF<Jp{`zq;N+^toa7vL$+a~APw0jK}NxvDN#-<
> z8)gb7s14{cEAV+L#ta~cxeCSFTlLT>$+4b?g{=l%aWA77Y2Jhlqf3Cr6WJmFHwz at r
> z);uKhToWo~ica662Sy0I5_7y>@G{j#NM%Wo>jC1RWYgb?=Zvz8Y8z*AcJzGW&ON9&
> zEM*_(g<_9TvYJZrDo?8)bX3e25((@3=BBRU&R|4mZ<-wJ|Hlf&pQc=6{N?vyz8uGm
> zCWS3Ztxq+@&oLHV>p10DvHG@^gvl+7OIt((rCTbiS8ti at rKh{@%{LyU>Y{D-Z<g6c
> zHGl5ou3v2Se6qE|1UJaa6L)p+%9C!rbw~QUzw at 15p>gP${;hz!7aP7VYS|=u^lhz;
> zVDBQ1#Nxy9tIyr-pX(U(<mr{?l2N$Efs*!!70wg*^^j**>ypD<C&O-aD7)$N#D-0+
> z7rK4*%9YS9FP+#6Bo<$uqQbU9-Kiwyn8C!uSLfztwS81ko#(<*o>rW9G at T_aWX=1e
> z^yO0(TVz#v*S`}w_A5}6tFm(H0>P!NH<eu%P3x~yv-ulvK`C~@RaX9Q(>E>s79W4j
> zRJrf{UTNEAwgXG-eiQ_}Dt|ij`6l_3C37CQiI{!-e7oc0#WM4v&|Ae(9ZOc_L~FU(
> zJTy7jsh#ky6guQ&`@qYys+p~@n9p>(&Ba*mA8WbcgG%2{Jfdt!$$k>|^LqWsbvB{Z
> zYr_tOKa8!73D^I`>v6j3?yl=Tg(1h<o+lj&%JLKAJT-fX&6Fn(-wDV+|DUpDuVKm3
> z9ffw4y>*YYzE^Es!J~6=BJz-uzkaq#v-B}3>5nDLr<?nJ*&k7AG5x-R`i?3qzxl5w
> zUy1wk%Kokx18`K{Y025nMKXSw`<1^vlh`JGa@{;>wep&Ysyiy2S8;rdeB(9qx5t)e
> zMNb=V&wW|$(szzea5D4uGhcWF3%36an|oVN^oyWt$$S@)@b&%i%VmG9e&)3E!82Kz
> z+sD7g>$4m&e}4bORfCPWsV=$`vn&0l%?X-)=Wo<4mS;xHj)=jio2=XB?^_(N#J6TX
> z{{^nM`d%Nu%xpC^>amtJJ7Kp*lK&fUX6}mYSN*^1WnzuK&VKp#T^f%cYslSe3nvJB
> z<oPT*x!7lJ@sDe-cYgW5N7gpF+U;uBqQ90sA-{g-A1F6m<8XS(=>%mC=d{GLE6mOU
> z4HWn$DaFE}b6s6&)xDip5A}Y1S-b4;wB%Js_SelXb~|-vPvxJa4VRYaUTSOGn-F>G
> zw5iY&g)lMXkt-oX=j{iDjtHcRm1nZPvD?G(z++=KlX_j;SMQa_cPCCO<IPzpbn@Xv
> z);HPix65lM&b7O!Iic^<Etdax-aSz)TP;_z*(%aucF`)mjF|0emJwDHQ@LZ0FY9q!
> zB9SaCkTG>C#{%BW%JWMt-c(s8%xNtR*Jk~CnfI#6lxy#IUz>4D;i<NOHM?~_|Fb5Q
> z|4Zwx{VQYm;kr_G{`3{o{43RKG<L3$H+IW5M&4fNy=yS;U1a-OEnqY6o%&+;)gOTy
> z9vNH~<g+|@eXsU0bF?DUcT>>5!}WLhd)qm_^a57}?fclcR-o~>6mWy&_pQGdeiUfj
> z2OOHaXl}PbRH+~yxU}fezA}3gIi(BcO#kIS`RBx)smxdgJSU35)78&qol`;+0Ly&k
> ADF6Tf
>
> literal 0
> HcmV?d00001
>
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

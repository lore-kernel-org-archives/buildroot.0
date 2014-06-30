From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Jun 2014 23:52:13 +0200
Subject: [Buildroot] [PATCH 13/14] nitrogen6x: bump kernel version to 3.10.17
In-Reply-To: <cover.1404164261.git.yann.morin.1998@free.fr>
References: <cover.1404164261.git.yann.morin.1998@free.fr>
Message-ID: <a913d991bd0534d192982537a25388705c80c728.1404164261.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gary Bisson <bisson.gary@gmail.com>

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
Cc: Hadrien Boutteville <hadrien.boutteville@gmail.com>
---
 board/boundarydevices/nitrogen6x/6x_bootscript | Bin 1653 -> 3207 bytes
 configs/nitrogen6x_defconfig                   |   5 ++++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/board/boundarydevices/nitrogen6x/6x_bootscript b/board/boundarydevices/nitrogen6x/6x_bootscript
index dc9eea481c03145d16959e5ebcc47120ff3cc2c3..05442a6b0eeffafabdf8857fc57fed73b5b6cbac 100644
GIT binary patch
literal 3207
zcmd5<&2HO95H<p&fQTG>>1|37=%JEKGO{YfAW|oB+yL<<0g~Q?C3h(;Omby%B~vwY
z=u70#C+exUK1ko7vr8^XF^XZghjuR_IkWTo&5yo&{LP2o|MEY*|Lxa5kB**P9M$LR
zN8TTgAANNc3L&A0a=wy=)cbw%Tz%j%IJa at JO9Y|#MCEqHcItr_SG#8(c<#(q2iE7=
zW-Lnyry!Rsvj7jvHo()B$R&(q%j(2DVFmw%Su81-<}8?0%*rZ~FABU#!i3Fl2$%Cz
zP!@<dwqkBsHDks~8Ho(sQ_JFh1e9&SgHsF5Rj;dDgbdvB#5Lv&`Wl=@*M?Ijg0zg{
z(7CMz@1CK=U`bOx^!%Ay{@}ZpKTh2tkArs?FZ_vR<i%miQn2+;;Lk4Y(~4BCaxg|Z
z=HYwrDwhW=S_-g7`amY&r&pJ6AQc&xB1aL*Q{$H3cgmgoE2k0~4&T0dG5Y!9tafKQ
zomvBooMeRr+qGfDuE7{xr*m-7Vb9eL>ooQ_5H%_^yCL#e19V6Wcwksw=ZqB*Nf;pB
zRtedf*zBkI>8y!}0)X;kT!39FH$S4EHUt5_IxCW~#O{040O3B6P|?$fK-gctYayXy
zIKYBpEX!FDD4rqmScCoGJY1RUPs%AOyF(YU43VV@^M9O3gOdY}#`2_er*m11+c-JR
zqlRFcJ49i|RMIg0Jj{vYBD0$`-%Cs9X3!O*<5Z=kUx$^6AjLXb0yY?#izH!9N$$gL
z@&(vkZx&=9a;@DpjsyFt at 0R{#4 at 3S$b&nb^4dctVXJ at 02AG+15*i1!ryXL(B9MPdu
z3;&;1J(f*5nYq21zggncsC(3;LWk*57+xxxmV5wthg&?(6dW0M_9diKk+Ej(9FXnk
zK4%6~!(g|`KpYh!VS$ueoHE|f^G<x6n46R&iHL#;7PrEh;t3OyT?H=WI0)77vvCfz
z9j(+dR|MxNHng%ql~Ss{23|EeOe-&lR6qpV4DPmo`s1);uF at SG<NP}=C}}j})plH~
z;okI_brBv`qPV)}AL%p#bXk}e^LsCeX&QyemAl$=#Yn(1Qp1+YFe51oY at U`=EU#|R
zr|;ogJwBq<x(%SYp+c+g?yg65ga)6}3ZyALUAgs83I)k&D_6e;1qpMOU^i5^J{RZQ
zYPQ`NNooV?Ktv-$(S@Wu-|b-pKLp2$a%_ybd$&WB>fNpt=hU_|VwYsY at LS;3g at o-W
zrgBaw&2j(oyh=h-n~JvNizU+H`qUed5o9bglc1~|Ql)Y;&qNk6(kSnzzb!eev$@*d
z#v)6$bG)Msth&AW1TW9eaNnY=04<qOz->}*VQO7P1nlAMA&PJ%HQ=iBq0yr+sv81X
zQ!XGSTfmi-#4(E`qi8 at 4m%B4$w(mAW>o+M`uqH%ZXgGC at _nXH+0U~X;^L7OF2qW-n
gK<Md%_Er9!=efv1{XyW_0<Kt&OBSyEXoYS44XUZ}y8r+H

delta 231
zcmZpd{K_Mv&MFx;{mtg|AZM-n3=C|h3{W7xT8C+(j2au8E=XYFdR5ut)RNS^GKIX<
zijw5~JOu-5F0RZpg^ZNk%#_rU$#)rTH at h-!W}N(t(PHvRW{Js$Oj9`w4U9}G%nS@B
zpJ$R|GO++Evg1ll(Q)>1bkq$Go2<;Vc=8@LB}U`P_u1Y}{?G0yY^bDQ&6S!{oXW)s
zwN7brBa854YYr}f+}z}(oNR*vu$r_?u8H1i3i?U;`6c?Lp1FzXsS0Xp3LtK-f}w$h
N0SG8qPfp=c1^`PBLxKPR

diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 0c026db..da2a7e8 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -21,6 +21,9 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-bo
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/linux-imx6/tarball/5809938/linux-imx6-5809938.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/linux-imx6/tarball/efd65e6/linux-imx6-efd65e6.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="nitrogen6x"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-nitrogen6x"
-- 
1.9.1

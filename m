From: Evandro Humberto Rodrigues <evandro@novakoasin.com.br>
Date: Tue, 06 Feb 2007 17:35:54 -0200
Subject: [Buildroot] uclib error
Message-ID: <45C8D89A.20002@novakoasin.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi people,

I having an error compiling the buildroot that seens abaout uclib
(concerning joystick.h). In the realy I don't need to suport joystick...
Have someone any idea how to work araund this problem?


make[8]: Entrando no diret?rio
`/home/evandro/obu4/buildroot/build_i586/xc/programs/Xserver/hw/xfree86/input/ur98'
rm -f xf86Ur-98.o
/home/evandro/obu4/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-gcc
-Os -ansi -pedantic -Wall -Wpointer-arith -Wundef     -I.
-I../../../../../../programs/Xserver/hw/xfree86/common
-I../../../../../../programs/Xserver/hw/xfree86/loader
-I../../../../../../programs/Xserver/hw/xfree86/os-support       
-I../../../../../../programs/Xserver/include
-I../../../../../../programs/Xserver/mi
-I../../../../../../exports/include/X11
-I../../../../../../include/extensions  -I../../../../../..
-I../../../../../../exports/include   -Dlinux -D__i586__
-D_POSIX_SOURCE                           -D_BSD_SOURCE -D_GNU_SOURCE
-DX_LOCALE -DSHAPE -DXINPUT -DXKB  -DXAPPGROUP       -DXCSECURITY
-DTOGCUP   -DXF86BIGFONT -DDPMSExtension     -DPIXPRIV -DPANORAMIX  
-DRENDER -DRANDR       -DXFIXES -DDAMAGE -DCOMPOSITE -DXEVIE   
-DGCCUSESGAS -DAVOID_GLYPHBLT -DPIXPRIV
-DSINGLEDEPTH                           -DXFreeXDGA
-DXvExtension                               -DXFree86LOADER 
-DXFree86Server                                
-DXF86VIDMODE                           -DXvMCExtension        
-DSMART_SCHEDULE                                 -DBUILDDEBUG
-DXResExtension                           
-DX_BYTE_ORDER=X_LITTLE_ENDIAN                          
-DXORG_VERSION_CURRENT="(((6) * 10000000) + ((8) * 100000) + ((2) *
1000) + 0)" -DNDEBUG   -DFUNCPROTO=15 -DNARROWPROTO  -DIN_MODULE
-DXFree86Module    -c xf86Ur-98.c
In file included from xf86Ur-98.c:8:
/home/evandro/obu4/buildroot/build_i586/staging_dir/lib/gcc/i586-linux-uclibc/4.1.1/../../../../i586-linux-uclibc/sys-include/linux/joystick.h:131:
error: expected specifier-qualifier-list before ?__s64?
make[8]: ** [xf86Ur-98.o] Erro 1
make[8]: Saindo do diret?rio
`/home/evandro/obu4/buildroot/build_i586/xc/programs/Xserver/hw/xfree86/input/ur98'
make[7]: ** [all] Erro 2
make[7]: Saindo do diret?rio
`/home/evandro/obu4/buildroot/build_i586/xc/programs/Xserver/hw/xfree86/input'
make[6]: ** [all] Erro 2
make[6]: Saindo do diret?rio
`/home/evandro/obu4/buildroot/build_i586/xc/programs/Xserver/hw/xfree86'
make[5]: ** [hw/xfree86] Erro 2
make[5]: Saindo do diret?rio
`/home/evandro/obu4/buildroot/build_i586/xc/programs/Xserver'
make[4]: ** [all] Erro 2
make[4]: Saindo do diret?rio
`/home/evandro/obu4/buildroot/build_i586/xc/programs'
make[3]: ** [all] Erro 2
make[3]: Saindo do diret?rio `/home/evandro/obu4/buildroot/build_i586/xc'
make[2]: ** [World] Erro 2
make[2]: Saindo do diret?rio `/home/evandro/obu4/buildroot/build_i586/xc'
make[1]: ** [World] Erro 2
make[1]: Saindo do diret?rio `/home/evandro/obu4/buildroot/build_i586/xc'
make: **
[/home/evandro/obu4/buildroot/build_i586/xc/programs/Xserver/Xorg] Erro 2

Thanks

-- 

*Evandro Humberto Rodrigues*
Engenharia de Aplica??o
NOVAKOASIN
evandro at novakoasin.com.br <mailto:evandro@novakoasin.com.br>
fn:+ 55 11 5575-7854 R:232
fx:+ 55 11 5572-3116
Rua Dr. Diogo de Faria, n?490
CEP:04037-001, Vila Clementino
CNPJ:62.324.033/0001-44
IE:112.646.036.110

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070206/bef7a259/attachment.html 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ass-novakoasin.gif
Type: image/gif
Size: 3590 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070206/bef7a259/attachment.gif 

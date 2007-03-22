From: Evandro Humberto Rodrigues <evandro@novakoasin.com.br>
Date: Thu, 22 Mar 2007 11:38:07 -0300
Subject: [Buildroot] Error concerning fontconfig and Xserver
Message-ID: <460294CF.9090500@novakoasin.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Without Xserver, my buildroot creates a RFS very well... When I was
include the "X.org X Window System" package, I m getting the following
error:

make[4]: Entrando no diret?rio
`/home/evandro/obu4.old/buildroot/build_i686/fontconfig-2.4.2/fc-case'
if gcc -DHAVE_CONFIG_H -I. -I. -I.. -I../src -I..
-I/home/evandro/obu4.old/buildroot/build_i686/staging_dir/include/freetype2
-I/home/evandro/obu4.old/buildroot/build_i686/staging_dir/include -Wall
-Wpointer-arith -Wstrict-prototypes     -Wmissing-prototypes
-Wmissing-declarations     -Wnested-externs -fno-strict-aliasing    -O2
-I/home/evandro/obu4.old/buildroot/toolchain_build_i686/freetype-2.2.1-host/include/freetype2
-I/home/evandro/obu4.old/buildroot/toolchain_build_i686/freetype-2.2.1-host/include
-MT fc-case.o -MD -MP -MF ".deps/fc-case.Tpo" -c -o fc-case.o fc-case.c; \
        then mv -f ".deps/fc-case.Tpo" ".deps/fc-case.Po"; else rm -f
".deps/fc-case.Tpo"; exit 1; fi
gcc  -O2
-I/home/evandro/obu4.old/buildroot/toolchain_build_i686/freetype-2.2.1-host/include/freetype2
-I/home/evandro/obu4.old/buildroot/toolchain_build_i686/freetype-2.2.1-host/include  
-o fc-case  fc-case.o
fc-case.o: In function `main':
fc-case.c:(.text+0x21a): undefined reference to `__ctype_b'
collect2: ld returned 1 exit status
make[4]: ** [fc-case] Erro 1
make[4]: Saindo do diret?rio
`/home/evandro/obu4.old/buildroot/build_i686/fontconfig-2.4.2/fc-case'
make[3]: ** [all] Erro 2
make[3]: Saindo do diret?rio
`/home/evandro/obu4.old/buildroot/build_i686/fontconfig-2.4.2/fc-case'
make[2]: ** [all-recursive] Erro 1
make[2]: Saindo do diret?rio
`/home/evandro/obu4.old/buildroot/build_i686/fontconfig-2.4.2'
make[1]: ** [all] Erro 2
make[1]: Saindo do diret?rio
`/home/evandro/obu4.old/buildroot/build_i686/fontconfig-2.4.2'
make: **
[/home/evandro/obu4.old/buildroot/build_i686/fontconfig-2.4.2/.compiled]
Erro 2

How can I fix this?

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

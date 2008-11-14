From: malcolm blaney <mblaney@gmail.com>
Date: Fri, 14 Nov 2008 11:12:56 +1030
Subject: [Buildroot] TARGET_CONFIGURE_OPTS
In-Reply-To: <20081113140700.67b6db3b@surf>
References: <ce76e3890811122014sbad333ai2101488d14ddb7f5@mail.gmail.com>
	<20081113140700.67b6db3b@surf>
Message-ID: <ce76e3890811131642n159e96c5r769ed0e6080e599f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Nov 13, 2008 at 11:37 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> What are the error messages ? What version of Buildroot are you using ?

I'm using the latest svn co, which tells me 24010.

error message:

make[1]: Entering directory `/home/malcolm/buildroot/build_i386/dropbear-0.51'
/home/malcolm/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc
-Os  -I/home/malcolm/buildroot/build_i386/staging_dir/usr/include
-I/home/malcolm/buildroot/build_i386/staging_dir/include
-Wl,--rpath-link
-Wl,/home/malcolm/buildroot/build_i386/staging_dir/lib
-Wl,--rpath-link
-Wl,/home/malcolm/buildroot/build_i386/staging_dir/usr/lib -mtune=i386
-march=i386 -Os
-I/home/malcolm/buildroot/build_i386/staging_dir/usr/include
-I/home/malcolm/buildroot/build_i386/staging_dir/include
-Wl,--rpath-link
-Wl,/home/malcolm/buildroot/build_i386/staging_dir/lib
-Wl,--rpath-link
-Wl,/home/malcolm/buildroot/build_i386/staging_dir/usr/lib -mtune=i386
-march=i386   -c -o dbmulti.o dbmulti.c
In file included from includes.h:30,
                 from dbmulti.c:25:
options.h:436:2: error: #error You must compiled with either
DROPBEAR_CLIENT or DROPBEAR_SERVER selected
In file included from includes.h:124,
                 from dbmulti.c:25:
libtomcrypt/src/headers/tomcrypt.h:12:29: error: tomcrypt_custom.h: No
such file or directory
libtomcrypt/src/headers/tomcrypt.h:67:26: error: tomcrypt_cfg.h: No
such file or directory
libtomcrypt/src/headers/tomcrypt.h:68:29: error: tomcrypt_macros.h: No
such file or directory
libtomcrypt/src/headers/tomcrypt.h:69:29: error: tomcrypt_cipher.h: No
such file or directory
libtomcrypt/src/headers/tomcrypt.h:70:27: error: tomcrypt_hash.h: No
such file or directory
libtomcrypt/src/headers/tomcrypt.h:71:26: error: tomcrypt_mac.h: No
such file or directory
libtomcrypt/src/headers/tomcrypt.h:72:27: error: tomcrypt_prng.h: No
such file or directory
libtomcrypt/src/headers/tomcrypt.h:73:25: error: tomcrypt_pk.h: No
such file or directory
libtomcrypt/src/headers/tomcrypt.h:74:27: error: tomcrypt_math.h: No
such file or directory
libtomcrypt/src/headers/tomcrypt.h:75:27: error: tomcrypt_misc.h: No
such file or directory
libtomcrypt/src/headers/tomcrypt.h:76:29: error: tomcrypt_argchk.h: No
such file or directory
libtomcrypt/src/headers/tomcrypt.h:77:27: error: tomcrypt_pkcs.h: No
such file or directory
In file included from includes.h:125,
                 from dbmulti.c:25:
libtommath/tommath.h:95: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'mp_word'
make[1]: *** [dbmulti.o] Error 1

thanks,
Malcolm.

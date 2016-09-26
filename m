From: Paul <paul@bluecordial.com>
Date: Mon, 26 Sep 2016 15:48:36 +0100
Subject: [Buildroot] Buildroot nodejs 6.6.0
In-Reply-To: <CANCHnQrD=cPBZtJ62EKFYG527KGFFvc=hiPPPgLGLeQdWTLf5A@mail.gmail.com>
References: <6C0FD5AC-BA66-48C8-BC00-3F8393524B7B@bluecordial.com>
 <CAFGQKxf-pPGUuML2c6-0J4moQfJidxhRLcWOC8avA46gqHon7Q@mail.gmail.com>
 <CANCHnQrD=cPBZtJ62EKFYG527KGFFvc=hiPPPgLGLeQdWTLf5A@mail.gmail.com>
Message-ID: <1089D3EA-D19C-4E8C-90BB-00195366B606@bluecordial.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all.

 

This is the output when I try to use 6.6.0 using the 6.1.0 patch, thus creating new 6.6.0 folder and adding the has key in, changing BR2_NODEJS_VERSION=6.6.0;

 

 

>>> nodejs 6.6.0 Building

PATH="/opt/buildroot-toolchain-472/bin:/opt/buildroot-toolchain-472/sbin:/opt/buildroot-toolchain-472/usr/bin:/opt/buildroot-toolchain-472/usr/sbin:/home/paul/bin:/home/paul/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin" PYTHON=/opt/buildroot-toolchain-472/usr/bin/python2 /usr/bin/make -j5 -C /home/paul/Documents/AST/integra-buildroot/output/build/nodejs-6.6.0 PATH="/opt/buildroot-toolchain-472/bin:/opt/buildroot-toolchain-472/sbin:/opt/buildroot-toolchain-472/usr/bin:/opt/buildroot-toolchain-472/usr/sbin:/home/paul/bin:/home/paul/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin" AR="/opt/buildroot-toolchain-472/usr/bin/arm-buildroot-linux-gnueabi-ar" AS="/opt/buildroot-toolchain-472/usr/bin/arm-buildroot-linux-gnueabi-as" LD="/opt/buildroot-toolchain-472/usr/bin/arm-buildroot-linux-gnueabi-ld" NM="/opt/buildroot-toolchain-472/usr/bin/arm-buildroot-linux-gnueabi-nm" CC="/opt/buildroot-toolchain-472/usr/bin/arm-buildroot-linux-gnueabi-gcc" GCC="/opt/buildroot-toolchain-472/usr/bin/arm-buildroot-linux-gnueabi-gcc" CPP="/opt/buildroot-toolchain-472/usr/bin/arm-buildroot-linux-gnueabi-cpp" CXX="/opt/buildroot-toolchain-472/usr/bin/arm-buildroot-linux-gnueabi-g++" FC="/opt/buildroot-toolchain-472/usr/bin/arm-buildroot-linux-gnueabi-gfortran" RANLIB="/opt/buildroot-toolchain-472/usr/bin/arm-buildroot-linux-gnueabi-ranlib" READELF="/opt/buildroot-toolchain-472/usr/bin/arm-buildroot-linux-gnueabi-readelf" STRIP="/opt/buildroot-toolchain-472/usr/bin/arm-buildroot-linux-gnueabi-strip" OBJCOPY="/opt/buildroot-toolchain-472/usr/bin/arm-buildroot-linux-gnueabi-objcopy" OBJDUMP="/opt/buildroot-toolchain-472/usr/bin/arm-buildroot-linux-gnueabi-objdump" AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/opt/buildroot-toolchain-472/usr/bin/ccache /usr/bin/gcc" GCC_FOR_BUILD="/opt/buildroot-toolchain-472/usr/bin/ccache /usr/bin/gcc" CXX_FOR_BUILD="/opt/buildroot-toolchain-472/usr/bin/ccache /usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld" CPPFLAGS_FOR_BUILD="-I/opt/buildroot-toolchain-472/usr/include" CFLAGS_FOR_BUILD="-O2 -I/opt/buildroot-toolchain-472/usr/include" CXXFLAGS_FOR_BUILD="-O2 -I/opt/buildroot-toolchain-472/usr/include" LDFLAGS_FOR_BUILD="-L/opt/buildroot-toolchain-472/lib -L/opt/buildroot-toolchain-472/usr/lib -Wl,-rpath,/opt/buildroot-toolchain-472/usr/lib" FCFLAGS_FOR_BUILD="" DEFAULT_ASSEMBLER="/opt/buildroot-toolchain-472/usr/bin/arm-buildroot-linux-gnueabi-as" DEFAULT_LINKER="/opt/buildroot-toolchain-472/usr/bin/arm-buildroot-linux-gnueabi-ld" CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64? -Os " CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64? -Os " LDFLAGS="" FCFLAGS="" PKG_CONFIG="/opt/buildroot-toolchain-472/usr/bin/pkg-config" STAGING_DIR="/opt/buildroot-toolchain-472/usr/arm-buildroot-linux-gnueabi/sysroot" INTLTOOL_PERL=/usr/bin/perl PATH=/home/paul/Documents/AST/integra-buildroot/output/build/nodejs-6.6.0/bin:"/opt/buildroot-toolchain-472/bin:/opt/buildroot-toolchain-472/sbin:/opt/buildroot-toolchain-472/usr/bin:/opt/buildroot-toolchain-472/usr/sbin:/home/paul/bin:/home/paul/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin" LD="/opt/buildroot-toolchain-472/usr/bin/arm-buildroot-linux-gnueabi-g++"

/usr/bin/make -C out BUILDTYPE=Release V=1

? LD_LIBRARY_PATH=/home/paul/Documents/AST/integra-buildroot/output/build/nodejs-6.6.0/out/Release/lib.host:/home/paul/Documents/AST/integra-buildroot/output/build/nodejs-6.6.0/out/Release/lib.target:$LD_LIBRARY_PATH; export LD_LIBRARY_PATH; cd ../tools/icu; mkdir -p /home/paul/Documents/AST/integra-buildroot/output/build/nodejs-6.6.0/out/Release/obj/gen/icutmp; python icutrim.py -P "/home/paul/Documents/AST/integra-buildroot/output/build/nodejs-6.6.0/out/Release" -D ../../deps/icu-small/source/data/in/icudt57l.dat --delete-tmp -T "/home/paul/Documents/AST/integra-buildroot/output/build/nodejs-6.6.0/out/Release/obj/gen/icutmp" -F icu_small.json -O icudt57l.dat -v -L en,root

? touch 47dc1adc49f2b81e1082dac19d547163d9225782.intermediate

? LD_LIBRARY_PATH=/home/paul/Documents/AST/integra-buildroot/output/build/nodejs-6.6.0/out/Release/lib.host:/home/paul/Documents/AST/integra-buildroot/output/build/nodejs-6.6.0/out/Release/lib.target:$LD_LIBRARY_PATH; export LD_LIBRARY_PATH; cd ../deps/v8_inspector/third_party/v8_inspector/platform/v8_inspector; mkdir -p /home/paul/Documents/AST/integra-buildroot/output/build/nodejs-6.6.0/out/Release/obj/gen/blink/platform/v8_inspector/public/protocol /home/paul/Documents/AST/integra-buildroot/output/build/nodejs-6.6.0/out/Release/obj/gen/blink/platform/v8_inspector/protocol /home/paul/Documents/AST/integra-buildroot/output/build/nodejs-6.6.0/out/Release/obj/gen/blink/platform/inspector_protocol; python ../inspector_protocol/CodeGenerator.py --output_base "/home/paul/Documents/AST/integra-buildroot/output/build/nodejs-6.6.0/out/Release/obj/gen/blink/platform" --config inspector_protocol_config_stl.json

Options: {'verbose': 1, 'filterfile': 'icu_small.json', 'toolpath': '/home/paul/Documents/AST/integra-buildroot/output/build/nodejs-6.6.0/out/Release', 'deltmpdir': 1, 'outfile': 'icudt57l.dat', 'datfile': '../../deps/icu-small/source/data/in/icudt57l.dat', 'locales': 'en,root', 'endian': 'little', 'tmpdir': '/home/paul/Documents/AST/integra-buildroot/output/build/nodejs-6.6.0/out/Release/obj/gen/icutmp'}

icu_small.json: icutrim.py config: Trim down ICU to just a certain locale set, needed for node.js use.

/home/paul/Documents/AST/integra-buildroot/output/build/nodejs-6.6.0/out/Release/icupkg: 1: /home/paul/Documents/AST/integra-buildroot/output/build/nodejs-6.6.0/out/Release/icupkg: Syntax error: word unexpected (expecting ")")

FAILED: /home/paul/Documents/AST/integra-buildroot/output/build/nodejs-6.6.0/out/Release/icupkg -tl ../../deps/icu-small/source/data/in/icudt57l.dat /home/paul/Documents/AST/integra-buildroot/output/build/nodejs-6.6.0/out/Release/obj/gen/icutmp/icudt57l.dat

tools/icu/icudata.target.mk:13: recipe for target '/home/paul/Documents/AST/integra-buildroot/output/build/nodejs-6.6.0/out/Release/obj/gen/icutmp/icudt57l.dat' failed

make[3]: *** [/home/paul/Documents/AST/integra-buildroot/output/build/nodejs-6.6.0/out/Release/obj/gen/icutmp/icudt57l.dat] Error 1

make[3]: *** Waiting for unfinished jobs....

rm 47dc1adc49f2b81e1082dac19d547163d9225782.intermediate

Makefile:66: recipe for target 'node' failed

make[2]: *** [node] Error 2

package/pkg-generic.mk:195: recipe for target '/home/paul/Documents/AST/integra-buildroot/output/build/nodejs-6.6.0/.stamp_built' failed

make[1]: *** [/home/paul/Documents/AST/integra-buildroot/output/build/nodejs-6.6.0/.stamp_built] Error 2

Makefile:36: recipe for target '_all' failed

make: *** [_all] Error 2

 

Kind regards

Paul

 

From: Jeroen Roovers <jer@airfi.aero>
Date: Monday, 26 September 2016 at 15:40
To: Martin Bark <martin@barkynet.com>
Cc: Paul <paul@bluecordial.com>, <buildroot@buildroot.org>
Subject: Re: [Buildroot] Buildroot nodejs 6.6.0

 

I have seen no issues in testing 6.6.0 (bumped locally) on an armv7 target in the last week, and the bump involved no patching beyond what was already being done.

 

Kind regards,

     jer

 

On 26 September 2016 at 14:51, Martin Bark <martin@barkynet.com> wrote:

Paul,

 

I've been busy on other work recently so I've not had the time to bump the node version in buildroot for a while.  I do have some patches lined up to bump node to 6.6.0, however, I've held off submitting them because 6.7.0 is due tomorrow (see https://nodejs.org/en/blog/vulnerability/september-2016-security-releases/).  So i expect to submit some patches hopefully later this week to bump node to 6.7.0.

 

Note: please keep the buildroot mailing list in the loop

 

Thanks

 

Martin

 

 

On 26 September 2016 at 10:31, Paul <paul@bluecordial.com> wrote:

Hi Martin,

 

Sorry for the email. I?m trying to get nodejs 6.6.0 installed using buildroot and saw that you had done the patch for 6.1.0 and was wondering if you have a patch available for node 6.6.0 or could point me to some details of how this can be completed? The target is Armv7 softfloat.

 

Kind regards

Paul Ashford

 

Contact Information: 

m: +44 (0)7885 469812

e: paul at bluecordial.com

skype: paulashford1975

twitter: @pdashford

 


_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160926/5af6a5aa/attachment.html>

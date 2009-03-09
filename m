From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  9 Mar 2009 13:23:16 +0000 (UTC)
Subject: [Buildroot] [Bug 153] not able to build buildroot
In-Reply-To: <bug-153-163@https.bugs.busybox.net/>
References: <bug-153-163@https.bugs.busybox.net/>
Message-ID: <20090309132316.DF0FE764AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=153


Ruben P?ttmann <ruben@puettmann.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|FIXED                       |




--- Comment #2 from Ruben P?ttmann <ruben@puettmann.net>  2009-03-09 13:23:16 UTC ---

                   hy,


why gives the make menuconfig me the possibility to configure that, if it can
not work?


after make the changes to teh config it doesn't compile at all. Now I have this
error:


/root/buildroot-2009.02/build_x86_64/staging_dir/usr/bin/x86_64-linux-uclibc-gcc
-Os -pipe -Os  -I/root/buildroot-2009.02/build_x86_64/staging_dir/usr/include
-I/root/buildroot-2009.02/build_x86_64/staging_dir/include
--sysroot=/root/buildroot-2009.02/build_x86_64/staging_dir/ -isysroot
/root/buildroot-2009.02/build_x86_64/staging_dir -mtune=k8 -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -shared  .libs/SAX.o
.libs/entities.o .libs/encoding.o .libs/error.o .libs/parserInternals.o
.libs/parser.o .libs/tree.o .libs/hash.o .libs/list.o .libs/xmlIO.o
.libs/xmlmemory.o .libs/uri.o .libs/valid.o .libs/xlink.o .libs/HTMLparser.o
.libs/HTMLtree.o .libs/debugXML.o .libs/xpath.o .libs/xpointer.o
.libs/xinclude.o .libs/nanohttp.o .libs/nanoftp.o .libs/DOCBparser.o
.libs/catalog.o .libs/globals.o .libs/threads.o .libs/c14n.o .libs/xmlstring.o
.libs/xmlregexp.o .libs/xmlschemas.o .libs/xmlschemastypes.o .libs/xmlunicode.o
.libs/xmlreader.o .libs/relaxng.o .libs/dict.o .libs/SAX2.o .libs/xmlwriter.o
.libs/legacy.o .libs/chvalid.o .libs/pattern.o .libs/xmlsave.o
.libs/xmlmodule.o .libs/schematron.o  -Wl,--rpath
-Wl,/root/buildroot-2009.02/build_x86_64/staging_dir/usr/lib -Wl,--rpath
-Wl,/root/buildroot-2009.02/build_x86_64/staging_dir/usr/lib -ldl
-L/root/buildroot-2009.02/build_x86_64/staging_dir/lib
-L/root/buildroot-2009.02/build_x86_64/staging_dir/usr/lib -lz
/root/buildroot-2009.02/build_x86_64/staging_dir/usr/lib/libiconv.so -lm 
-mtune=k8 -mtune=k8 -Wl,-soname -Wl,libxml2.so.2 -o .libs/libxml2.so.2.6.32
/root/buildroot-2009.02/build_x86_64/staging_dir/usr/bin/../lib/gcc/x86_64-linux-uclibc/4.3.2/../../../../x86_64-linux-uclibc/bin/ld:
/root/buildroot-2009.02/build_x86_64/staging_dir/usr/lib/libz.a(crc32.o):
relocation R_X86_64_32 against `a local symbol' can not be used when making a
shared object; recompile with -fPIC
/root/buildroot-2009.02/build_x86_64/staging_dir/usr/lib/libz.a: could not read
symbols: Bad value
collect2: ld returned 1 exit status
make[3]: *** [libxml2.la] Error 1
make[3]: Leaving directory
`/root/buildroot-2009.02/build_x86_64/libxml2-2.6.32'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/root/buildroot-2009.02/build_x86_64/libxml2-2.6.32'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/root/buildroot-2009.02/build_x86_64/libxml2-2.6.32'
make: *** [/root/buildroot-2009.02/build_x86_64/libxml2-2.6.32/.stamp_built]
Error 2
root at app0:[~/buildroot-2009.02] > 

Is ist again a missconfiguration? Or something broken? 


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 4 Apr 2008 16:10:58 +0200
Subject: [Buildroot] ARCH=ppc vs powerpc
In-Reply-To: <0f4a01c8964f$bbc064b0$f52f9e86@LPSC0173W>
References: <87ve2xubdp.fsf@macbook.be.48ers.dk>
	<0f4a01c8964f$bbc064b0$f52f9e86@LPSC0173W>
Message-ID: <20080404141058.GA30388@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 04, 2008 at 02:30:52PM +0200, Guillaume Dargaud wrote:
>> Ok. I don't have such an old GCC on my system so I cannot test. Maybe
>> you will have more luck if you select GCC 3.4.6 in buildroot instead?
>
>Trying this right now...
>
>$ make
>[...]
>strip --strip-all -R .note -R .comment 
>/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-addr2line 
>/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-ar 
>/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-as 
>/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-c++filt 
>/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-cpp 
>/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-embedspu 
>/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-gcc 
>/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-gcc-3.4.6 
>/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-gcov 
>/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-gprof 
>/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-ld 
>/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-ldconfig 
>/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-ldd 
>/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-nm 
>/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-objcopy 
>/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-objdump 
>/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-ranlib 
>/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-readelf 
>/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-size 
>/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-strings 
>/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-strip
>strip: 
>/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-embedspu: 
>File format not recognized

http://repo.or.cz/w/buildroot.git?a=commit;h=bae48dfcac2cfb5b25a6ca6addfb0ce16aacbade

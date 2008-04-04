From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Fri, 4 Apr 2008 14:30:52 +0200
Subject: [Buildroot] ARCH=ppc vs powerpc
References: <0d2f01c894cc$1fb56540$f52f9e86@LPSC0173W><8763v071sq.fsf@macbook.be.48ers.dk>
	<20080402164154.GE9436@mx.loc><0ddc01c89583$84ecb960$f52f9e86@LPSC0173W><87ej9n2kj4.fsf@macbook.be.48ers.dk><0e8d01c89595$e3482140$f52f9e86@LPSC0173W><87bq4r0ybx.fsf@macbook.be.48ers.dk><0e9b01c895a0$47d11590$f52f9e86@LPSC0173W><87ej9mvygr.fsf@macbook.be.48ers.dk><0efa01c89632$9b7d9910$f52f9e86@LPSC0173W><8763uyufji.fsf@macbook.be.48ers.dk><0f2901c8963e$92fc82e0$f52f9e86@LPSC0173W>
	<87ve2xubdp.fsf@macbook.be.48ers.dk>
Message-ID: <0f4a01c8964f$bbc064b0$f52f9e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Ok. I don't have such an old GCC on my system so I cannot test. Maybe
> you will have more luck if you select GCC 3.4.6 in buildroot instead?

Trying this right now...

$ make
[...]
strip --strip-all -R .note -R .comment 
/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-addr2line 
/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-ar 
/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-as 
/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-c++filt 
/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-cpp 
/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-embedspu 
/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-gcc 
/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-gcc-3.4.6 
/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-gcov 
/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-gprof 
/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-ld 
/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-ldconfig 
/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-ldd 
/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-nm 
/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-objcopy 
/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-objdump 
/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-ranlib 
/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-readelf 
/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-size 
/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-strings 
/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-strip
strip: 
/home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-embedspu: 
File format not recognized
make: *** 
[/home/guinevere/buildroot/toolchain_build_powerpc/gcc-3.4.6-final/.installed] 
Error 1

And nothing changes no matter if I try strip, sstrip or none...
-- 
Guillaume Dargaud
http://www.gdargaud.net/

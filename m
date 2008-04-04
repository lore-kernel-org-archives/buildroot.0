From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Apr 2008 13:07:14 +0200
Subject: [Buildroot] ARCH=ppc vs powerpc
In-Reply-To: <0f2901c8963e$92fc82e0$f52f9e86@LPSC0173W> (Guillaume Dargaud's
	message of "Fri\, 4 Apr 2008 12\:28\:02 +0200")
References: <0d2f01c894cc$1fb56540$f52f9e86@LPSC0173W>
	<8763v071sq.fsf@macbook.be.48ers.dk> <20080402164154.GE9436@mx.loc>
	<0ddc01c89583$84ecb960$f52f9e86@LPSC0173W>
	<87ej9n2kj4.fsf@macbook.be.48ers.dk>
	<0e8d01c89595$e3482140$f52f9e86@LPSC0173W>
	<87bq4r0ybx.fsf@macbook.be.48ers.dk>
	<0e9b01c895a0$47d11590$f52f9e86@LPSC0173W>
	<87ej9mvygr.fsf@macbook.be.48ers.dk>
	<0efa01c89632$9b7d9910$f52f9e86@LPSC0173W>
	<8763uyufji.fsf@macbook.be.48ers.dk>
	<0f2901c8963e$92fc82e0$f52f9e86@LPSC0173W>
Message-ID: <87ve2xubdp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillaume" == Guillaume Dargaud <dargaud@lpsc.in2p3.fr> writes:

Hi,

 >> gcc version 4.1.3 20070831 (prerelease) (Debian 4.1.2-16)

 Guillaume> I'm on Scientific Linux, a clone of Red Hat.

 Guillaume> $ gcc -v
 Guillaume> Reading specs from /usr/lib/gcc/i386-redhat-linux/3.4.6/specs
 Guillaume> Configured with: 
 Guillaume> ../configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info 
 Guillaume>  --enable-shared --enable-threads=posix --disable-checking --with-system-zlib 
 Guillaume>  --enable-__cxa_atexit --disable-libunwind-exceptions --enable-java-awt=gtk  
 Guillaume> --host=i386-redhat-linux
 Guillaume> Thread model: posix
 Guillaume> gcc version 3.4.6 20060404 (Red Hat 3.4.6-9)

Ok. I don't have such an old GCC on my system so I cannot test. Maybe
you will have more luck if you select GCC 3.4.6 in buildroot instead?

-- 
Bye, Peter Korsgaard

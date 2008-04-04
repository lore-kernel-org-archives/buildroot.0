From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Fri, 4 Apr 2008 12:28:02 +0200
Subject: [Buildroot] ARCH=ppc vs powerpc
References: <0d2f01c894cc$1fb56540$f52f9e86@LPSC0173W><8763v071sq.fsf@macbook.be.48ers.dk>
	<20080402164154.GE9436@mx.loc><0ddc01c89583$84ecb960$f52f9e86@LPSC0173W><87ej9n2kj4.fsf@macbook.be.48ers.dk><0e8d01c89595$e3482140$f52f9e86@LPSC0173W><87bq4r0ybx.fsf@macbook.be.48ers.dk><0e9b01c895a0$47d11590$f52f9e86@LPSC0173W><87ej9mvygr.fsf@macbook.be.48ers.dk><0efa01c89632$9b7d9910$f52f9e86@LPSC0173W>
	<8763uyufji.fsf@macbook.be.48ers.dk>
Message-ID: <0f2901c8963e$92fc82e0$f52f9e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> What Linux distribution and what version of gcc/cpp are you using?
>
> I'm using:
> % gcc -v                                                     ~
> Using built-in specs.
> Target: x86_64-linux-gnu
> Configured with: 
> ../src/configure -v --enable-languages=c,c++,fortran,objc,obj-c++,treelang 
>  --prefix=/usr --enable-shared --with-system-zlib --libexecdir=/usr/lib --without-included-gettext 
>  --enable-threads=posix --enable-nls --with-gxx-include-dir=/usr/include/c++/4.1.3 
>  --program-suffix=-4.1 --enable-__cxa_atexit --enable-clocale=gnu --enable-libstdcxx-debug 
>  --enable-mpfr --enable-checking=release x86_64-linux-gnu
> Thread model: posix
> gcc version 4.1.3 20070831 (prerelease) (Debian 4.1.2-16)

I'm on Scientific Linux, a clone of Red Hat.

$ gcc -v
Reading specs from /usr/lib/gcc/i386-redhat-linux/3.4.6/specs
Configured with: 
../configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info 
 --enable-shared --enable-threads=posix --disable-checking --with-system-zlib 
 --enable-__cxa_atexit --disable-libunwind-exceptions --enable-java-awt=gtk  
--host=i386-redhat-linux
Thread model: posix
gcc version 3.4.6 20060404 (Red Hat 3.4.6-9)

I'm more used to gentoo or Ubuntu than RedHat, but apparently that version 
of gcc is up to date with the repository.

-- 
Guillaume Dargaud
http://www.gdargaud.net/

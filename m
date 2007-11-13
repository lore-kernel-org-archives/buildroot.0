From: Andreas Aronsson <anar@Syntronic.se>
Date: Tue, 13 Nov 2007 15:14:11 +0100
Subject: [Buildroot] Could not find libgcj.so*
In-Reply-To: <951b8d920711130535r232360f7td6c94608b4bf54f9@mail.gmail.com>
References: <951b8d920711130535r232360f7td6c94608b4bf54f9@mail.gmail.com>
Message-ID: <1194963251.31529.3.camel@salome.goteborg.syntronic.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

First, I believe that best practice is to have the locale set to english
which makes it easier to help.  

Second, out of curiosity, what does

grep BR2_INSTALL_LIBGCJ $(BULDROOTDIR).config

Render? 



On Tue, 2007-11-13 at 10:35 -0300, Felipe Uderman wrote:

> Hello, 
> 
> I am trying to use buildroot to build a uCLinux image for the ARM
> architecture, for testing. It seens that some files that are suposed
> to be copied on the build process could not be found. 
> 
> cp
> -dpf /home/uderman/udAPP/buildroot/build_arm/staging_dir/lib/libgcj.so* /home/uderman/udAPP/buildroot/project_build_arm/teste01/root/lib/ 
> cp: imposs?vel fazer stat em
> `/home/uderman/udAPP/buildroot/build_arm/staging_dir/lib/libgcj.so*':
> Arquivo ou diret?rio inexistente
> make: **
> [/home/uderman/udAPP/buildroot/toolchain_build_arm/gcc-4.2.1-final/.libs_installed] Erro 1 
> 
> This is the contents of the directory that it is trying to find the
> libgcj.so* files:
> 
> uderman at udermanlp:~/udAPP/buildroot$
> ls /home/uderman/udAPP/buildroot/build_arm/staging_dir/lib/
> ld-uClibc-0.9.29.so  libcrypt-0.9.29.so  libc.so.0        libdl.so.0
> libm.so.0         libnsl.so.0           libpthread.so.0
> libresolv.so.0   librt.so.0           libutil-0.9.29.so
> ld-uClibc.so.0       libcrypt.so.0       libdl-0.9.29.so
> libm-0.9.29.so  libnsl-0.9.29.so  libpthread-0.9.29.so
> libresolv-0.9.29.so  librt-0.9.29.so  libuClibc-0.9.29.so
> libutil.so.0
> 
> Can anyone please help me?
> 
> Thank you, 
> 
> Uderman
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

--
Andreas Aronsson

Konsult

SYNTRONIC AB

?gatan 32

431 35 M?lndal, Sweden

Phone: +46(0)31-746 81 09

Fax: +46(0)31-746 81 07

Email: anar at syntronic.com


-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071113/48f717e9/attachment.htm 

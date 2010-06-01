From: Microbit_Ubuntu <microbit@virginbroadband.com.au>
Date: Tue, 01 Jun 2010 20:23:31 +1000
Subject: [Buildroot] Buildroot 2010.05-rc3 released :: 2 build errors -
 lockfile-progs & gdb
In-Reply-To: <87vda5suz0.fsf@macbook.be.48ers.dk>
References: <877hmpv7km.fsf@macbook.be.48ers.dk>
	<1275007047.6387.17.camel@ubuntu> <87vda5suz0.fsf@macbook.be.48ers.dk>
Message-ID: <1275387811.1624.6.camel@ubuntu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sun, 2010-05-30 at 09:35 +0200, Peter Korsgaard wrote:
> >>>>> "Microbit" == Microbit Ubuntu <microbit@virginbroadband.com.au> writes:
> 
>  Microbit> I still come across 2 build errors with rc3 :
> 
>  Microbit> 1. lockfile-progs-0.1.11
>  Microbit> ========================
>  Microbit> The generated Makefile causes a build error in :
>  Microbit> CFLAGS    := -g -Wall -Werror -O2
>  Microbit> I still need to remove the -Werror to resume the build ??
> 
>  Microbit> 2. gdb symlink
>  Microbit> ==============
>  Microbit> ct-ng generates arm-unknown-linux-uclibcgnueabi where I have
>  Microbit> arm-elf-xxx as an alias.
>  Microbit> The build stops when the symlink for gdb fails. I need to manually
>  Microbit> insert a folder 'arm-unknown-linux-uclibcgnueabi' with 'bin' as a
>  Microbit> subfolder under ../output/staging/usr
> 
> Both issues should be fixed in git now.
> 

Thanks for reviewing. 
Does this mean the fix is also in final 2010.05 tarball ?
(I'm not used to git, I probably should learn, have been thinking about
using it for my CVS)

B rgds
Kris

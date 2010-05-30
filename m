From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 30 May 2010 09:35:15 +0200
Subject: [Buildroot] Buildroot 2010.05-rc3 released :: 2 build errors -
	lockfile-progs & gdb
In-Reply-To: <1275007047.6387.17.camel@ubuntu> (Microbit Ubuntu's message of
	"Fri, 28 May 2010 10:37:27 +1000")
References: <877hmpv7km.fsf@macbook.be.48ers.dk>
	<1275007047.6387.17.camel@ubuntu>
Message-ID: <87vda5suz0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Microbit" == Microbit Ubuntu <microbit@virginbroadband.com.au> writes:

 Microbit> I still come across 2 build errors with rc3 :

 Microbit> 1. lockfile-progs-0.1.11
 Microbit> ========================
 Microbit> The generated Makefile causes a build error in :
 Microbit> CFLAGS    := -g -Wall -Werror -O2
 Microbit> I still need to remove the -Werror to resume the build ??

 Microbit> 2. gdb symlink
 Microbit> ==============
 Microbit> ct-ng generates arm-unknown-linux-uclibcgnueabi where I have
 Microbit> arm-elf-xxx as an alias.
 Microbit> The build stops when the symlink for gdb fails. I need to manually
 Microbit> insert a folder 'arm-unknown-linux-uclibcgnueabi' with 'bin' as a
 Microbit> subfolder under ../output/staging/usr

Both issues should be fixed in git now.

-- 
Bye, Peter Korsgaard

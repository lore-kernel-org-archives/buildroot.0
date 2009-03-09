From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 09 Mar 2009 21:06:30 +0100
Subject: [Buildroot] uClibc compilation problem
In-Reply-To: <200903092009.25554.miciu@gmx.de> (Michael Unterkalmsteiner's
	message of "Mon\, 9 Mar 2009 20\:09\:25 +0100")
References: <200903092009.25554.miciu@gmx.de>
Message-ID: <87sklmbgvt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Unterkalmsteiner <miciu@gmx.de> writes:

 Michael> Hi, 

 Michael> I'd like to build a toolchain for mips with nommu (using
 Michael> buildroot-2009.02). I get the following error:

Please post your .config

 Michael> [...]  
 Michael>   CC libc/stdio/tmpnam.o
 Michael>   CC libc/stdio/tmpnam_r.o
 Michael>   CC libc/stdio/popen.o
 Michael> libc/stdio/popen.c:45: error: 'fork' undeclared here (not in a function)
 Michael> libc/stdio/popen.c:45: warning: type defaults to 'int' in declaration of 
 Michael> 'fork'
 Michael> libc/stdio/popen.c: In function 'popen':
 Michael> libc/stdio/popen.c:100: error: called object 'fork' is not a function
 Michael> [...]

You might have more luck asking on the uclibc mailing list.

-- 
Bye, Peter Korsgaard

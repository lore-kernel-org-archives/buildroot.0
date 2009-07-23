From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Jul 2009 13:58:58 +0200
Subject: [Buildroot] error about compile gcc
In-Reply-To: <3a665c760907230115w47500c7ai1e7a8339f01e907a@mail.gmail.com>
	(loody's message of "Thu\, 23 Jul 2009 16\:15\:17 +0800")
References: <3a665c760907230115w47500c7ai1e7a8339f01e907a@mail.gmail.com>
Message-ID: <87prbrbofx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "loody" == loody  <miloody@gmail.com> writes:

 loody> Dear all:
 loody> I use buildroot to build mipsel toolchain and I got the error message below:
 loody> /media/sda6/uclinux/toolchain/mips/temp/buildroot-2009.05/build_mipsel/staging_dir/usr/include/unistd.h:243:
 loody> error: two or more data types in declaration specifiers

 loody> I have google the error
 loody> message,http://osdir.com/ml/lib.uclibc.buildroot/2007-06/msg00076.html,
 loody>  but the error still exist even I use "--disable-libmudflap ".

Please provide a bit more info. Could you do a clean rebuild and attach
the (compressed) logfile together with your .config?

Do something like:

rm -rf *build_*
make 2>&1 >log.txt

-- 
Bye, Peter Korsgaard

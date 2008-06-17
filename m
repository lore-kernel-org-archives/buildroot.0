From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 17 Jun 2008 21:04:46 +0200
Subject: [Buildroot] Problem with buildroot and external toolchain
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190918260A@mi8nycmail19.Mi8.com>
	(hartleys@visionengravers.com's message of "Tue\,
	17 Jun 2008 14\:57\:15 -0400")
References: <BD79186B4FD85F4B8E60E381CAEE1909182568@mi8nycmail19.Mi8.com>
	<20080617183841.GA18089@real.realitydiluted.com>
	<BD79186B4FD85F4B8E60E381CAEE190918260A@mi8nycmail19.Mi8.com>
Message-ID: <87k5gng9wx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "hartleys" == hartleys  <hartleys@visionengravers.com> writes:

Hi,

 hartleys> But, like I said, the copy_toolchain_lib_root is locating
 hartleys> the files but not actually copying them. If I manually copy
 hartleys> the files to the root file system everything works fine.

Does <cross>-gcc -printf-file-name=<lib> give the right path? Have you
seen the new defaults I added to those settings lately? Those work for
me with a uclibc toolchain.

-- 
Bye, Peter Korsgaard

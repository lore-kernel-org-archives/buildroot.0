From: hartleys <hartleys@visionengravers.com>
Date: Tue, 17 Jun 2008 15:13:44 -0400
Subject: [Buildroot] Problem with buildroot and external toolchain
In-Reply-To: <87k5gng9wx.fsf@macbook.be.48ers.dk>
References: <BD79186B4FD85F4B8E60E381CAEE1909182568@mi8nycmail19.Mi8.com><20080617183841.GA18089@real.realitydiluted.com><BD79186B4FD85F4B8E60E381CAEE190918260A@mi8nycmail19.Mi8.com>
	<87k5gng9wx.fsf@macbook.be.48ers.dk>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190918262C@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard write:
> Hi,
>
> Does <cross>-gcc -printf-file-name=<lib> give the right path? Have 
> you seen the new defaults I added to those settings lately? Those
> work for me with a uclibc toolchain.

$ arm-linux-gcc -print-file-name=libc.so.0
/usr/local/arm/4.1.1-920t/lib/gcc/arm-linux-uclibc/4.1.1/../../../../arm
-linux-uclibc/lib/libc.so.0

Yes the path is correct. That directory has all the library files.

What defaults are you referring to? If it's the
BR2_TOOLCHAIN_EXTERNASL_LIBS then I have not modified it from the
default.

Hartley 

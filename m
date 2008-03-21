From: John Voltz <john.voltz@gmail.com>
Date: Fri, 21 Mar 2008 07:36:00 -0400
Subject: [Buildroot] avr32 patches vs. x86 breakage
In-Reply-To: <87wsnwzakv.fsf@macbook.be.48ers.dk>
References: <1206079232.2562.60.camel@nigel-x60>
	<87k5jw34gp.fsf@macbook.be.48ers.dk> <20080321085200.GB8894@mx.loc>
	<87hcf01m0r.fsf@macbook.be.48ers.dk>
	<87wsnwzakv.fsf@macbook.be.48ers.dk>
Message-ID: <46a136670803210436s6f464029jb6f48b6319aa765a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I agree with Bernhard, the AVR32 arch gcc patches seriously need fixed.
There are quite a few problems caused by gcc on the AVR32 as well. It works
pretty well for the most part, but there were problems back with gcc
4.1.2causing the kernel to oops while reading ext2 and ext3
filesystems, and now
gcc 4.2.1 breaks blackbox, and I've never been able to get webkit to work
reliably. gcc 4.2.1 also broke almost all of the open file dialogs in the
applications too. I'm blaming it all on the gcc patches.

Have there been other issues with buildroot in the past when adding other
arches? I'm actually glad all of this happened because it shines a light on
the quality issues in the AVR32 patches. Thanks to Nigel and Peter. I would
have never discovered this on my own. Sorry for giving you guys the
headaches though!

John Voltz
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080321/b9b4eabc/attachment.htm 

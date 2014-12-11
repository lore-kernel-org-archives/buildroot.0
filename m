From: Spielmann Werner <Werner.Spielmann@SWAROVSKI.COM>
Date: Thu, 11 Dec 2014 12:27:08 +0000
Subject: [Buildroot] Configuration for real hardware / How to configure RTAI
Message-ID: <49ce82b7b4944480badd427cb51c4950@dsw332.wattens.swarovski.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I was able to pass "make" (for a x86 configuration: kernel 2.6.32.11, rtai 3.8.1, gcc 4.5.4)  for the first time (with the help of Peter Koorsgard).

I found this document:  http://elinux.org/images/2/2a/Using-buildroot-real-project.pdf

But I still have several questions:


*         How can I adapt the configuration to my real hardware?

I want to use a x86 architecture with is nearly a standard PC with flash cards.

Have I to configure a board/ directory and a configs/ directory for this Board?

The Ethernet devices will need the Intel e1000e-Driver, the serial devices a 8250/16550 driver...

Can you give me any pointers?


*         To configure RTAI on a standard PC I have to execute within the RTAI directory (before building the kernel):


   "make menuconfig"



and then:



    "make"

When and how can I configure RTAI in combination with buildroot?

Thanks for reading. Any help is appreciated!

Werner

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141211/ca8bf054/attachment.html>

From: Spielmann Werner <Werner.Spielmann@SWAROVSKI.COM>
Date: Tue, 16 Dec 2014 15:19:34 +0000
Subject: [Buildroot] Second try: Configuration for real hardware / How to
	configure RTAI
Message-ID: <d4a8b511599845a89f0c34664c0ed8b1@dsw332.wattens.swarovski.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

this is my second try...    :-(    Any help is appreciated!


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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141216/3ca2a0bc/attachment.html>

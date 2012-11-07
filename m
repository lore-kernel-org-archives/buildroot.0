From: Wu, Woody <Woody.Wu@landisgyr.com>
Date: Wed, 7 Nov 2012 03:26:25 +0100
Subject: [Buildroot] Build a Linux on a Customized Board (SAMSUNG S3C2410
	ARM)
Message-ID: <8D7B975D62E20A43BFBC3E04F56C6F29AB6678A6DD@FRPARSV10.mx.bm.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, List

I want to build a Linux system on a customized board.  I desire to get professional suggestions from you about how possible to have the task done with buildroot.  I also like to know your suggestions what else if not buildroot I still need to go for a learn.

I don't so much care what the version of the resulting OS kernel, I just know a need a c lib to support a set of C applications that originally run on the board.

The board current already had a Linux OS run on it, together with our applications.  I have on-hand three binary image files, a boot loader,
a kernel image and a root file system image.  But I don't have the source.  Several guys prepared the board and the OS for our company, but it's long long time ago.  These guys had already dismissed their some company and we lost contacts to them.

I know there have one or two customized drivers inside the kernel, but don't know what they are.  I also know, there is a CPLD chip on the board that is doing some memory mapping to translate between virtual addresses to some peripherals.  I see 4 pcs of 16C554DIQ(D2) chips on the board.

The CPU is a SAMSUNG S3C2410AL-20 ARM. Other common peripherals on the board includes: flash chips, SD card, Ethernet ports.

For the unclear hardware, I have a hardware guy who can support me to clarify the functionality of the hardware part. But, as the only firmware guy, I have to build and prepare the Linux OS.  We cannot use the original binary version of Linux any more because we cannot extend that for new needs.

Where should I start? And, whether the famous Buildroot can save my ass?  It will be highly appreciated if you give me any suggestions and clues.

--
woody


P PLEASE CONSIDER OUR ENVIRONMENT BEFORE PRINTING THIS EMAIL.

This e-mail (including any attachments) is confidential and may be legally privileged. If you are not an intended recipient or an authorized representative of an intended recipient, you are prohibited from using, copying or distributing the information in this e-mail or its attachments. If you have received this e-mail in error, please notify the sender immediately by return e-mail and delete all copies of this message and any attachments. Thank you.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121107/cd045555/attachment-0001.html>

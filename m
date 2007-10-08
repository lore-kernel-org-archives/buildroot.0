From: Jorge S. <jorgesolla@gmail.com>
Date: Mon, 8 Oct 2007 17:04:30 +0200
Subject: [Buildroot] Best buildroot options for a custom AT91RM9200 board?
Message-ID: <6090c5eb0710080804n3f6d4f0bj42b0d31d24d01e9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi,

 I'm trying to create a root fs for a custom board wich is AT91rm9200 based.
So i have several newbie (maybe dumb) questions.

I've started with the svn version of buildroot and after dealing with lots
of "soft-float"/uCLibc problems i finally discovered that
there's a prebuilt setup from the Atmel people that seems to work.

Since the AT91.com buildroot project section is broken, im unable to find
further documentation regarding this matter appart from some posts from Ulf
Samuelsson on this list.

Can somebody tell me wich version is best for the AT91RM9200? I only see 2
options:

1) Last buildroot svn version
2)
ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_Host/Buildroot/buildroot-20070116-RC2.tar.bz2

Are there any other options?

And the last question, I'm using a 8MB Spi DataFlash for storage, so my
rootFS cannot grow more than 6 MB (since i use at least 2MB for bootloader,
kernel and other stuff) is there any "must have" minimal configuration
recommended?



Thanks all for your time and sorry about my poor english.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071008/e8c09e2a/attachment.htm 

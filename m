From: Ted Wood <ted@fgh.co.uk>
Date: Thu, 3 Jan 2013 16:14:59 -0000
Subject: [Buildroot] Building For 486
Message-ID: <000301cde9cd$7b4bb8e0$71e32aa0$@co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to use Buildroot to build an image for a Vortex 6326D SBC with a
486 processor.

 

Even if I set the processor options to 486 using  menuconfig, when I try to
run it, the built kernel comes up with the message 

 

"This kernel requires an i586 CPU, but only detected an i486 CPU. Unable to
boot please use a kernel appropriate for your CPU"

 

Is it that the Linux kernel simply does not support 486 processors after a
certain version?

 

 

 

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130103/41f293a6/attachment.html>

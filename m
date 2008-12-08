From: Tim Barr <tbarr@multitech.com>
Date: Mon, 8 Dec 2008 11:59:01 -0600
Subject: [Buildroot] How do I use buildroot to create a build process for my
	board design
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E60F0E596A@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a board design that is a modified version of the Atmel 9g20EK. I
had to change some pin definitions which means the board-sam9g20ek.c
file will be slightly different from the one supplied with the kernel.
There are also some config file changes as well. What I need to do is to
be able to supply these changes to someone else so that they can
successfully compile a kernel for my board, using buildroot. Looking at
the main config file in buildroot, it looks like there is a way to apply
additional patches to the kernel after the at91 patch
(BR2_LINUX_BSP_PATCH). Is this a good way to set up buildroot for this
situation? 
 
Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
 <mailto:tbarr@multitech.com> tbarr at multitech.com


 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081208/9505ee71/attachment-0001.htm 

From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 20 Aug 2007 18:05:56 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel
In-Reply-To: <20070819231307.E3573A5D35@busybox.net>
References: <20070819231307.E3573A5D35@busybox.net>
Message-ID: <20070820160556.GG23522@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 19, 2007 at 04:13:07PM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-08-19 16:13:06 -0700 (Sun, 19 Aug 2007)
>New Revision: 19582
>
>Log:
>Add kernel patches, if at91 or avr32 is selected
>
>Modified:
>   trunk/buildroot/target/device/Atmel/Makefile.in
>
>
>Changeset:
>Modified: trunk/buildroot/target/device/Atmel/Makefile.in
>===================================================================
>--- trunk/buildroot/target/device/Atmel/Makefile.in	2007-08-19 22:57:25 UTC (rev 19581)
>+++ trunk/buildroot/target/device/Atmel/Makefile.in	2007-08-19 23:13:06 UTC (rev 19582)
>@@ -44,18 +44,20 @@
> 
> LINUX26_COPYTO:=/tftpboot
> 
>+ifeq	($(DEFAULT_KERNEL_HEADERS),2.6.22.1)

whitespace damaged..

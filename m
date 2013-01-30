From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jan 2013 16:06:11 +0100
Subject: [Buildroot] [git commit] busybox: add 1.19.4 / 1.20.2 fixes
In-Reply-To: <510932A5.4080303@neotion.com>
References: <20120904110844.1439997180@busybox.osuosl.org>
 <510932A5.4080303@neotion.com>
Message-ID: <20130130160611.79cee153@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Emmanuel BOUAZIZ,

On Wed, 30 Jan 2013 15:48:05 +0100, Emmanuel BOUAZIZ wrote:

> I don't know what this patch is for, but it breaks the TFTP_SERVER_NAME option for me. The $tftp variable now contains
> "bad" instead or the TFTP server name (I use it in udhcpc.script). When I remove the patch, it works fine again.

This patch comes directly from the Busybox community, so I would
suggest that you report your bug to the Busybox community, saying that
you're using the 1.19.4 version +
http://busybox.net/downloads/fixes-1.19.4/busybox-1.19.4-udhcp.patch,
and the problem that you have.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

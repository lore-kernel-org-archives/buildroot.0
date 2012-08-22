From: Stefan Froberg <stefan.froberg@petroprogram.com>
Date: Thu, 23 Aug 2012 01:11:54 +0300
Subject: [Buildroot] [PATCH] freetype, libfuse, libpng, x11vnc,
	zlib: get rid of BR2_SOURCEFORGE_MIRROR
Message-ID: <1345673515-1719-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting point of kicking that useless BR2_SOURCEFORGE_MIRROR 
variable out and using sourceforges mirror autoselection.

This will ensure that there will be always some mirror available
and maybe fast one too (Hurrah! 3G modem users shout ;) )

If someone *still* want's to have sourceforge mirror forcing then
that could probably be possible with the hacking of 
package/pkg-download.mk and adding special handling of 
BR2_SOURCEFORGE_MIRROR variable in DOWNLOAD_INNER.


Regards:
Stefan Froberg

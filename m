From: Marc Gauthier <marc@tensilica.com>
Date: Sun, 13 Jan 2013 10:33:02 -0800
Subject: [Buildroot] [Linux-Xtensa] Error when building the kernel when
 using the latest 2012.11 buildroot version.
In-Reply-To: <CAJH6qSft-_wOWfwyidoXRprAHkrCQL-bwemDb3d2PqYRoEED6A@mail.gmail.com>
References: <CAJH6qSft-_wOWfwyidoXRprAHkrCQL-bwemDb3d2PqYRoEED6A@mail.gmail.com>
Message-ID: <522C1DF17AF50042AD8AE87F7887BD3D0B618091AF@exch.hq.tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vadim,

Are you using the same Xtensa core config overlay in both cases?  The ATOMCTL register appeared in RC-2009.0, so is processor-config dependent, your toolchain might not recognize it if not built properly.  Or, perhaps the issue relates to how the core config overlay is installed under buildroot.

-Marc



________________________________
From: linux-xtensa-bounces@linux-xtensa.org [mailto:linux-xtensa-bounces at linux-xtensa.org] On Behalf Of Vadim Malenboim
Sent: Saturday, January 12, 2013 21:18
To: linux-xtensa at linux-xtensa.org; buildroot
Subject: [Linux-Xtensa] Error when building the kernel when using the latest 2012.11 buildroot version.


When trying to build the 2.6.29<tel:2.6.29>-amp kernel with buildroot 2012.11 compiled toolchain I receive the following error
"Invalid register ATOMCTL for wsr instruction".

This error doesn't happens when using the 2012.11-rc11 buildroot toolchain.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130113/72fff2d4/attachment-0001.html>

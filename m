From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Feb 2013 18:30:12 +0100
Subject: [Buildroot] [PATCH] new package: iso-codes
In-Reply-To: <1361118896-2263-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1361118896-2263-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <20130217183012.73c87347@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Sun, 17 Feb 2013 18:34:56 +0200, Stefan Fr?berg wrote:

> +	select BR2_PACKAGE_GETTEXT

Are you sure it really needs gettext as a build dependency?

Also, this seems to install a big bunch of files. Maybe
network-manager-applet needs only some of the ISOxyz files, and
therefore having suboptions to select which ISOxyz set of files should
be installed would be useful?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

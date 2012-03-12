From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Mar 2012 18:32:41 +0100
Subject: [Buildroot] [PATCH] Add (Freescale) elftosb host package
In-Reply-To: <1331560507-12444-1-git-send-email-eric.jarrige@armadeus.org>
References: <1331560507-12444-1-git-send-email-eric.jarrige@armadeus.org>
Message-ID: <20120312183241.56f78a30@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eric,

Thanks for this patch. See comments below.

Le Mon, 12 Mar 2012 14:55:07 +0100,
Eric Jarrige <eric.jarrige@armadeus.org> a ?crit :

> diff --git a/package/elftosb/elftosb10.12.01-fixes_includes.patch b/package/elftosb/elftosb10.12.01-fixes_includes.patch
> new file mode 100644
> index 0000000..5e31233
> --- /dev/null
> +++ b/package/elftosb/elftosb10.12.01-fixes_includes.patch

This patch should include a description and a Signed-off-by line.

Moreover, who is using this host-elftosb package at the moment? Do you
intend to send some further package to the linux package to make use of
it? Or should this package be presented to the user in the "Host
utilities" submenu?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

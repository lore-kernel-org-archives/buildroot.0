From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 00:58:29 +0200
Subject: [Buildroot] [PATCH v14 2/4] busybox: applets as individual
 binaries
In-Reply-To: <20170703210051.3457-2-arnout@mind.be>
References: <20170703210051.3457-1-arnout@mind.be>
 <20170703210051.3457-2-arnout@mind.be>
Message-ID: <20170704005829.442f4a82@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 3 Jul 2017 23:00:49 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:

> +ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),y)
> +define BUSYBOX_PERMISSIONS
> +	/usr/share/udhcpc/default.script f 755  0  0 - - - - -

This shouldn't have been added by this patch, so I've dropped this
line. And applied your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

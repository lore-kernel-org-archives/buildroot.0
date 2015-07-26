From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 23:39:01 +0200
Subject: [Buildroot] [PATCH 06/12] libiscsi: Bump version
In-Reply-To: <1437943118-18060-7-git-send-email-maxime.hadjinlian@gmail.com>
References: <1437943118-18060-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1437943118-18060-7-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150726233901.5305d5bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 26 Jul 2015 22:38:32 +0200, Maxime Hadjinlian wrote:
> Patches were applied upstream so they are removed.

Since you did the research, it would have good to put the pointers to
the upstream commits for the respective patches.

> +# Note: Upstream can be found at:
> +# https://github.com/sahlberg/libiscsi

Comment not needed, since the Config.in help text already mentions that
as the help text.

>  LIBISCSI_SITE = https://sites.google.com/site/libiscsitarballs/libiscsitarballs

So in the end, we're still using Google? Or maybe sites.google.com is
not disappearing?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 23:59:21 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libssh: bump version to
 0.8.1
In-Reply-To: <20180818093759.26718-1-bernd.kuhls@t-online.de>
References: <20180818093759.26718-1-bernd.kuhls@t-online.de>
Message-ID: <20180820235921.4c73ff15@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Aug 2018 11:37:59 +0200, Bernd Kuhls wrote:
> Fixed broken _SITE, added license hash.

This should have been two patches: one fixing the broken SITE, and one
doing the bump. I've split it into two patches: one fixing the broken
SITE, applied on master. Which I cherry-picked in next, and on top of
which I applied the version bump.

But I forgot to drop the "Fixed broken _SITE" from the second patch
merged in next, saw it too late, the commit was already pushed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 22:08:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/connman: bump version to 1.38
In-Reply-To: <20200307114312.14726-1-mc5686@mclink.it>
References: <20200307114312.14726-1-mc5686@mclink.it>
Message-ID: <20200307220822.53439875@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 Mar 2020 12:43:12 +0100
Mauro Condarelli <mc5686@mclink.it> wrote:

> Added support for iwd.
> 
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>

Thanks Mauro, but we already have a patch series for connman that does
a number of changes, including the version bump:

  http://patchwork.ozlabs.org/patch/1246178/
  http://patchwork.ozlabs.org/patch/1246179/
  http://patchwork.ozlabs.org/patch/1246180/
  http://patchwork.ozlabs.org/patch/1246181/

However, it does not take care of iwd support, so a follow-up patch
would be good.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

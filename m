From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 May 2016 15:22:25 +0200
Subject: [Buildroot] [PATCH] python-coherence: fix twisted detection
In-Reply-To: <1462961992-28212-1-git-send-email-yegorslists@googlemail.com>
References: <1462961992-28212-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160511152225.72d20d46@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 May 2016 12:19:52 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Apply upstream patch, that provides proper twisted detection.
> 
> Fixes:
> http://autobuild.buildroot.net/results/d09/d09a6604414ed79205d95b164e32dbd72268e05c
> http://autobuild.buildroot.net/results/a97/a974f3f075fb22adde720856ec4c9d11d8151da7
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  .../0001-Fix-twisted-detection.patch               | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/python-coherence/0001-Fix-twisted-detection.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

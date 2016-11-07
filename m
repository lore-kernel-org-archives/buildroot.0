From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 22:05:28 +0100
Subject: [Buildroot] [PATCH 1/2] ser2net: bump to version 3.1
In-Reply-To: <1478501493-30411-1-git-send-email-yegorslists@googlemail.com>
References: <1478501493-30411-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20161107220528.7a0829ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  7 Nov 2016 07:51:32 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Version 3.1 adds librt to the list of required libraries.
> 
> Fixes:
> http://autobuild.buildroot.net/results/7f1/7f152e2255f8d2cf9378812998fe9a239319c116
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/ser2net/ser2net.hash | 2 +-
>  package/ser2net/ser2net.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

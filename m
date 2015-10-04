From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 11:23:51 +0100
Subject: [Buildroot] [PATCH] system: clarify /dev management using
 devtmpfs + {mdev, eudev}
In-Reply-To: <1443951815-7669-1-git-send-email-luca@lucaceresoli.net>
References: <1443951815-7669-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20151004112351.5daaa67b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Sun,  4 Oct 2015 11:43:35 +0200, Luca Ceresoli wrote:
> The "Dynamic using mdev" and "Dynamic using eudev" /dev management
> methods are using devtmpfs, just like "Dynamic using devtmpfs only",
> on top of which they add either mdev or eudev. But their names might
> suggest they use mdev only or eudev only.
> 
> Clarify their descriptions by adding "devtmpfs +" to make it
> unambiguous.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  docs/manual/configure.txt | 7 ++++---
>  system/Config.in          | 4 ++--
>  2 files changed, 6 insertions(+), 5 deletions(-)

Applied after rewrapping the manual text (even if it indeed makes the
diff a lot less readable), thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

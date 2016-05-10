From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 May 2016 15:55:18 +0200
Subject: [Buildroot] [PATCH] lksctp-tools: bump to version 1.0.17
In-Reply-To: <1462869606-22527-1-git-send-email-yegorslists@googlemail.com>
References: <1462869606-22527-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160510155518.054df2c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 May 2016 10:40:06 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Remove upstreamed patch and autoreconf related hook. Add
> --disable-tests config option to reduce build time.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/lksctp-tools/0001-Fix-musl-build.patch | 46 --------------------------
>  package/lksctp-tools/lksctp-tools.hash         |  4 +--
>  package/lksctp-tools/lksctp-tools.mk           |  9 ++---
>  3 files changed, 4 insertions(+), 55 deletions(-)
>  delete mode 100644 package/lksctp-tools/0001-Fix-musl-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

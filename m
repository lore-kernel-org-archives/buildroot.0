From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 16:58:26 +0200
Subject: [Buildroot] [PATCH] scanpypi: change hash file comments
In-Reply-To: <1467642243-23832-1-git-send-email-yegorslists@googlemail.com>
References: <1467642243-23832-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160704165826.2b619e79@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jul 2016 16:24:03 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> sha256 checksum will be computed locally either by scanpypi at package
> creation or by hand by package updates. Define this checksum as
> 'computed locally' so that one doesn't need to change this comment by
> package updates. Also put comments for both md5 and sha256 in one line.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  support/scripts/scanpypi | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

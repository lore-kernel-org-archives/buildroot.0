From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Aug 2016 15:21:43 +0200
Subject: [Buildroot] [PATCH] python-meld3: fix setup type
In-Reply-To: <1472104684-3151-1-git-send-email-yegorslists@googlemail.com>
References: <1472104684-3151-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160825152143.44b26118@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Aug 2016 07:58:04 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> meld3 relies on setuptools instead of distutils.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f9e/f9ef01d2cb1d32cb13743e83c7fc9c0d354fc571/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-meld3/python-meld3.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

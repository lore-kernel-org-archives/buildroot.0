From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 23:29:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5cinex: fix download
In-Reply-To: <1525963046-17540-1-git-send-email-julien.boibessot@free.fr>
References: <1525963046-17540-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20180511232923.0170eb84@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 May 2018 16:37:26 +0200, julien.boibessot at free.fr wrote:
> From: Julien <julien.boibessot@armadeus.com>
> 
> BR dl-wrapper tries to get Qt5_CinematicExperience_%22rpi_%221.0.tgz, which fails, so fix archive name...
> 
> Signed-off-by: Julien <julien.boibessot@armadeus.com>
> ---
>  package/qt5cinex/qt5cinex.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master after slightly improving the commit description.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Oct 2018 14:22:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/clamav: security bump to 0.100.2
In-Reply-To: <20181003181652.10925-1-bernd.kuhls@t-online.de>
References: <20181003181652.10925-1-bernd.kuhls@t-online.de>
Message-ID: <20181004142207.179bc7e0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  3 Oct 2018 20:16:52 +0200, Bernd Kuhls wrote:
> Fixes CVE-2018-15378, CVE-2018-14680, CVE-2018-14681 & CVE-2018-14682:
> http://lists.clamav.net/pipermail/clamav-announce/2018/000033.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/clamav/clamav.hash | 2 +-
>  package/clamav/clamav.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

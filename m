From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Sep 2018 20:55:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: security bump to version
 7.2.10
In-Reply-To: <20180913185129.461-1-bernd.kuhls@t-online.de>
References: <20180913185129.461-1-bernd.kuhls@t-online.de>
Message-ID: <20180913205552.1b27f9a2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Sep 2018 20:51:29 +0200, Bernd Kuhls wrote:
> Changelog: http://de2.php.net/ChangeLog-7.php#7.2.10
> 
> Fixes https://bugs.php.net/bug.php?id=76582, CVE ID pending.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

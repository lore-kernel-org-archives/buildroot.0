From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Aug 2018 11:21:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: security bump to version
 7.2.9
In-Reply-To: <20180818090933.17376-1-bernd.kuhls@t-online.de>
References: <20180818090933.17376-1-bernd.kuhls@t-online.de>
Message-ID: <20180818112143.46744056@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Aug 2018 11:09:33 +0200, Bernd Kuhls wrote:
> Version 7.2.8 fixed CVE-2018-12882, CVE-2018-14883 & CVE-2018-14851:
> http://www.php.net/ChangeLog-7.php#7.2.8
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

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:23:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 7.4.10
In-Reply-To: <20200920071321.458641-1-bernd.kuhls@t-online.de>
References: <20200920071321.458641-1-bernd.kuhls@t-online.de>
Message-ID: <20200920152310.7a7388cf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Sep 2020 09:13:21 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Changelog: https://www.php.net/ChangeLog-7.php#7.4.10
> 
> Rebased patches 0002 & 0003.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/php/0002-iconv-tweak-iconv-detection.patch     | 4 +++-
>  package/php/0003-configure-disable-the-phar-tool.patch | 4 +++-
>  package/php/php.hash                                   | 2 +-
>  package/php/php.mk                                     | 2 +-
>  4 files changed, 8 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:06:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to
 7.4.5
In-Reply-To: <20200416174135.1632869-1-bernd.kuhls@t-online.de>
References: <20200416174135.1632869-1-bernd.kuhls@t-online.de>
Message-ID: <20200417220614.6f781ea7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Apr 2020 19:41:35 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Changelog: https://www.php.net/ChangeLog-7.php#7.4.5
> 
> Fixes CVE-2020-7067.
> 
> Removed patch applied upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...Check-for-sys-auxv.h-before-using-it.patch | 60 -------------------
>  package/php/php.hash                          |  2 +-
>  package/php/php.mk                            |  2 +-
>  3 files changed, 2 insertions(+), 62 deletions(-)
>  delete mode 100644 package/php/0005-Check-for-sys-auxv.h-before-using-it.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

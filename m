From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 16:00:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 7.4.8
In-Reply-To: <20200710145316.156434-1-bernd.kuhls@t-online.de>
References: <20200710145316.156434-1-bernd.kuhls@t-online.de>
Message-ID: <20200711160022.33cdf749@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Jul 2020 16:53:16 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Quoting https://www.php.net/
> "For windows users running an official build, this release contains a
>  patched version of libcurl addressing CVE-2020-8159.
> 
> For all other consumers of PHP, this is a bug fix release."
> 
> Changelog: https://www.php.net/ChangeLog-7.php#7.4.8
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

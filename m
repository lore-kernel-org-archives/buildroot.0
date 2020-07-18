From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Jul 2020 15:34:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/clamav: security bump version
 to 0.102.4
In-Reply-To: <20200717171831.69049-1-bernd.kuhls@t-online.de>
References: <20200717171831.69049-1-bernd.kuhls@t-online.de>
Message-ID: <20200718153454.63c9a2b0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Jul 2020 19:18:31 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://blog.clamav.net/2020/07/clamav-01024-security-patch-released.html
> 
> Fixes CVE-2020-3481, CVE-2020-3327 & CVE-2020-3350.
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

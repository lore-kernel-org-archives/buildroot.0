From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 21:51:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/e2fsprogs: security bump
 version to 1.45.4
In-Reply-To: <20190928062635.8553-1-bernd.kuhls@t-online.de>
References: <20190928062635.8553-1-bernd.kuhls@t-online.de>
Message-ID: <20190928215141.0ba627fa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Sep 2019 08:26:35 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes CVE-2019-5094:
> http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.45.4
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/e2fsprogs/e2fsprogs.hash | 4 ++--
>  package/e2fsprogs/e2fsprogs.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

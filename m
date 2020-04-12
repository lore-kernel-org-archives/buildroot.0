From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 23:16:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/openipmi: bump version to 2.0.28
In-Reply-To: <20200412145219.1439893-1-bernd.kuhls@t-online.de>
References: <20200412145219.1439893-1-bernd.kuhls@t-online.de>
Message-ID: <20200412231636.74428b8e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Apr 2020 16:52:19 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patch applied upstream:
> https://github.com/cminyard/openipmi/commit/d1dd570cf77cb2c63bc32bef12d5353e3a197146
> 
> Added md5 hash provided by upstream, switched _SITE to https.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ine-include-in-ipmi_serial_bmc_emu.c.patch | 31 -------------------
>  package/openipmi/openipmi.hash                |  5 +--
>  package/openipmi/openipmi.mk                  |  4 +--
>  3 files changed, 5 insertions(+), 35 deletions(-)
>  delete mode 100644 package/openipmi/0002-sample-fix-readline-include-in-ipmi_serial_bmc_emu.c.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

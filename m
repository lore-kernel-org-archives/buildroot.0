From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 Sep 2020 14:35:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/flashrom: bump to version 1.2
In-Reply-To: <20200905153350.993065-1-fontaine.fabrice@gmail.com>
References: <20200905153350.993065-1-fontaine.fabrice@gmail.com>
Message-ID: <20200906143542.2b6daf70@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  5 Sep 2020 17:33:50 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (not needed since
>   https://github.com/flashrom/flashrom/commit/e0ceedf76d48757a05f22860e7ddd03e430c2252)
> - CONFIG_ENABLE_LIBUSB0_PROGRAMMERS has been dropped since
>   https://github.com/flashrom/flashrom/commit/b221cd7048f9cde1fe789e686a0e0adaf9a688b3
> - arc platform is supported since
>   https://github.com/flashrom/flashrom/commit/34d07f00b2990bec4a2ce12852acd42c08ddf217
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/flashrom/0001-spi.patch | 25 -------------------------
>  package/flashrom/Config.in      |  1 +
>  package/flashrom/flashrom.hash  |  6 +++---
>  package/flashrom/flashrom.mk    |  9 +--------
>  4 files changed, 5 insertions(+), 36 deletions(-)
>  delete mode 100644 package/flashrom/0001-spi.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

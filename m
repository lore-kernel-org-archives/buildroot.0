From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 13:31:38 +0100
Subject: [Buildroot] [PATCH] perl: bump to version 5.28.1
In-Reply-To: <20181202165309.2806-1-francois.perrad@gadz.org>
References: <20181202165309.2806-1-francois.perrad@gadz.org>
Message-ID: <20181203133138.4b4f6fdb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Dec 2018 17:53:09 +0100, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  ...isting-files-before-overwriting-them.patch | 46 -------------------
>  ...the-generated-subdirectory-Makefiles.patch |  2 +-
>  package/perl/perl.hash                        | 12 ++---
>  package/perl/perl.mk                          |  6 +--
>  utils/scancpan                                | 12 ++---
>  5 files changed, 16 insertions(+), 62 deletions(-)
>  delete mode 100644 package/perl/0001-PATCH-Remove-existing-files-before-overwriting-them.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 22:49:08 +0200
Subject: [Buildroot] [PATCH] package/keyutils: bump to version 1.6.3
In-Reply-To: <20200928180818.2256383-1-francois.perrad@gadz.org>
References: <20200928180818.2256383-1-francois.perrad@gadz.org>
Message-ID: <20200930224908.59d372e1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 28 Sep 2020 20:08:18 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> - update home page URL
> - change download to new location
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/keyutils/0001-fix-install-rule.patch | 2 +-
>  package/keyutils/0002-cifs.patch             | 4 ++--
>  package/keyutils/Config.in                   | 2 +-
>  package/keyutils/keyutils.hash               | 6 +++---
>  package/keyutils/keyutils.mk                 | 5 ++---
>  5 files changed, 9 insertions(+), 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

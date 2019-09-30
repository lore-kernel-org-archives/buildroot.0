From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 23:17:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/zbar: bump version to 0.23
In-Reply-To: <20190929173700.22920-1-bernd.kuhls@t-online.de>
References: <20190929173700.22920-1-bernd.kuhls@t-online.de>
Message-ID: <20190930231753.29273c3c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Sep 2019 19:37:00 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> License file was renamed, no changes at the license:
> https://github.com/mchehab/zbar/commit/b3f2ec0c02769d4770fc53ea417488c850435a83
> 
> Configure option python2 was renamed to python:
> https://github.com/mchehab/zbar/commit/78e9adca89ebd88c6e23c56696cf9475b5009c8e
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/zbar/zbar.hash | 4 ++--
>  package/zbar/zbar.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

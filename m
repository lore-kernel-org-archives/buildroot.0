From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 12:15:00 +0200
Subject: [Buildroot] [PATCH 13/20] host-perl-module-build-tiny: new
 package
In-Reply-To: <20181006165524.23778-14-francois.perrad@gadz.org>
References: <20181006165524.23778-1-francois.perrad@gadz.org>
 <20181006165524.23778-14-francois.perrad@gadz.org>
Message-ID: <20181008121500.58c42ea3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Oct 2018 18:55:17 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../perl-module-build-tiny.hash                    |  6 ++++++
>  .../perl-module-build-tiny.mk                      | 14 ++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 package/perl-module-build-tiny/perl-module-build-tiny.hash
>  create mode 100644 package/perl-module-build-tiny/perl-module-build-tiny.mk

Applied after dropping the "host-" part of the prefix in the commit
title.

However, one question: why was Module-Build-Tiny already in the
white_list array in scancpan if it wasn't packaged in Buildroot ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 12:11:20 +0200
Subject: [Buildroot] [PATCH 11/20] host-perl-extutils-helpers: new
 package
In-Reply-To: <20181006165524.23778-12-francois.perrad@gadz.org>
References: <20181006165524.23778-1-francois.perrad@gadz.org>
 <20181006165524.23778-12-francois.perrad@gadz.org>
Message-ID: <20181008121120.48e78137@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Oct 2018 18:55:15 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../perl-extutils-helpers.hash                      |  6 ++++++
>  .../perl-extutils-helpers/perl-extutils-helpers.mk  | 13 +++++++++++++
>  utils/scancpan                                      |  1 +
>  3 files changed, 20 insertions(+)
>  create mode 100644 package/perl-extutils-helpers/perl-extutils-helpers.hash
>  create mode 100644 package/perl-extutils-helpers/perl-extutils-helpers.mk

Applied to master, with the same comments fixed than the one made for
perl-extutils-config. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

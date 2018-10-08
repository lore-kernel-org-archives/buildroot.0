From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 12:10:57 +0200
Subject: [Buildroot] [PATCH 10/20] host-perl-extutils-config: new package
In-Reply-To: <20181006165524.23778-11-francois.perrad@gadz.org>
References: <20181006165524.23778-1-francois.perrad@gadz.org>
 <20181006165524.23778-11-francois.perrad@gadz.org>
Message-ID: <20181008121057.653504ad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Oct 2018 18:55:14 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../perl-extutils-config/perl-extutils-config.hash  |  6 ++++++
>  .../perl-extutils-config/perl-extutils-config.mk    | 13 +++++++++++++
>  utils/scancpan                                      |  1 +
>  3 files changed, 20 insertions(+)
>  create mode 100644 package/perl-extutils-config/perl-extutils-config.hash
>  create mode 100644 package/perl-extutils-config/perl-extutils-config.mk

The commit title doesn't need to have the "host-" prefix. Also, when
adding host packages, it's genrally nice to explain in the commit log
why they are needed.

Applied with a reworked commit title and commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

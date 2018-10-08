From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 10:54:35 +0200
Subject: [Buildroot] [PATCH 09/20] perl-www-form-encoded: new package
In-Reply-To: <20181006165524.23778-10-francois.perrad@gadz.org>
References: <20181006165524.23778-1-francois.perrad@gadz.org>
 <20181006165524.23778-10-francois.perrad@gadz.org>
Message-ID: <20181008105435.1a9c93b0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Oct 2018 18:55:13 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                                  |  1 +
>  package/perl-www-form-urlencoded/Config.in         |  6 ++++++
>  .../perl-www-form-urlencoded.hash                  |  6 ++++++
>  .../perl-www-form-urlencoded.mk                    | 14 ++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/perl-www-form-urlencoded/Config.in
>  create mode 100644 package/perl-www-form-urlencoded/perl-www-form-urlencoded.hash
>  create mode 100644 package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk

On this one as well, the commit title did not match the package name,
so I fixed that up and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

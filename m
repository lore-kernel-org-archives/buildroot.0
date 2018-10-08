From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 12:11:27 +0200
Subject: [Buildroot] [PATCH 12/20] host-perl-extutils-installpaths: new
 package
In-Reply-To: <20181006165524.23778-13-francois.perrad@gadz.org>
References: <20181006165524.23778-1-francois.perrad@gadz.org>
 <20181006165524.23778-13-francois.perrad@gadz.org>
Message-ID: <20181008121127.53f69199@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Oct 2018 18:55:16 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../perl-extutils-installpaths.hash                |  6 ++++++
>  .../perl-extutils-installpaths.mk                  | 14 ++++++++++++++
>  utils/scancpan                                     |  1 +
>  3 files changed, 21 insertions(+)
>  create mode 100644 package/perl-extutils-installpaths/perl-extutils-installpaths.hash
>  create mode 100644 package/perl-extutils-installpaths/perl-extutils-installpaths.mk

Applied to master, with the same comments fixed than the one made for
perl-extutils-config. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

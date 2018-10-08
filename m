From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 16:41:14 +0200
Subject: [Buildroot] [PATCH 18/20] host-perl-file-sharedir-install: new
 package
In-Reply-To: <20181006165524.23778-19-francois.perrad@gadz.org>
References: <20181006165524.23778-1-francois.perrad@gadz.org>
 <20181006165524.23778-19-francois.perrad@gadz.org>
Message-ID: <20181008164114.5dc1744b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Oct 2018 18:55:22 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../perl-file-sharedir-install.hash                 |  6 ++++++
>  .../perl-file-sharedir-install.mk                   | 13 +++++++++++++
>  utils/scancpan                                      |  1 +
>  3 files changed, 20 insertions(+)
>  create mode 100644 package/perl-file-sharedir-install/perl-file-sharedir-install.hash
>  create mode 100644 package/perl-file-sharedir-install/perl-file-sharedir-install.mk

Applied to master after fixing the commit title, and adding a small
commit log to explain why this host package is needed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 15:07:40 +0200
Subject: [Buildroot] [PATCH] perl-gd: bump to version 2.59
In-Reply-To: <20170422063406.14258-1-francois.perrad@gadz.org>
References: <20170422063406.14258-1-francois.perrad@gadz.org>
Message-ID: <20170422150740.5c8e99fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Apr 2017 08:34:06 +0200, Francois Perrad wrote:
> remove patches merged upstream
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl-gd/0001-getoptions.patch              | 43 ----------------------
>  package/perl-gd/0002-lgd.patch                     | 28 --------------
>  package/perl-gd/0003-force.patch                   | 32 ----------------
>  .../0004-gdlib-config-is-now-configurable.patch    | 34 ++++++++---------
>  package/perl-gd/Config.in                          |  2 +-
>  package/perl-gd/perl-gd.hash                       |  4 +-
>  package/perl-gd/perl-gd.mk                         | 10 +----
>  7 files changed, 22 insertions(+), 131 deletions(-)
>  delete mode 100644 package/perl-gd/0001-getoptions.patch
>  delete mode 100644 package/perl-gd/0002-lgd.patch
>  delete mode 100644 package/perl-gd/0003-force.patch

You forgot to renumber the remaining patch 0004 to 0001, so I've fixed
this and applied. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

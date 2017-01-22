From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jan 2017 17:35:40 +1100
Subject: [Buildroot] [PATCH 2/3] perl-gd: bump to version 2.56
In-Reply-To: <20170121115118.17938-2-francois.perrad@gadz.org>
References: <20170121115118.17938-1-francois.perrad@gadz.org>
 <20170121115118.17938-2-francois.perrad@gadz.org>
Message-ID: <20170122173540.6f156a76@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Jan 2017 12:51:17 +0100, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl-gd/0002-lgd.patch                              | 4 ++--
>  package/perl-gd/0003-force.patch                            | 2 +-
>  package/perl-gd/0004-gdlib-config-is-now-configurable.patch | 2 +-
>  package/perl-gd/Config.in                                   | 2 +-
>  package/perl-gd/perl-gd.hash                                | 4 ++--
>  package/perl-gd/perl-gd.mk                                  | 5 +++--
>  6 files changed, 10 insertions(+), 9 deletions(-)

Why do we have to suddenly add this new PREFER_INSTALLER variable when
bumping perl-gd ? It should be explained in the commit log.

Do you expect other Perl packages to need this new PREFER_INSTALLER
variable ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

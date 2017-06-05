From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:12:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/hwloc: bump version to 1.11.7
In-Reply-To: <20170604133622.15170-1-bernd.kuhls@t-online.de>
References: <20170604133622.15170-1-bernd.kuhls@t-online.de>
Message-ID: <20170605111240.567795bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Jun 2017 15:36:22 +0200, Bernd Kuhls wrote:
> Added md5 & sha256 hashes, removed patch applied upstream:
> https://github.com/open-mpi/hwloc/commit/f08f4629f93e927e10143eaf6378d2619aa27954
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...-Makefile.am-fix-install-man-race-conditi.patch | 35 ----------------------
>  package/hwloc/hwloc.hash                           |  7 +++--
>  package/hwloc/hwloc.mk                             |  6 ++--
>  3 files changed, 7 insertions(+), 41 deletions(-)
>  delete mode 100644 package/hwloc/0001-utils-hwloc-Makefile.am-fix-install-man-race-conditi.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

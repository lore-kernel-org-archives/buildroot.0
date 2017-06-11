From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 19:02:06 +0200
Subject: [Buildroot] [PATCH 03/14] package/libspatialindex: new package
References: <20170411222643.9770-1-romain.naour@gmail.com>
 <20170411222643.9770-3-romain.naour@gmail.com>
Message-ID: <el901exniq.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 12 Apr 2017 00:26:32 +0200 schrieb Romain Naour:

> Signed-off-by: Romain Naour <romain.naour-
Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> test-pkg reported an internal compiler error on microblaze (br-
microblazeel-full)
> Index.cc: In member function 'void 
SpatialIndex::RTree::Index::adjustTree(SpatialIndex::RTree::Node*, 
std::stack<long long int>&)':
> Index.cc:327:1: internal compiler error: in gen_reg_rtx, at emit-
rtl.c:1027
> ---
>  DEVELOPERS                                   |  1 +
>  package/Config.in                            |  1 +
>  package/libspatialindex/Config.in            | 30 +++++++++++++++++++++
+++++++
>  package/libspatialindex/libspatialindex.hash |  4 ++++
>  package/libspatialindex/libspatialindex.mk   | 14 +++++++++++++
>  5 files changed, 50 insertions(+)
>  create mode 100644 package/libspatialindex/Config.in
>  create mode 100644 package/libspatialindex/libspatialindex.hash
>  create mode 100644 package/libspatialindex/libspatialindex.mk

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de
(build-tested using http://autobuild.buildroot.net/toolchains/configs/br-
bfin-full.config )

Small note: The package also builds fine as cmake-package.

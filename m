From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Apr 2021 22:45:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/s6-linux-init: bump to version
 1.0.6.1
In-Reply-To: <20210411091104.222559-1-fontaine.fabrice@gmail.com>
References: <20210411091104.222559-1-fontaine.fabrice@gmail.com>
Message-ID: <20210421224531.1f0740d7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 11 Apr 2021 11:11:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Build is broken since bump of skalibs to version 2.10.0.2 in commit
> 4d5587cb56224b2b28f53b0202fb14b2ab32d5fb because skalibs removed
> webipc.h in version 2.10.0.0 and
> https://github.com/skarnet/skalibs/commit/e557bab0dcaf35f003fa755b74e4c80000e05e42
> 
> So bump to version 1.0.6.1 to retrieve the following commit
> https://github.com/skarnet/s6-linux-init/commit/ca8d2c96ea09cb33ff6fef33c0314c24fc6a026a
> 
> Update hash of COPYING (update in year:
> https://github.com/skarnet/s6-linux-init/commit/5e17662d138fc9c9f70a4422eab059c2bdc9432d
> https://github.com/skarnet/s6-linux-init/commit/1de5c2d7c63916b11668078445e5f75c054bc898)
> 
> While at it, also update indentation in hash file (two spaces)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/fe879267675a80bfc5ba17341144feeee53dc197
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-configure-add-D_GNU_SOURCE.patch     | 40 +++++++++++++++++++
>  package/s6-linux-init/s6-linux-init.hash      |  4 +-
>  package/s6-linux-init/s6-linux-init.mk        |  2 +-
>  3 files changed, 43 insertions(+), 3 deletions(-)
>  create mode 100644 package/s6-linux-init/0001-configure-add-D_GNU_SOURCE.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

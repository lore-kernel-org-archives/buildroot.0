From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Apr 2017 10:59:17 +0200
Subject: [Buildroot] [PATCH] atop: bump version to 2.3.0
In-Reply-To: <20170414002225.11351-1-ricardo.martincoski@gmail.com>
References: <20170414002225.11351-1-ricardo.martincoski@gmail.com>
Message-ID: <20170414105917.2ff7ab78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Apr 2017 21:22:25 -0300, Ricardo Martincoski wrote:
> Remove patch applied upstream [1].
> 
> [1] https://github.com/Atoptool/atop/commit/a2306c0e1c83f5a123ce521a34d9efaa2297c26d
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> 49 builds, 3 skipped, 0 failed
> ---
>  .../0001-remove-unused-include-of-termio.h.patch   | 52 ----------------------
>  package/atop/atop.hash                             |  2 +-
>  package/atop/atop.mk                               |  2 +-
>  3 files changed, 2 insertions(+), 54 deletions(-)
>  delete mode 100644 package/atop/0001-remove-unused-include-of-termio.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

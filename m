From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 14:37:47 +0200
Subject: [Buildroot] [PATCH] libiio: bump version to 0.10
In-Reply-To: <20170602163631.34265-1-Vincent.Riera@imgtec.com>
References: <20170602163631.34265-1-Vincent.Riera@imgtec.com>
Message-ID: <20170605143747.54b16efd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 2 Jun 2017 17:36:31 +0100, Vicente Olivert Riera wrote:
> Patch 0001 already included in this release:
>   https://github.com/analogdevicesinc/libiio/commit/913c2cc740d60450e91e066cf38f5654936a6015
> 
> Patch 0002 already included in this release:
>   https://github.com/analogdevicesinc/libiio/commit/6e5a40566ee44694b186d4c2cbcf5f8690d8bba4
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  ...ties.c-Add-a-check-for-newlocale-function.patch | 55 ----------------------
>  .../0002-CMake-Test-tools-require-threads.patch    | 32 -------------
>  package/libiio/libiio.hash                         |  4 +-
>  package/libiio/libiio.mk                           |  2 +-
>  4 files changed, 3 insertions(+), 90 deletions(-)
>  delete mode 100644 package/libiio/0001-utilities.c-Add-a-check-for-newlocale-function.patch
>  delete mode 100644 package/libiio/0002-CMake-Test-tools-require-threads.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

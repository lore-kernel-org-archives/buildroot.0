From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 19 May 2016 13:17:35 +0300
Subject: [Buildroot] [PATCH v3 next] openblas: new package
In-Reply-To: <1463652602-3276-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1463652602-3276-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160519101735.GX2178@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

On Thu, May 19, 2016 at 11:10:02AM +0100, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v2 -> v3:
>  - Switch version to HEAD of develop branch as it contains support for
>    MIPS32.
>  - Add a patch to fix build failure of P5600 and I6400 targets.

Where is this patch?

>  - Add support for OpenMP when toolchain has NPTL threads.
> 
> Changes v1 -> v2:
>  - Multi-threading is not available for static-only since it uses
>    dlfcn.h, so modify the "ifeq" statement accordingly.
> 
>  package/Config.in              |   1 +
>  package/openblas/Config.in     | 240 +++++++++++++++++++++++++++++++++++++++++
>  package/openblas/openblas.hash |   3 +
>  package/openblas/openblas.mk   |  54 ++++++++++
>  4 files changed, 298 insertions(+)
>  create mode 100644 package/openblas/Config.in
>  create mode 100644 package/openblas/openblas.hash
>  create mode 100644 package/openblas/openblas.mk

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

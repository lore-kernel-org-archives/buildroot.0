From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 22:09:37 +0200
Subject: [Buildroot] [PATCH v2 1/2] systemd: bump version to 234
In-Reply-To: <20170731142210.24593-1-aduskett@gmail.com>
References: <20170731142210.24593-1-aduskett@gmail.com>
Message-ID: <20170802220937.63967ef3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Jul 2017 10:22:09 -0400, Adam Duskett wrote:
> Other changes:
> - Removed the following patches due to being merged upstream:
>     - resolved-bugfix-of-null-pointer-p-question-dereferencing.patch
>     - resolved-simplify-alloc-size-calculation.patch
>     - resolved-do-not-allocate-packets-with-minimum-size.patch
> - Updated the following patches to work with 234:
>     - fix-getty-unit.patch
>     - build-check-for-ln-relative.patch
>     - fix-am-path-libgcrypt-no-found.patch
> - Updated ordering of remaining patches.
> - Reformatted remaining patches as git style patches.
> - Updated Upstream-Status comment in "build-check-for-ln-relative.patch" to
>   "Denied [No desire to support building on old distributions]"
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Changed "Prefer getty to agetty in console setup systemd units" to
>     fix-getty-unit in 0001-fix-getty-unit.patch, and put
>     "Prefer getty to agetty in console setup systemd units" as the
>     body. (Arnout)
>   - Removed comment explaining -o in units/getty at .service.m4 (Arnout)
>   - Readded indent in Configure.in (Arnout)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

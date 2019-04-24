From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 22:44:18 +0200
Subject: [Buildroot] [PATCH v1] package/libinput: bump version to 1.13.1
In-Reply-To: <20190423204113.20563-1-ps.report@gmx.net>
References: <20190423204113.20563-1-ps.report@gmx.net>
Message-ID: <20190424224418.725174dc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 23 Apr 2019 22:41:13 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

>  - for changelog see [1] and [2]
>  - removed 0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch
>    (upstream applied, see [3])
> 
> [1] https://lists.freedesktop.org/archives/wayland-devel/2019-March/040363.html
> [2] https://lists.freedesktop.org/archives/wayland-devel/2019-April/040403.html
> [3] https://gitlab.freedesktop.org/libinput/libinput/commit/4516ba977c1e22d01da4cc50a8ebffa5d11d73f1
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...le-CPP-include-check-only-in-case-CP.patch | 54 -------------------
>  package/libinput/libinput.hash                | 10 ++--
>  package/libinput/libinput.mk                  |  2 +-
>  3 files changed, 6 insertions(+), 60 deletions(-)
>  delete mode 100644 package/libinput/0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch

Applied to master, thanks. For some reason, your patch was not applying properly:

Applying patch #1089746 using "git am -s"
Description: [v1] package/libinput: bump version to 1.13.1
Applying: package/libinput: bump version to 1.13.1
error: patch failed: package/libinput/0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch:1
error: package/libinput/0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch: patch does not apply
Patch failed at 0001 package/libinput: bump version to 1.13.1
hint: Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
'git am' failed with exit status 128

I fixed it up manually when applying.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

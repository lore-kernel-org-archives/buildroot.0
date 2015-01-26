From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 26 Jan 2015 12:46:52 +0100
Subject: [Buildroot] [PATCH v2 1/6] package/infozip: rework infozip
	patch.
In-Reply-To: <1422113025-24848-1-git-send-email-romain.naour@openwide.fr>
References: <1422113025-24848-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <CACQ1gAjj-sZUjJS7vmnrjgyCAzKt8fKSCAJS+jyszSbMjbrtmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-01-24 16:23 GMT+01:00 Romain Naour <romain.naour@openwide.fr>:
> Split each cross-compilation fixes to differents
> patches files.
>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  ...emove-Check-C-compiler-type-optimization-.patch | 130 +++++++++++
>  .../0002-configure-Don-t-use-host-CPP.patch        |  37 ++++
>  ...003-Makefile-Use-CFLAGS-from-command-line.patch |  30 +++
>  ...4-configure-use-LDFLAGS-from-command-line.patch |  35 +++
>  .../infozip-0001-configure-fix-cross-build.patch   | 237 ---------------------
>  5 files changed, 232 insertions(+), 237 deletions(-)
>  create mode 100644 package/infozip/0001-configure-Remove-Check-C-compiler-type-optimization-.patch
>  create mode 100644 package/infozip/0002-configure-Don-t-use-host-CPP.patch
>  create mode 100644 package/infozip/0003-Makefile-Use-CFLAGS-from-command-line.patch
>  create mode 100644 package/infozip/0004-configure-use-LDFLAGS-from-command-line.patch
>  delete mode 100644 package/infozip/infozip-0001-configure-fix-cross-build.patch
>
Tested this series on a cortex A15, compilation / execution of infozip is ok.

Tested-by: Richard Genoud <richard.genoud@gmail.com>

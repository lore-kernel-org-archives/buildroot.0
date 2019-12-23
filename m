From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 21:04:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/openblas: bump to version 0.3.7
In-Reply-To: <20191222223443.3982071-1-fontaine.fabrice@gmail.com>
References: <20191222223443.3982071-1-fontaine.fabrice@gmail.com>
Message-ID: <20191223210457.529d7fab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Dec 2019 23:34:43 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Remove both patches (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0001-Makefile.arm-remove-march-flags.patch | 55 -------------------
>  ...-argument-of-CPU_ISSET-for-glibc-2-5.patch | 36 ------------
>  package/openblas/openblas.hash                |  2 +-
>  package/openblas/openblas.mk                  |  2 +-
>  4 files changed, 2 insertions(+), 93 deletions(-)
>  delete mode 100644 package/openblas/0001-Makefile.arm-remove-march-flags.patch
>  delete mode 100644 package/openblas/0002-Correct-argument-of-CPU_ISSET-for-glibc-2-5.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

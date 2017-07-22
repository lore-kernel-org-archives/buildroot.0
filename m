From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 15:16:24 +0200
Subject: [Buildroot] [PATCH] package/openal: bump version to 1.18.0
In-Reply-To: <1500644031-25581-1-git-send-email-nerv@dawncrow.de>
References: <1500644031-25581-1-git-send-email-nerv@dawncrow.de>
Message-ID: <20170722151624.1a90e3d3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Jul 2017 15:33:51 +0200, Andr? Hentschel wrote:
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  .../0001-Build-NEON-code-with-mfpu-neon.patch      | 29 ----------
>  ...heck-for-run-time-NEON-support-by-reading.patch | 67 ----------------------
>  ...003-Properly-check-if-proc-cpuinfo-opened.patch | 24 --------
>  ...k-if-mfpu-neon-is-available-for-compiling.patch | 47 ---------------
>  .../openal/0005-Fix-detection-of-C11-atomics.patch | 53 -----------------
>  package/openal/openal.hash                         |  2 +-
>  package/openal/openal.mk                           |  2 +-
>  7 files changed, 2 insertions(+), 222 deletions(-)
>  delete mode 100644 package/openal/0001-Build-NEON-code-with-mfpu-neon.patch
>  delete mode 100644 package/openal/0002-Check-for-run-time-NEON-support-by-reading.patch
>  delete mode 100644 package/openal/0003-Properly-check-if-proc-cpuinfo-opened.patch
>  delete mode 100644 package/openal/0004-Check-if-mfpu-neon-is-available-for-compiling.patch
>  delete mode 100644 package/openal/0005-Fix-detection-of-C11-atomics.patch

Applied to master after improving the commit log to explain the status
of the removed patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

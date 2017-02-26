From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 14:14:16 +0100
Subject: [Buildroot] [PATCH] binutils: fix for ld segfault for
 microblaze when --gc-sections is used
In-Reply-To: <20170225013714.GA18541@waldemar-brodkorb.de>
References: <20170225013714.GA18541@waldemar-brodkorb.de>
Message-ID: <20170226141416.6c52bf28@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Feb 2017 02:37:14 +0100, Waldemar Brodkorb wrote:
> The workarounds for kmod/libnss can be removed when the patch is
> applied and the autobuilder toolchains got rebuild.
> 
> kmod: 0d81107f021bf2a663f102bace1e3f9590641170
> libnss: fceb1afd5dda45cf180f22877a6ab0e51d1b3dac
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .../binutils/2.25.1/916-microblaze-pr21180.patch   | 33 ++++++++++++++++++++++
>  .../binutils/2.26.1/0906-microblaze-pr21180.patch  | 33 ++++++++++++++++++++++
>  .../binutils/2.27/0906-microblaze-pr21180.patch    | 33 ++++++++++++++++++++++
>  3 files changed, 99 insertions(+)
>  create mode 100644 package/binutils/2.25.1/916-microblaze-pr21180.patch
>  create mode 100644 package/binutils/2.26.1/0906-microblaze-pr21180.patch
>  create mode 100644 package/binutils/2.27/0906-microblaze-pr21180.patch

Applied to master, thanks. Rebuild of the pre-built toolchain in
progress.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

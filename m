From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Aug 2017 23:08:49 +0200
Subject: [Buildroot] [PATCH 1/2] boot/syslinux: renumber patches
In-Reply-To: <20170815224546.12593-1-arnout@mind.be>
References: <20170815224546.12593-1-arnout@mind.be>
Message-ID: <20170816230849.423f4a1e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Aug 2017 00:45:45 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Also the last two are regenerated, their context has changed due to
> the patches that have been removed earlier.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  ... => 0003-memdisk-Force-ld-output-format-to-32-bits.patch} |  0
>  ...atch => 0004-utils-Use-the-host-toolchain-to-build.patch} |  0
>  ...ch => 0005-lzo-Use-the-host-toolchain-for-prepcore.patch} |  0
>  ...e-VPrint-definition-is-now-part-of-the-exports-of-.patch} |  0
>  ...date-the-longjump-calls-to-fit-the-new-declaration.patch} | 12 ++++++------
>  ... 0008-efi-wrapper-build-it-with-the-host-toolchain.patch} |  8 ++++----
>  6 files changed, 10 insertions(+), 10 deletions(-)
>  rename boot/syslinux/{0004-memdisk-Force-ld-output-format-to-32-bits.patch => 0003-memdisk-Force-ld-output-format-to-32-bits.patch} (100%)
>  rename boot/syslinux/{0005-utils-Use-the-host-toolchain-to-build.patch => 0004-utils-Use-the-host-toolchain-to-build.patch} (100%)
>  rename boot/syslinux/{0006-lzo-Use-the-host-toolchain-for-prepcore.patch => 0005-lzo-Use-the-host-toolchain-for-prepcore.patch} (100%)
>  rename boot/syslinux/{0007-The-VPrint-definition-is-now-part-of-the-exports-of-.patch => 0006-The-VPrint-definition-is-now-part-of-the-exports-of-.patch} (100%)
>  rename boot/syslinux/{0009-Update-the-longjump-calls-to-fit-the-new-declaration.patch => 0007-Update-the-longjump-calls-to-fit-the-new-declaration.patch} (76%)
>  rename boot/syslinux/{0010-efi-wrapper-build-it-with-the-host-toolchain.patch => 0008-efi-wrapper-build-it-with-the-host-toolchain.patch} (81%)

Both patches applied to master. I tested, and indeed before your
patches, building syslinux fails with binutils 2.29, while it works
after your patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

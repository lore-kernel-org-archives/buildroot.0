From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 11:17:21 +0200
Subject: [Buildroot] [PATCH 1/2] gcc: bump 5.x series to version 5.2.0
In-Reply-To: <1437143474-9187-1-git-send-email-gustavo@zacarias.com.ar>
References: <1437143474-9187-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150718111721.18dd7616@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 17 Jul 2015 11:31:13 -0300, Gustavo Zacarias wrote:
> Also rename the BR2_GCC_VERSION_5_1_X symbol to BR2_GCC_VERSION_5_X to
> reflect this change to match the new versioning scheme.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gcc/{5.1.0 => 5.2.0}/100-uclibc-conf.patch                  | 0
>  .../gcc/{5.1.0 => 5.2.0}/200-gcc-poison-system-directories.patch    | 0
>  package/gcc/{5.1.0 => 5.2.0}/201-libgcc-remove-unistd-header.patch  | 0
>  package/gcc/{5.1.0 => 5.2.0}/301-missing-execinfo_h.patch           | 0
>  package/gcc/{5.1.0 => 5.2.0}/810-arm-softfloat-libgcc.patch         | 0
>  package/gcc/{5.1.0 => 5.2.0}/830-arm_unbreak_armv4t.patch           | 0
>  .../{5.1.0 => 5.2.0}/840-microblaze-enable-dwarf-eh-support.patch   | 0
>  package/gcc/{5.1.0 => 5.2.0}/850-libstdcxx-uclibc-c99.patch         | 0
>  package/gcc/{5.1.0 => 5.2.0}/860-cilk-wchar.patch                   | 0
>  .../gcc/{5.1.0 => 5.2.0}/900-libitm-fixes-for-musl-support.patch    | 0
>  .../{5.1.0 => 5.2.0}/901-fixincludes-update-for-musl-support.patch  | 0
>  package/gcc/{5.1.0 => 5.2.0}/902-unwind-fix-for-musl.patch          | 0
>  .../903-libstdc++-libgfortran-gthr-workaround-for-musl.patch        | 0
>  package/gcc/{5.1.0 => 5.2.0}/904-musl-libc-config.patch             | 0
>  package/gcc/{5.1.0 => 5.2.0}/905-add-musl-support-to-gcc.patch      | 0
>  package/gcc/{5.1.0 => 5.2.0}/906-mips-musl-support.patch            | 0
>  package/gcc/{5.1.0 => 5.2.0}/907-x86-musl-support.patch             | 0
>  package/gcc/{5.1.0 => 5.2.0}/908-arm-musl-support.patch             | 0
>  package/gcc/{5.1.0 => 5.2.0}/909-aarch64-musl-support.patch         | 0
>  package/gcc/Config.in.host                                          | 6 +++---
>  package/gcc/gcc.hash                                                | 4 ++--
>  21 files changed, 5 insertions(+), 5 deletions(-)
>  rename package/gcc/{5.1.0 => 5.2.0}/100-uclibc-conf.patch (100%)
>  rename package/gcc/{5.1.0 => 5.2.0}/200-gcc-poison-system-directories.patch (100%)
>  rename package/gcc/{5.1.0 => 5.2.0}/201-libgcc-remove-unistd-header.patch (100%)
>  rename package/gcc/{5.1.0 => 5.2.0}/301-missing-execinfo_h.patch (100%)
>  rename package/gcc/{5.1.0 => 5.2.0}/810-arm-softfloat-libgcc.patch (100%)
>  rename package/gcc/{5.1.0 => 5.2.0}/830-arm_unbreak_armv4t.patch (100%)
>  rename package/gcc/{5.1.0 => 5.2.0}/840-microblaze-enable-dwarf-eh-support.patch (100%)
>  rename package/gcc/{5.1.0 => 5.2.0}/850-libstdcxx-uclibc-c99.patch (100%)
>  rename package/gcc/{5.1.0 => 5.2.0}/860-cilk-wchar.patch (100%)
>  rename package/gcc/{5.1.0 => 5.2.0}/900-libitm-fixes-for-musl-support.patch (100%)
>  rename package/gcc/{5.1.0 => 5.2.0}/901-fixincludes-update-for-musl-support.patch (100%)
>  rename package/gcc/{5.1.0 => 5.2.0}/902-unwind-fix-for-musl.patch (100%)
>  rename package/gcc/{5.1.0 => 5.2.0}/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch (100%)
>  rename package/gcc/{5.1.0 => 5.2.0}/904-musl-libc-config.patch (100%)
>  rename package/gcc/{5.1.0 => 5.2.0}/905-add-musl-support-to-gcc.patch (100%)
>  rename package/gcc/{5.1.0 => 5.2.0}/906-mips-musl-support.patch (100%)
>  rename package/gcc/{5.1.0 => 5.2.0}/907-x86-musl-support.patch (100%)
>  rename package/gcc/{5.1.0 => 5.2.0}/908-arm-musl-support.patch (100%)
>  rename package/gcc/{5.1.0 => 5.2.0}/909-aarch64-musl-support.patch (100%)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

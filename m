From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 14:04:16 +0200
Subject: [Buildroot] [PATCH] gcc: bump 4.9.x series to version 4.9.3
In-Reply-To: <1435404811-17745-1-git-send-email-gustavo@zacarias.com.ar>
References: <1435404811-17745-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150628140416.22dc1767@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 27 Jun 2015 08:33:31 -0300, Gustavo Zacarias wrote:
> Drop 110-pr64896.patch and 920-libgcc-remove-unistd-header.patch since
> they're upstream.
> 
> Tweak 850-libstdcxx-uclibc-c99.patch for this new release.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gcc/4.9.2/110-pr64896.patch                |  59 -----
>  package/gcc/4.9.2/850-libstdcxx-uclibc-c99.patch   | 273 ---------------------
>  .../4.9.2/920-libgcc-remove-unistd-header.patch    |  12 -
>  package/gcc/{4.9.2 => 4.9.3}/100-uclibc-conf.patch |   0
>  ...00-powerpc-link-with-math-lib.patch.conditional |   0
>  package/gcc/{4.9.2 => 4.9.3}/111-pr65730.patch     |   0
>  .../{4.9.2 => 4.9.3}/301-missing-execinfo_h.patch  |   0
>  .../810-arm-softfloat-libgcc.patch                 |   0
>  .../{4.9.2 => 4.9.3}/830-arm_unbreak_armv4t.patch  |   0
>  .../840-microblaze-enable-dwarf-eh-support.patch   |   0
>  package/gcc/4.9.3/850-libstdcxx-uclibc-c99.patch   | 255 +++++++++++++++++++
>  package/gcc/{4.9.2 => 4.9.3}/860-cilk-wchar.patch  |   0
>  .../gcc/{4.9.2 => 4.9.3}/900-musl-support.patch    |   0
>  .../910-gcc-poison-system-directories.patch        |   0
>  package/gcc/Config.in.host                         |   2 +-
>  package/gcc/gcc.hash                               |   4 +-
>  16 files changed, 258 insertions(+), 347 deletions(-)
>  delete mode 100644 package/gcc/4.9.2/110-pr64896.patch
>  delete mode 100644 package/gcc/4.9.2/850-libstdcxx-uclibc-c99.patch
>  delete mode 100644 package/gcc/4.9.2/920-libgcc-remove-unistd-header.patch
>  rename package/gcc/{4.9.2 => 4.9.3}/100-uclibc-conf.patch (100%)
>  rename package/gcc/{4.9.2 => 4.9.3}/1000-powerpc-link-with-math-lib.patch.conditional (100%)
>  rename package/gcc/{4.9.2 => 4.9.3}/111-pr65730.patch (100%)
>  rename package/gcc/{4.9.2 => 4.9.3}/301-missing-execinfo_h.patch (100%)
>  rename package/gcc/{4.9.2 => 4.9.3}/810-arm-softfloat-libgcc.patch (100%)
>  rename package/gcc/{4.9.2 => 4.9.3}/830-arm_unbreak_armv4t.patch (100%)
>  rename package/gcc/{4.9.2 => 4.9.3}/840-microblaze-enable-dwarf-eh-support.patch (100%)
>  create mode 100644 package/gcc/4.9.3/850-libstdcxx-uclibc-c99.patch
>  rename package/gcc/{4.9.2 => 4.9.3}/860-cilk-wchar.patch (100%)
>  rename package/gcc/{4.9.2 => 4.9.3}/900-musl-support.patch (100%)
>  rename package/gcc/{4.9.2 => 4.9.3}/910-gcc-poison-system-directories.patch (100%)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

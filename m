From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 20:58:48 +0200
Subject: [Buildroot] [PATCH] gcc: bump 4.9.x series to version 4.9.1
In-Reply-To: <1405596856-19446-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405596856-19446-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140717205848.0490f49b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 17 Jul 2014 08:34:16 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gcc/{4.9.0 => 4.9.1}/100-uclibc-conf.patch       |  0
>  .../gcc/{4.9.0 => 4.9.1}/301-missing-execinfo_h.patch    |  0
>  package/gcc/{4.9.0 => 4.9.1}/302-c99-snprintf.patch      |  0
>  .../gcc/{4.9.0 => 4.9.1}/810-arm-softfloat-libgcc.patch  |  0
>  .../gcc/{4.9.0 => 4.9.1}/830-arm_unbreak_armv4t.patch    |  0
>  .../840-microblaze-enable-dwarf-eh-support.patch         |  0
>  package/gcc/{4.9.0 => 4.9.1}/900-musl-support.patch      | 16 +---------------
>  .../powerpc-link-with-math-lib.patch.conditional         |  0
>  package/gcc/Config.in.host                               |  2 +-
>  9 files changed, 2 insertions(+), 16 deletions(-)
>  rename package/gcc/{4.9.0 => 4.9.1}/100-uclibc-conf.patch (100%)
>  rename package/gcc/{4.9.0 => 4.9.1}/301-missing-execinfo_h.patch (100%)
>  rename package/gcc/{4.9.0 => 4.9.1}/302-c99-snprintf.patch (100%)
>  rename package/gcc/{4.9.0 => 4.9.1}/810-arm-softfloat-libgcc.patch (100%)
>  rename package/gcc/{4.9.0 => 4.9.1}/830-arm_unbreak_armv4t.patch (100%)
>  rename package/gcc/{4.9.0 => 4.9.1}/840-microblaze-enable-dwarf-eh-support.patch (100%)
>  rename package/gcc/{4.9.0 => 4.9.1}/900-musl-support.patch (98%)
>  rename package/gcc/{4.9.0 => 4.9.1}/powerpc-link-with-math-lib.patch.conditional (100%)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

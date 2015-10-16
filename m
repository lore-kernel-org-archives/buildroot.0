From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 16 Oct 2015 18:02:12 +0100
Subject: [Buildroot] [PATCH] harfbuzz: bump to version 1.0.6
In-Reply-To: <1445010141-18708-1-git-send-email-gustavo@zacarias.com.ar>
References: <1445010141-18708-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <56212D94.2020807@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 10/16/2015 04:42 PM, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

 $ grep -E ^HARFBUZZ_VERSION package/harfbuzz/harfbuzz.mk
HARFBUZZ_VERSION = 1.0.6

$ file output/target/usr/lib/libharfbuzz.so.0.10000.6
output/target/usr/lib/libharfbuzz.so.0.10000.6: ELF 32-bit MSB shared
object, MIPS, MIPS32 rel2 version 1 (SYSV), dynamically linked, with
unknown capability 0x41000000 = 0xf676e75, with unknown capability
0x10000 = 0x70403, not stripped

Regards,

Vincent.

> ---
>  package/harfbuzz/harfbuzz.hash | 4 ++--
>  package/harfbuzz/harfbuzz.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
> index 2073665..6dddf8d 100644
> --- a/package/harfbuzz/harfbuzz.hash
> +++ b/package/harfbuzz/harfbuzz.hash
> @@ -1,2 +1,2 @@
> -# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.0.5.tar.bz2.sha256
> -sha256	4d99d2c6a58ecb55538ccab522e68836383852f9f41f696d2b93cd8f85195440	harfbuzz-1.0.5.tar.bz2
> +# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.0.6.tar.bz2.sha256
> +sha256	f616a7fbdc78a627043f9029000bf08c0c71df59cde4143fc92a014f6a993b26	harfbuzz-1.0.6.tar.bz2
> diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
> index af4510d..48ff309 100644
> --- a/package/harfbuzz/harfbuzz.mk
> +++ b/package/harfbuzz/harfbuzz.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -HARFBUZZ_VERSION = 1.0.5
> +HARFBUZZ_VERSION = 1.0.6
>  HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release
>  HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
>  HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
> 

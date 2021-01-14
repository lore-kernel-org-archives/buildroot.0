From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 22:33:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to
 version 4.6.0
In-Reply-To: <20210114194832.1975973-1-fontaine.fabrice@gmail.com>
References: <20210114194832.1975973-1-fontaine.fabrice@gmail.com>
Message-ID: <20210114223303.50f459d5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 14 Jan 2021 20:48:32 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Fix CVE-2020-36177: RsaPad_PSS in wolfcrypt/src/rsa.c in wolfSSL
>   before 4.6.0 has an out-of-bounds write for certain relationships
>   between key size and digest size.
> - Drop patch (already in version)
> 
> https://github.com/wolfSSL/wolfssl/releases/tag/v4.6.0-stable
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-available-for-big-and-little-endian.patch | 32 -------------------
>  package/wolfssl/wolfssl.hash                  |  2 +-
>  package/wolfssl/wolfssl.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 34 deletions(-)
>  delete mode 100644 package/wolfssl/0001-Make-ByteReverseWords-available-for-big-and-little-endian.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 23:12:36 +0200
Subject: [Buildroot] [PATCH] mbedtls: security bump to version 2.7.5
In-Reply-To: <20180824162715.21827-1-peter@korsgaard.com>
References: <20180824162715.21827-1-peter@korsgaard.com>
Message-ID: <20180824231236.3156e26f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Aug 2018 18:27:15 +0200, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> - CVE-2018-0497: Remote plaintext recovery on use of CBC based ciphersuites
>   through a timing side-channel
> 
> - CVE-2018-0498: Plaintext recovery on use of CBC based ciphersuites through
>   a cache based side-channel
> 
> For more info, see the advisory:
> https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2018-02
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/mbedtls/mbedtls.hash | 6 +++---
>  package/mbedtls/mbedtls.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

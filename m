From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:31:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/mbedtls: security bump to
 version 2.16.11
In-Reply-To: <20210707192348.3918095-1-fontaine.fabrice@gmail.com>
References: <20210707192348.3918095-1-fontaine.fabrice@gmail.com>
Message-ID: <20210716233132.2eacf099@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed,  7 Jul 2021 21:23:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2021-07-1
> https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2021-07-2
> 
> https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.11
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mbedtls/mbedtls.hash | 4 ++--
>  package/mbedtls/mbedtls.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

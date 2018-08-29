From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Aug 2018 22:20:01 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/python-cryptography: bump
 version to 2.3.1
In-Reply-To: <20180819184242.21134-1-bernd.kuhls@t-online.de>
References: <20180819184242.21134-1-bernd.kuhls@t-online.de>
Message-ID: <20180829222001.75b4b421@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Aug 2018 20:42:42 +0200, Bernd Kuhls wrote:
> Changelog: https://cryptography.io/en/latest/changelog/#v2-3-1
> 
> Please note that CVE-2018-10903, fixed in version 2.3, was introduced
> in version 1.9.0, so it was not present in buildroot:
> https://nvd.nist.gov/vuln/detail/CVE-2018-10903
> 
> Added license hash and switched runtime dependency from pyasn1 to
> asn1crypto: https://cryptography.io/en/latest/changelog/#v1-8
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/python-cryptography/Config.in                | 2 +-
>  package/python-cryptography/python-cryptography.hash | 8 +++++---
>  package/python-cryptography/python-cryptography.mk   | 4 ++--
>  3 files changed, 8 insertions(+), 6 deletions(-)

Considering the runtime issues that are encountered with this update,
I've marked this patch as Changes Requested in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 21:39:04 +0200
Subject: [Buildroot] [PATCH] package/libopenssl: security bump to
 version 1.1.1d
In-Reply-To: <20190917132318.3070-1-peter@korsgaard.com>
References: <20190917132318.3070-1-peter@korsgaard.com>
Message-ID: <20190917213904.2a5a00bf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 17 Sep 2019 15:23:18 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security vulnerabilities:
> 
> - ECDSA remote timing attack (CVE-2019-1547)
>   Severity: Low
> 
> - Fork Protection (CVE-2019-1549)
>   Severity: Low
> 
> - Padding Oracle in PKCS7_dataDecode and CMS_decrypt_set1_pkey (CVE-2019-1563)
>   Severity: Low
> 
> For more details, see the advisory:
> https://www.openssl.org/news/secadv/20190910.txt
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/libopenssl/libopenssl.hash | 4 ++--
>  package/libopenssl/libopenssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

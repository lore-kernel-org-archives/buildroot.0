From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jun 2015 21:29:28 +0200
Subject: [Buildroot] [PATCH] php: security bump to version 5.6.10
In-Reply-To: <1434136958-26903-1-git-send-email-gustavo@zacarias.com.ar>
References: <1434136958-26903-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150612212928.5d22c739@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 12 Jun 2015 16:22:38 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2015-3414, CVE-2015-3415, CVE-2015-3416 (via bundled sqlite
> upgrade).
> CVE-2015-2325, CVE-2015-2326 (via bundled pcre upgrade).
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/php/0002-no-iconv-search.patch | 22 +++++++++++-----------
>  package/php/php.hash                   |  2 +-
>  package/php/php.mk                     |  2 +-
>  3 files changed, 13 insertions(+), 13 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

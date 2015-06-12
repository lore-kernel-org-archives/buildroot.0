From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jun 2015 21:29:39 +0200
Subject: [Buildroot] [PATCH] openssl: security bump to version 1.0.2b
In-Reply-To: <1434108959-18972-1-git-send-email-gustavo@zacarias.com.ar>
References: <1434108959-18972-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150612212939.5e0df751@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 12 Jun 2015 08:35:59 -0300, Gustavo Zacarias wrote:
> CVE-2015-1790 - PKCS7 crash with missing EnvelopedContent
> CVE-2015-1789 - Exploitable out-of-bounds read in X509_cmp_time
> CVE-2015-1788 - Malformed ECParameters causes infinite loop
> CVE-2015-1792 - CMS verify infinite loop with unknown hash function
> CVE-2015-1791 - Race condition handling NewSessionTicket
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...-match-commands-starting-with-minus-inste.patch | 27 ----------------------
>  package/openssl/openssl.hash                       |  8 +++----
>  package/openssl/openssl.mk                         |  2 +-
>  3 files changed, 5 insertions(+), 32 deletions(-)
>  delete mode 100644 package/openssl/005-Make-c_rehash-match-commands-starting-with-minus-inste.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

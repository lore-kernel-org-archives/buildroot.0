From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 26 Jul 2017 15:24:51 +0300
Subject: [Buildroot] [PATCH] webkitgtk: security bump to version 2.16.6
In-Reply-To: <20170726085040.20516-1-peter@korsgaard.com>
References: <20170726085040.20516-1-peter@korsgaard.com>
Message-ID: <20170726152451.GB7852@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

You have been faster than me sending this one, thanks!  ;-)

On Wed, 26 Jul 2017 10:50:40 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:
> Fixes the following security issues:
> 
> CVE-2017-7018 - An issue was discovered in certain Apple products.  iOS
> before 10.3.3 is affected.  Safari before 10.1.2 is affected.  iCloud before
> 6.2.2 on Windows is affected.  iTunes before 12.6.2 on Windows is affected.
> tvOS before 10.2.2 is affected.  The issue involves the "WebKit" component.
> It allows remote attackers to execute arbitrary code or cause a denial of
> service (memory corruption and application crash) via a crafted web site.
> 
> CVE-2017-7030 - An issue was discovered in certain Apple products.  iOS
> before 10.3.3 is affected.  Safari before 10.1.2 is affected.  iCloud before
> 6.2.2 on Windows is affected.  iTunes before 12.6.2 on Windows is affected.
> tvOS before 10.2.2 is affected.  The issue involves the "WebKit" component.
> It allows remote attackers to execute arbitrary code or cause a denial of
> service (memory corruption and application crash) via a crafted web site.
> 
> CVE-2017-7034 - An issue was discovered in certain Apple products.  iOS
> before 10.3.3 is affected.  Safari before 10.1.2 is affected.  iCloud before
> 6.2.2 on Windows is affected.  iTunes before 12.6.2 on Windows is affected.
> tvOS before 10.2.2 is affected.  The issue involves the "WebKit" component.
> It allows remote attackers to execute arbitrary code or cause a denial of
> service (memory corruption and application crash) via a crafted web site.
> 
> CVE-2017-7037 - An issue was discovered in certain Apple products.  iOS
> before 10.3.3 is affected.  Safari before 10.1.2 is affected.  iCloud before
> 6.2.2 on Windows is affected.  iTunes before 12.6.2 on Windows is affected.
> tvOS before 10.2.2 is affected.  The issue involves the "WebKit" component.
> It allows remote attackers to execute arbitrary code or cause a denial of
> service (memory corruption and application crash) via a crafted web site.
> 
> CVE-2017-7039 - An issue was discovered in certain Apple products.  iOS
> before 10.3.3 is affected.  Safari before 10.1.2 is affected.  iCloud before
> 6.2.2 on Windows is affected.  iTunes before 12.6.2 on Windows is affected.
> tvOS before 10.2.2 is affected.  The issue involves the "WebKit" component.
> It allows remote attackers to execute arbitrary code or cause a denial of
> service (memory corruption and application crash) via a crafted web site.
> 
> CVE-2017-7046 - An issue was discovered in certain Apple products.  iOS
> before 10.3.3 is affected.  Safari before 10.1.2 is affected.  iCloud before
> 6.2.2 on Windows is affected.  iTunes before 12.6.2 on Windows is affected.
> tvOS before 10.2.2 is affected.  The issue involves the "WebKit" component.
> It allows remote attackers to execute arbitrary code or cause a denial of
> service (memory corruption and application crash) via a crafted web site.
> 
> CVE-2017-7048 - An issue was discovered in certain Apple products.  iOS
> before 10.3.3 is affected.  Safari before 10.1.2 is affected.  iCloud before
> 6.2.2 on Windows is affected.  iTunes before 12.6.2 on Windows is affected.
> tvOS before 10.2.2 is affected.  The issue involves the "WebKit" component.
> It allows remote attackers to execute arbitrary code or cause a denial of
> service (memory corruption and application crash) via a crafted web site.
> 
> CVE-2017-7055 - An issue was discovered in certain Apple products.  iOS
> before 10.3.3 is affected.  Safari before 10.1.2 is affected.  iCloud before
> 6.2.2 on Windows is affected.  iTunes before 12.6.2 on Windows is affected.
> tvOS before 10.2.2 is affected.  The issue involves the "WebKit" component.
> It allows remote attackers to execute arbitrary code or cause a denial of
> service (memory corruption and application crash) via a crafted web site.
> 
> CVE-2017-7056 - An issue was discovered in certain Apple products.  iOS
> before 10.3.3 is affected.  Safari before 10.1.2 is affected.  iCloud before
> 6.2.2 on Windows is affected.  iTunes before 12.6.2 on Windows is affected.
> tvOS before 10.2.2 is affected.  The issue involves the "WebKit" component.
> It allows remote attackers to execute arbitrary code or cause a denial of
> service (memory corruption and application crash) via a crafted web site.
> 
> CVE-2017-7061 - An issue was discovered in certain Apple products.  iOS
> before 10.3.3 is affected.  Safari before 10.1.2 is affected.  iCloud before
> 6.2.2 on Windows is affected.  iTunes before 12.6.2 on Windows is affected.
> tvOS before 10.2.2 is affected.  The issue involves the "WebKit" component.
> It allows remote attackers to execute arbitrary code or cause a denial of
> service (memory corruption and application crash) via a crafted web site.
> 
> CVE-2017-7064 - An issue was discovered in certain Apple products.  iOS
> before 10.3.3 is affected.  Safari before 10.1.2 is affected.  iCloud before
> 6.2.2 on Windows is affected.  iTunes before 12.6.2 on Windows is affected.
> The issue involves the "WebKit" component.  It allows attackers to bypass
> intended memory-read restrictions via a crafted app.
> 
> For more details, see the announcement:
> https://webkitgtk.org/2017/07/24/webkitgtk2.16.6-released.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: "Adrian Perez de Castro" <aperez@igalia.com>

> ---
>  package/webkitgtk/webkitgtk.hash | 8 ++++----
>  package/webkitgtk/webkitgtk.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
> index 5df4ce8df3..2c0fc50611 100644
> --- a/package/webkitgtk/webkitgtk.hash
> +++ b/package/webkitgtk/webkitgtk.hash
> @@ -1,4 +1,4 @@
> -# From https://webkitgtk.org/releases/webkitgtk-2.16.5.tar.xz.sums
> -md5 fce72dc89cd310a663d9eb97133861fe webkitgtk-2.16.5.tar.xz
> -sha1 8052fda41b1b666f175baaac787c5cba39ed24a0 webkitgtk-2.16.5.tar.xz
> -sha256 8e0396f3428e757898c5856e642eed4fcd5a20ae03d96d3eaa03b76634be7dd4 webkitgtk-2.16.5.tar.xz
> +# From https://webkitgtk.org/releases/webkitgtk-2.16.6.tar.xz.sums
> +md5  0e2d142a586e4ff79cf0324f4fdbf20c webkitgtk-2.16.6.tar.xz
> +sha1 f7fca3fbac3dc99e39f353a6df250635e684c922 webkitgtk-2.16.6.tar.xz
> +sha256 fc23650df953123c59b9c0edf3855e7bd55bd107820997fc72375811e1ea4b21 webkitgtk-2.16.6.tar.xz
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index ef20839f92..b200d23262 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WEBKITGTK_VERSION = 2.16.5
> +WEBKITGTK_VERSION = 2.16.6
>  WEBKITGTK_SITE = http://www.webkitgtk.org/releases
>  WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
>  WEBKITGTK_INSTALL_STAGING = YES
> -- 
> 2.11.0




-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170726/0ac11077/attachment.asc>

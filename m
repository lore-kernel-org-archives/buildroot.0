From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Oct 2018 09:50:29 +0100
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.62.0
In-Reply-To: <20181031084056.25144-1-peter@korsgaard.com>
References: <20181031084056.25144-1-peter@korsgaard.com>
Message-ID: <20181031095029.0195b7be@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 Oct 2018 09:40:55 +0100, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> CVE-2018-16839: SASL password overflow via integer overflow
> https://curl.haxx.se/docs/CVE-2018-16839.html
> 
> CVE-2018-16840: use-after-free in handle close
> https://curl.haxx.se/docs/CVE-2018-16840.html
> 
> CVE-2018-16842: warning message out-of-buffer read
> https://curl.haxx.se/docs/CVE-2018-16842.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/libcurl/libcurl.hash | 4 ++--
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

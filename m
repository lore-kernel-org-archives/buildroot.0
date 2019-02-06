From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 20:33:00 +0100
Subject: [Buildroot] [PATCH] package/libcurl: security bump to version
 7.64.0
In-Reply-To: <20190206165436.8652-1-peter@korsgaard.com>
References: <20190206165436.8652-1-peter@korsgaard.com>
Message-ID: <20190206203300.53061559@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  6 Feb 2019 17:54:35 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issues:
> 
> CVE-2018-16890: NTLM type-2 out-of-bounds buffer read
> https://curl.haxx.se/docs/CVE-2018-16890.html
> 
> CVE-2019-3822: NTLMv2 type-3 header stack buffer overflow
> https://curl.haxx.se/docs/CVE-2019-3822.html
> 
> CVE-2019-3823: SMTP end-of-response out-of-bounds read
> https://curl.haxx.se/docs/CVE-2019-3823.html
> 
> The copyright year changed in the COPYING file, so update the hash.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/libcurl/libcurl.hash | 6 +++---
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

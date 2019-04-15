From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Apr 2019 21:40:41 +0200
Subject: [Buildroot] [PATCH] package/wpewebkit: security bump to version
 2.22.5
In-Reply-To: <20190414185736.21381-1-peter@korsgaard.com>
References: <20190414185736.21381-1-peter@korsgaard.com>
Message-ID: <20190415214041.739f9824@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Apr 2019 20:57:36 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issues:
> 
> - CVE-2019-8518: Processing maliciously crafted web content may lead to
>   arbitrary code execution.  Multiple memory corruption issues were
>   addressed with improved memory handling.
> 
> - CVE-2019-8523: Processing maliciously crafted web content may lead to
>   arbitrary code execution.  Multiple memory corruption issues were
>   addressed with improved memory handling.
> 
> In addition, 2.22.5 contains a number of bugfixes.  From the announcement:
> 
>   - Fix rendering of glyphs in Hebrew (and possibly other languages) when
>     Unicode NFC normalization is used.
>   - Fix several crashes and race conditions.
> 
> Change SITE to https as the webserver uses HSTS.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/wpewebkit/wpewebkit.hash | 8 ++++----
>  package/wpewebkit/wpewebkit.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

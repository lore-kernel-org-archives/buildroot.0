From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Apr 2019 21:52:04 +0200
Subject: [Buildroot] [PATCH] package/webkitgtk: bump version to 2.22.7
In-Reply-To: <20190403193943.27399-1-peter@korsgaard.com>
References: <20190403193943.27399-1-peter@korsgaard.com>
Message-ID: <20190403215204.79122034@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  3 Apr 2019 21:39:43 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> 2.22.7 contains a number of bugfixes. From the announcement:
> 
>  - Fix rendering of glyphs in Hebrew (and possibly other languages) when
>    Unicode NFC normalization is used.
> 
>  - Fix several crashes and race conditions.
> 
> https://webkitgtk.org/2019/03/01/webkitgtk2.22.7-released.html
> 
> Change SITE to https as the webserver uses HSTS.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/webkitgtk/webkitgtk.hash | 8 ++++----
>  package/webkitgtk/webkitgtk.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

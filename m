From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 21:04:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/spandsp: needs jpeg support in
 tiff package
In-Reply-To: <20200903053248.475324-1-bernd.kuhls@t-online.de>
References: <20200903053248.475324-1-bernd.kuhls@t-online.de>
Message-ID: <20200903210456.0e528aa0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  3 Sep 2020 07:32:48 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/f5e/f5efa4aeef661670403111074b9397da47167d07/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/spandsp/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master after extending the commit log with additional
details you provided. When you send a fix, please always include some
details on since when the breakage occurs, and why. This helps us
understand if the fix is needed only for master, or also for one or
several of the stable branches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

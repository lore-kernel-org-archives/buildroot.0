From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 15:38:30 +0200
Subject: [Buildroot] [PATCH 2/2] eventlog: remove package
In-Reply-To: <20190909095432.3935-2-judge.packham@gmail.com>
References: <20190909095432.3935-1-judge.packham@gmail.com>
 <20190909095432.3935-2-judge.packham@gmail.com>
Message-ID: <20190915153830.229bea1c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  9 Sep 2019 21:54:32 +1200
Chris Packham <judge.packham@gmail.com> wrote:

> Since syslog-ng 3.11.1 eventlog has been bundled with the sources.
> Remove the separate package.
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  DEVELOPERS                     |  1 -
>  package/Config.in              |  1 -
>  package/eventlog/Config.in     |  8 --------
>  package/eventlog/eventlog.hash |  2 --
>  package/eventlog/eventlog.mk   | 15 ---------------
>  package/syslog-ng/syslog-ng.mk |  2 +-
>  6 files changed, 1 insertion(+), 28 deletions(-)
>  delete mode 100644 package/eventlog/Config.in
>  delete mode 100644 package/eventlog/eventlog.hash
>  delete mode 100644 package/eventlog/eventlog.mk

Applied to master after extending the commit log to explain why we
don't have any Config.in.legacy handling for this package removal.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

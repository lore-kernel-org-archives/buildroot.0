From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 21:42:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnuplot: Add patch to fix
 'undefined reference to gp_read_history'
In-Reply-To: <20200914090759.22116-1-mf@go-sys.de>
References: <20200914090759.22116-1-mf@go-sys.de>
Message-ID: <20200919214225.39f11f8a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Sep 2020 11:07:59 +0200
Michael Fischer <mf@go-sys.de> wrote:

> Fixes:
>  - http://autobuild.buildroot.net/results/e09087f0afd323a220889e2c7827fd73c9025673
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  package/gnuplot/0002-without-history.patch | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 package/gnuplot/0002-without-history.patch

Applied to master, thanks. Please submit the patch to upstream gnuplot.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 15:00:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/netcalc: new package
In-Reply-To: <20200918060425.812748-1-troglobit@gmail.com>
References: <20200918060425.812748-1-troglobit@gmail.com>
Message-ID: <20200919150013.162e152b@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 18 Sep 2020 08:04:26 +0200
Joachim Wiberg <troglobit@gmail.com> wrote:

> netcalc is a slimmed down clone of sipcalc, using the popular output
> format of ipcalc (perl).  It is written in C and only depends on a
> POSIX compliant C library.  Both IPv4 and IPv6 are supported.
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  DEVELOPERS                   |  1 +
>  package/Config.in            |  1 +
>  package/netcalc/Config.in    |  8 ++++++++
>  package/netcalc/netcalc.hash |  5 +++++
>  package/netcalc/netcalc.mk   | 13 +++++++++++++
>  5 files changed, 28 insertions(+)
>  create mode 100644 package/netcalc/Config.in
>  create mode 100644 package/netcalc/netcalc.hash
>  create mode 100644 package/netcalc/netcalc.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

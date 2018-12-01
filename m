From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Dec 2018 23:21:15 +0100
Subject: [Buildroot] [PATCH 1/2] package/libtorrent-rasterbar: new
 package
In-Reply-To: <20181123181426.16116-1-richterphilipp.pops@gmail.com>
References: <20181123181426.16116-1-richterphilipp.pops@gmail.com>
Message-ID: <20181201232115.1ecf0e16@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Nov 2018 19:14:25 +0100, Philipp Richter wrote:
> libtorrent is a feature complete C++ bittorrent implementation
> focusing on efficiency and scalability.
> 
> https://www.libtorrent.org/
> 
> Signed-off-by: Philipp Richter <richterphilipp.pops@gmail.com>
> ---
>  DEVELOPERS                                    |  3 +++
>  package/Config.in                             |  1 +
>  package/libtorrent-rasterbar/Config.in        | 21 +++++++++++++++++
>  .../libtorrent-rasterbar.hash                 |  3 +++
>  .../libtorrent-rasterbar.mk                   | 23 +++++++++++++++++++
>  5 files changed, 51 insertions(+)
>  create mode 100644 package/libtorrent-rasterbar/Config.in
>  create mode 100644 package/libtorrent-rasterbar/libtorrent-rasterbar.hash
>  create mode 100644 package/libtorrent-rasterbar/libtorrent-rasterbar.mk

Thanks, I've applied to next, with one significant change (and a few
minor formatting fixes). See below.


> +LIBTORRENT_RASTERBAR_VERSION = 1.1.11
> +LIBTORRENT_RASTERBAR_SITE = https://github.com/arvidn/libtorrent/releases/download/libtorrent_$(subst .,_,$(LIBTORRENT_RASTERBAR_VERSION))
> +LIBTORRENT_RASTERBAR_LICENSE = BSD-2-Clause

The license text says BSD-3-Clause, not BSD-2-Clause, so I fixed that
when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 20:50:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvpx: vp9 encoder needs c++
In-Reply-To: <20200923180830.84180-1-bernd.kuhls@t-online.de>
References: <20200923180830.84180-1-bernd.kuhls@t-online.de>
Message-ID: <20200923205053.2cc17db9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Sep 2020 20:08:30 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Encoding rate control interface for v9 is implemented in c++:
> https://github.com/webmproject/libvpx/commit/745979bc2913b4f26847084699d9fddd68b60410#diff-58f26933c120328b31831a743eec5ba3R534
> 
> Disable vp9 encoding when toolchain lacks c++.
> 
> Fixes:
> http://autobuild.buildroot.net/results/983/9836215fe22f260483f9153fb5447892801a14a9/
> http://autobuild.buildroot.net/results/88a/88aa80ee006ba2dcc40c15be3af73c756cb62974/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libvpx/libvpx.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

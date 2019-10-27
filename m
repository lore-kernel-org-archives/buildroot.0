From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 20:18:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/leveldb: fix malformatted patch
In-Reply-To: <20191027173234.2674-1-bernd.kuhls@t-online.de>
References: <20191027173234.2674-1-bernd.kuhls@t-online.de>
Message-ID: <20191027201809.78ed6750@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 18:32:34 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/e46/e46d67d0e8b4b47fc09e631ca46ed02594ced801/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/leveldb/0002-CMake-install-libmemenv.a.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

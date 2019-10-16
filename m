From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 22:28:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/proj: needs wchar
In-Reply-To: <20191014022042.3629-1-bernd.kuhls@t-online.de>
References: <20191014022042.3629-1-bernd.kuhls@t-online.de>
Message-ID: <20191016222805.717e4f57@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Oct 2019 04:20:42 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Propagate dependency also to libgeotiff
> 
> Fixes:
> http://autobuild.buildroot.net/results/f8e/f8e261dd64346caeff568a23621b3dd15ac3967c/
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libgeotiff/Config.in | 6 ++++--
>  package/proj/Config.in       | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

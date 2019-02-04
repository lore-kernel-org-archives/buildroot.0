From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 21:27:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: Fix building with
 libfdk-aac v2
In-Reply-To: <20190128205519.693-1-bernd.kuhls@t-online.de>
References: <20190128205519.693-1-bernd.kuhls@t-online.de>
Message-ID: <20190204212759.4c14acfe@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 28 Jan 2019 21:55:19 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Add upstream patches to fix
> http://autobuild.buildroot.net/results/909/9097a2b190f4032ff51eda531f4379a99da5181a/
> 
> after fdk-aac was bumped to 2.0.0:
> https://git.buildroot.net/buildroot/commit/package/fdk-aac?id=31ff32824a4f3d09351367c3418b5605f9c40521
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...cenc-Fix-building-with-libfdk-aac-v2.patch | 100 ++++++++++++++++++
>  ...stently-use-a-proper-version-check-m.patch |  99 +++++++++++++++++
>  ...dk-aac-Don-t-use-defined-in-a-define.patch |  72 +++++++++++++
>  3 files changed, 271 insertions(+)
>  create mode 100644 package/ffmpeg/0002-libfdk-aacenc-Fix-building-with-libfdk-aac-v2.patch
>  create mode 100644 package/ffmpeg/0003-libfdk-aac-Consistently-use-a-proper-version-check-m.patch
>  create mode 100644 package/ffmpeg/0004-libfdk-aac-Don-t-use-defined-in-a-define.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

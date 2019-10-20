From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Oct 2019 15:39:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: security bump
 version to 9.50
In-Reply-To: <20191020111812.15996-1-bernd.kuhls@t-online.de>
References: <20191020111812.15996-1-bernd.kuhls@t-online.de>
Message-ID: <20191020153942.5cff5e79@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Oct 2019 13:18:12 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes CVE-2019-10216:
> https://security-tracker.debian.org/tracker/CVE-2019-10216
> 
> Removed patch applied upstream.
> 
> Release notes:
> https://ghostscript.com/pipermail/gs-devel/2019-October/010232.html
> 
> Changelog:
> https://www.ghostscript.com/doc/9.50/News.htm
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...-the-crazy-md5-file-copying-nonsense.patch | 252 ------------------
>  package/ghostscript/ghostscript.hash          |   4 +-
>  package/ghostscript/ghostscript.mk            |   2 +-
>  3 files changed, 3 insertions(+), 255 deletions(-)
>  delete mode 100644 package/ghostscript/0002-Bug-700986-Remove-the-crazy-md5-file-copying-nonsense.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

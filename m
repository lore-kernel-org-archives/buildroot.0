From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 22:20:43 +0200
Subject: [Buildroot] [PATCH] package/davfs2: bump to version 1.5.6
In-Reply-To: <20200425200010.6870-1-ryanbarnett3@gmail.com>
References: <20200425200010.6870-1-ryanbarnett3@gmail.com>
Message-ID: <20200425222043.7a6df3ac@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 Apr 2020 15:00:10 -0500
Ryan Barnett <ryanbarnett3@gmail.com> wrote:

> Remove 0002-fix-iconv.patch as this has been fixed as part of bug
> 56178 which is a part of the 1.5.6 release.
> 
>   http://savannah.nongnu.org/bugs/?56178
> 
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> ---
>  package/davfs2/0002-fix-iconv.patch | 48 -----------------------------
>  package/davfs2/davfs2.hash          |  2 +-
>  package/davfs2/davfs2.mk            |  2 +-
>  3 files changed, 2 insertions(+), 50 deletions(-)
>  delete mode 100644 package/davfs2/0002-fix-iconv.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 23:00:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: bump to version
 9.53.2
In-Reply-To: <20200926193502.739394-1-fontaine.fabrice@gmail.com>
References: <20200926193502.739394-1-fontaine.fabrice@gmail.com>
Message-ID: <20200930230052.755c58cd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Sep 2020 21:35:02 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop first patch (already in version)
> - Drop second patch (not needed since
>   https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=f0d19bf181a156d011dba422ae4d165b36b0af7e)
> - Drop autoreconf
> 
> https://www.ghostscript.com/doc/9.53.2/News.htm
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Fix-cross-compilation-issue.patch    | 36 -----------------
>  ...2-configure.ac-fix-cross-compilation.patch | 39 -------------------
>  package/ghostscript/ghostscript.hash          |  4 +-
>  package/ghostscript/ghostscript.mk            |  4 +-
>  4 files changed, 3 insertions(+), 80 deletions(-)
>  delete mode 100644 package/ghostscript/0001-Fix-cross-compilation-issue.patch
>  delete mode 100644 package/ghostscript/0002-configure.ac-fix-cross-compilation.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

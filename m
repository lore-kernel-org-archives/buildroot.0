From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jul 2017 19:36:42 +0200
Subject: [Buildroot] [PATCH] tiff: add upstream security fix for
 CVE-2017-10688
In-Reply-To: <20170714142426.1041-1-peter@korsgaard.com>
References: <20170714142426.1041-1-peter@korsgaard.com>
Message-ID: <20170714193642.3cbcdcf6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Jul 2017 16:24:26 +0200, Peter Korsgaard wrote:
> Fixes CVE-2017-10688 - n LibTIFF 4.0.8, there is a assertion abort in the
> TIFFWriteDirectoryTagCheckedLong8Array function in tif_dirwrite.c.  A
> crafted input will lead to a remote denial of service attack.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ..._dirwrite.c-in-TIFFWriteDirectoryTagCheck.patch | 70 ++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 package/tiff/0001-libtiff-tif_dirwrite.c-in-TIFFWriteDirectoryTagCheck.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

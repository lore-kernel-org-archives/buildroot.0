From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Aug 2020 13:22:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/libubox: fix build with gcc 10
In-Reply-To: <20200822092816.3158-1-fontaine.fabrice@gmail.com>
References: <20200822092816.3158-1-fontaine.fabrice@gmail.com>
Message-ID: <20200823132254.1ec54fd6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 22 Aug 2020 11:28:16 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/aef10cc43f6c34f106624588ae2a1131520ee066
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...x-array-out-of-bounds-GCC-10-warning.patch | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/libubox/0001-blobmsg-fix-array-out-of-bounds-GCC-10-warning.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

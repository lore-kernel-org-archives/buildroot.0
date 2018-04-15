From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 20:36:20 +0200
Subject: [Buildroot] [PATCH 1/1] libglib2: fix gobject with gcc <= 4.7
In-Reply-To: <20180415082339.5520-1-fontaine.fabrice@gmail.com>
References: <20180415082339.5520-1-fontaine.fabrice@gmail.com>
Message-ID: <20180415203620.4ab60b93@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 15 Apr 2018 10:23:39 +0200, Fabrice Fontaine wrote:
> Patch under upstream review: https://bugzilla.gnome.org/show_bug.cgi?id=795138
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/b29a2f868438a2210873ea72f491db63175848be
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0003-gobject-fix-compilation-with-gcc-4.7.patch | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/libglib2/0003-gobject-fix-compilation-with-gcc-4.7.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

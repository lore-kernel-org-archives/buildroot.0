From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 23:21:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/mjpegtools: fix build with
 -fPIC on x86
In-Reply-To: <20191026193530.25404-1-fontaine.fabrice@gmail.com>
References: <20191026193530.25404-1-fontaine.fabrice@gmail.com>
Message-ID: <20191026232106.7eacb8c1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Oct 2019 21:35:30 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Retrieve upstream patch to fix build with BR2_PIC_PIE on x86
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b1252b7907944d227694ad8506de25881bf2ca04
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...uses-problems-on-some-x86_64-systems.patch | 73 +++++++++++++++++++
>  package/mjpegtools/mjpegtools.mk              |  2 +
>  2 files changed, 75 insertions(+)
>  create mode 100644 package/mjpegtools/0001-PROGRAM_NOPIC-apparently-causes-problems-on-some-x86_64-systems.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

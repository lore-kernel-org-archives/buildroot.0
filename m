From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 16:08:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/iwd: fix build with uclibc
In-Reply-To: <20200910062026.498143-1-fontaine.fabrice@gmail.com>
References: <20200910062026.498143-1-fontaine.fabrice@gmail.com>
Message-ID: <20200920160847.54436a7a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 10 Sep 2020 08:20:26 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This patch is needed to fix a build failure with iwd 1.9.0 and uclibc
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c7a0096a269bfc52bd8e23d453d36d5bfb61441d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-src-ap.c-fix-build-with-uclibc.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/iwd/0001-src-ap.c-fix-build-with-uclibc.patch

Applied to master, thanks. I have updated the upstream status, as the
patch was accepted upstream as pointed out by Peter Seiderer.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

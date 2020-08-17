From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Aug 2020 12:17:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/iftop: fix build with gcc 10
In-Reply-To: <20200816223451.1490784-1-fontaine.fabrice@gmail.com>
References: <20200816223451.1490784-1-fontaine.fabrice@gmail.com>
Message-ID: <20200817121748.65315cde@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Aug 2020 00:34:51 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/55a8581f11e776439782c228441ef1c8c1243386
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-ui_common.h-fix-build-with-gcc-10.patch | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 package/iftop/0001-ui_common.h-fix-build-with-gcc-10.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

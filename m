From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2020 16:40:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/ifplugd: fix build with gcc 10
In-Reply-To: <20200817191737.3383757-1-fontaine.fabrice@gmail.com>
References: <20200817191737.3383757-1-fontaine.fabrice@gmail.com>
Message-ID: <20200818164022.75e6454c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Aug 2020 21:17:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/63f7c6fc4a2a30c8eb0298856a2615f816d50299
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...rc-interface.h-fix-build-with-gcc-10.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/ifplugd/0005-src-interface.h-fix-build-with-gcc-10.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

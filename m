From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Dec 2019 22:07:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/librsvg: add libcroco to
 Requires.private
In-Reply-To: <20191224160243.1310468-1-fontaine.fabrice@gmail.com>
References: <20191224160243.1310468-1-fontaine.fabrice@gmail.com>
Message-ID: <20191225220747.0ac47865@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 24 Dec 2019 17:02:43 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This will fix a static build failure with imagemagick
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/42f4b4881569779162d3efe4628b934f965913b9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ....in-add-libcroco-to-Requires.Private.patch | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/librsvg/0001-librsvg.pc.in-add-libcroco-to-Requires.Private.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

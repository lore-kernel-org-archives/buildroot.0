From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Feb 2019 11:16:34 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/ncmpc: fix build on sparc
In-Reply-To: <20190211210011.8789-1-fontaine.fabrice@gmail.com>
References: <20190211210011.8789-1-fontaine.fabrice@gmail.com>
Message-ID: <20190212111634.2bc12812@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Feb 2019 22:00:11 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/7ac1a07e4f72633d3ec92b79dc5d8c062490abdc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...son.build-add-atomic-dependency-for-sparc.patch | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/ncmpc/0002-meson.build-add-atomic-dependency-for-sparc.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

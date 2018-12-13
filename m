From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 21:48:36 +0100
Subject: [Buildroot] [PATCH 1/1] libva: fix build with pkgconf 1.5.3
In-Reply-To: <20181211181943.14944-1-fontaine.fabrice@gmail.com>
References: <20181211181943.14944-1-fontaine.fabrice@gmail.com>
Message-ID: <20181213214836.472bf753@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Dec 2018 19:19:43 +0100, Fabrice Fontaine wrote:
> Set ac_cv_path_WAYLAND_SCANNER to the wayland-scanner in the host
> directory otherwise build will fail because libva will use pkgconfig to
> find it
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/836d3a7085c576f607b1532d5204a54d6c2c1e66
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libva/libva.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

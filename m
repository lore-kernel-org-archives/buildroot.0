From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 21:23:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/wayland-utils: needs
 wayland-protocols
In-Reply-To: <20200907184459.221038-1-fontaine.fabrice@gmail.com>
References: <20200907184459.221038-1-fontaine.fabrice@gmail.com>
Message-ID: <20200907212346.5c7f22a2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  7 Sep 2020 20:44:59 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> wayland-utils needs wayland-protocols:
> 
> Run-time dependency wayland-protocols found: NO (tried pkgconfig)
> 
> ../output-1/build/wayland-utils-1.0.0/wayland-info/meson.build:4:0: ERROR: Dependency "wayland-protocols" not found, tried pkgconfig
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ea4daeb94c25232e3b4a34c1da72bf9bbd5f3cce
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wayland-utils/Config.in        | 1 +
>  package/wayland-utils/wayland-utils.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

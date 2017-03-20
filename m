From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 22:33:45 +0100
Subject: [Buildroot] [PATCH v2] gst1-plugins-bad: waylandsink needs
 wayland-protocols
In-Reply-To: <20170306204347.30354-1-ps.report@gmx.net>
References: <20170306204347.30354-1-ps.report@gmx.net>
Message-ID: <20170320223345.0e543bcf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Mar 2017 21:43:47 +0100, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ----
> Changes v1 -> v2:
>   - use select instead of depends for BR2_PACKAGE_WAYLAND_PROTOCOLS
>    (suggested by Thomas Petazzoni)
>   - add select BR2_PACKAGE_WAYLAND_PROTOCOLS to missing second
>     place (BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND)
> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in           | 2 ++
>  package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

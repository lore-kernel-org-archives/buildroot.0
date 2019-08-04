From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 18:47:57 +0200
Subject: [Buildroot] [PATCH 1/2] package/collectd: remove libvirt from
 list of disabled plugins
In-Reply-To: <20190804150957.7844-1-bernd.kuhls@t-online.de>
References: <20190804150957.7844-1-bernd.kuhls@t-online.de>
Message-ID: <20190804184757.64f15f87@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  4 Aug 2019 17:09:56 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> With collectd 5.5.0 the "libvirt plugin has been renamed to virt":
> https://git.octo.it/?p=collectd.git;a=blob;f=ChangeLog;h=b0a997c53ac1a74bc39470bdd243f853fa095c9f;hb=refs/tags/collectd-5.5.0#l235
> 
> "virt" is already mentioned in COLLECTD_PLUGINS_DISABLE so we can just
> remove "libvirt" to fix:
> 
> configure: WARNING: unrecognized options: [...] --disable-libvirt
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/collectd/collectd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

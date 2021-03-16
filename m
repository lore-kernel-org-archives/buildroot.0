From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:25:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/libnet: add
 LIBNET_CONFIG_SCRIPTS
In-Reply-To: <20210316201824.3179128-1-fontaine.fabrice@gmail.com>
References: <20210316201824.3179128-1-fontaine.fabrice@gmail.com>
Message-ID: <20210316212556.27ed1917@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Mar 2021 21:18:24 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Set LIBNET_CONFIG_SCRIPTS to libnet-config to fix a build failure with
> syslog-ng and libnet in version 1.2 due to -L$(libdir) which has been
> added with
> https://github.com/libnet/libnet/commit/6859d1f198f97aad129c54fcd156700a9178204e
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/45e517401d14e304e9c6c990f1b4ead92c850ba2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libnet/libnet.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

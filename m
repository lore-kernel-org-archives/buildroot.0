From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Dec 2012 20:45:51 +0100
Subject: [Buildroot] [PATCH 1/2] package/dvb-apps: new package
In-Reply-To: <8beb4706189f8caa51dc30c364c720d780f0a67f.1356719913.git.yann.morin.1998@free.fr>
References: <cover.1356719913.git.yann.morin.1998@free.fr>
 <8beb4706189f8caa51dc30c364c720d780f0a67f.1356719913.git.yann.morin.1998@free.fr>
Message-ID: <20121228204551.11f370ef@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 28 Dec 2012 19:42:11 +0100, Yann E. MORIN wrote:
> We just need the transponders data, so we just install those.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/dvb-apps/dvb-apps.mk |   32 ++++++++++++++++++++++++++++++++
>  1 files changed, 32 insertions(+), 0 deletions(-)
>  create mode 100644 package/dvb-apps/dvb-apps.mk
> 
> diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
> new file mode 100644
> index 0000000..781e466
> --- /dev/null
> +++ b/package/dvb-apps/dvb-apps.mk
> @@ -0,0 +1,32 @@
> +#############################################################
> +#
> +# keyutils

Some issue here :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 20:18:03 +0100
Subject: [Buildroot] [PATCH 1/3] package/libsigrok: fix configure options
In-Reply-To: <20191027174949.13805-1-fontaine.fabrice@gmail.com>
References: <20191027174949.13805-1-fontaine.fabrice@gmail.com>
Message-ID: <20191027201803.309c33df@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 18:49:47 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove --disable-glibtest (unrecognized option)
> - Switch --{en,dis}able-xxx options by --{with,without}-xxx options
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libsigrok/libsigrok.mk | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

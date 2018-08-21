From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 11:47:33 +0200
Subject: [Buildroot] [PATCH next 1/2] libaio: add host variant
In-Reply-To: <20180816092944.10586-1-thomas.petazzoni@bootlin.com>
References: <20180816092944.10586-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180821114733.05f4a200@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Aug 2018 11:29:43 +0200, Thomas Petazzoni wrote:
> Since the bump of lvm2 to 2.02.180 in commit
> 8e666bf29e762f3c7681a48d0ee350f8396d798f, lvm2 needs libaio. This was
> properly taken into account for the target lvm2 variant, but not the
> host lvm2 variant. In order to build the host lvm2, we now need
> host-libaio, so this patch adds support for building libaio for the
> host.
> 
> Part of fixing:
> 
>   http://autobuild.buildroot.net/results/f95dd353c17bdfd00fde6762e58aa32e6830b52b/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/libaio/libaio.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)

Both applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

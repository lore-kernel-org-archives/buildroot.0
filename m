From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Feb 2018 10:54:12 +0100
Subject: [Buildroot] [PATCH] iproute2: fix build with uclibc-ng
In-Reply-To: <4e9671e90351352197f0d14165365e811435633e.1518674314.git.baruch@tkos.co.il>
References: <4e9671e90351352197f0d14165365e811435633e.1518674314.git.baruch@tkos.co.il>
Message-ID: <20180215105412.2369f794@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Feb 2018 07:58:34 +0200, Baruch Siach wrote:
> ublibc-ng does not provide PF_VSOCK/AF_VSOCK definitions. Add them
> locally until ucblibc-ng updates its headers.
> 
> Fixes:
> http://autobuild.buildroot.net/results/3d5/3d5a29e3c61ff071628c2937844ea4156059b3dd/
> 
> Cc: Petr Vorel <petr.vorel@gmail.com>
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...s-add-local-PF_VSOCK-AF_VSOCK-definitions.patch | 58 ++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 package/iproute2/0002-ss-add-local-PF_VSOCK-AF_VSOCK-definitions.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

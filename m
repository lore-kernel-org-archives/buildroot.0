From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Jul 2018 17:02:59 +0200
Subject: [Buildroot] [PATCH v2 1/2] nghttp2: new package
In-Reply-To: <20180719135409.8859-1-michael.burtin@netgem.com>
References: <20180719135409.8859-1-michael.burtin@netgem.com>
Message-ID: <20180719170259.76870b82@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Jul 2018 15:54:08 +0200, Micha?l Burtin wrote:
> nghttp2 is an implementation of HTTP/2 and its header
> compression algorithm HPACK in C.
> 
> Signed-off-by: Micha?l Burtin <michael.burtin@netgem.com>
> Signed-off-by: Anisse Astier <anisse.astier.ext@netgem.com>
> 
> ---
> Changes v1 -> v2 (from Thomas Petazzoni review):
>   - rename package to nghttp2 (original software name)
>   - fix formatting (checked with check-package)
>   - package added to DEVELOPERS file
>   - fix LICENSE_FILES (remove LICENCE)
>   - add checksum for COPYING file
> ---
>  DEVELOPERS                   |  1 +
>  package/Config.in            |  1 +
>  package/nghttp2/Config.in    |  7 +++++++
>  package/nghttp2/nghttp2.hash |  3 +++
>  package/nghttp2/nghttp2.mk   | 22 ++++++++++++++++++++++
>  5 files changed, 34 insertions(+)
>  create mode 100644 package/nghttp2/Config.in
>  create mode 100644 package/nghttp2/nghttp2.hash
>  create mode 100644 package/nghttp2/nghttp2.mk

Thanks, both patches applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

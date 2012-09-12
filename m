From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Sep 2012 18:12:42 +0200
Subject: [Buildroot] [PATCH] dropbear: add license information
In-Reply-To: <50503FB3.6080807@mimc.co.uk>
References: <50503FB3.6080807@mimc.co.uk>
Message-ID: <5050B47A.10504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/12/12 09:54, Mark Jackson wrote:
> Signed-off-by: Mark Jackson<mpfj@newflow.co.uk>
> ---
>   package/dropbear/dropbear.mk |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index 64d3a01..cd349b0 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -6,6 +6,8 @@
>
>   DROPBEAR_VERSION = 2012.55
>   DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
> +DROPBEAR_LICENSE = dropbear license
> +DROPBEAR_LICENSE_FILES = LICENSE

  I'd call it "MIT BSD-2c public domain", that's more descriptive.

  Luca and others: what should we do when several licenses apply?
Up to now, we've always just put a space between them, but the problem
is that something like "public domain" already has a space. Maybe it's
better to put

MIT && BSD-2c && public domain

?

Regards,
Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

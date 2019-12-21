From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Dec 2019 22:43:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/libtirpc: Bump to version 1.2.5
In-Reply-To: <20191220174537.27562-1-petr.vorel@gmail.com>
References: <20191220174537.27562-1-petr.vorel@gmail.com>
Message-ID: <20191221224315.4aa53ae3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Petr,

On Fri, 20 Dec 2019 18:45:37 +0100
Petr Vorel <petr.vorel@gmail.com> wrote:

> Rebased 0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch,
> dropped 3 patches accepted upstream.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Thanks for this version bump!

> diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
> index eacc94d1de..84880290f1 100644
> --- a/package/libtirpc/libtirpc.hash
> +++ b/package/libtirpc/libtirpc.hash
> @@ -1,5 +1,4 @@
>  # From sourceforge's info on download page:
> -sha1 d85717035cb9bd6c45557a1eb1351d3af9a69ff7  libtirpc-1.1.4.tar.bz2

Removing just this line leaves the "From sourceforge's info on download
page" comment a bit "alone".

Also, Sourceforge does have the SHA1 hash for the 1.2.5 tarball, so
instead I've re-added that line with the correct SHA1 provided by
Sourceforge.

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

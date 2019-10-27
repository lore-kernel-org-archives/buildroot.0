From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 11:36:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/cppunit: bump version to 1.14.0
In-Reply-To: <20191027093716.23877-1-bernd.kuhls@t-online.de>
References: <20191027093716.23877-1-bernd.kuhls@t-online.de>
Message-ID: <20191027113601.1469d13b@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 10:37:16 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://cgit.freedesktop.org/libreoffice/cppunit/tree/NEWS
> 
> Added sha256 hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/cppunit/cppunit.hash | 3 ++-
>  package/cppunit/cppunit.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cppunit/cppunit.hash b/package/cppunit/cppunit.hash
> index a097e3256d..871ce1e542 100644
> --- a/package/cppunit/cppunit.hash
> +++ b/package/cppunit/cppunit.hash
> @@ -1,5 +1,6 @@
>  # hash from: http://www.freedesktop.org/wiki/Software/cppunit/:
> -md5	d1c6bdd5a76c66d2c38331e2d287bc01  cppunit-1.13.2.tar.gz
> +md5	7ad93022171710a541bfe4bfd8b4a381  cppunit-1.14.0.tar.gz
> +sha256	3d569869d27b48860210c758c4f313082103a5e58219a7669b52bfd29d674780  cppunit-1.14.0.tar.gz
>  
>  # Locally calculated:
>  sha512	8f4be569f321d577cec31931f49f4df143bc94e283605509b6ea50c60690aa91a2aed940e7eebd4b2413a4218f9a6c3978d312d8e587eab040283c6563846ecd  cppunit-1.13.2.tar.gz

You forgot to drop this one. Also, the hash for the license file could
be added.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

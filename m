From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 23:41:51 +0200
Subject: [Buildroot] [PATCH 08/12] libnfc: Bump version and change site
In-Reply-To: <1437943118-18060-9-git-send-email-maxime.hadjinlian@gmail.com>
References: <1437943118-18060-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1437943118-18060-9-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150726234151.6bde7028@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 26 Jul 2015 22:38:34 +0200, Maxime Hadjinlian wrote:

> diff --git a/package/libnfc/libnfc.hash b/package/libnfc/libnfc.hash
> new file mode 100644
> index 0000000..dbaf32d
> --- /dev/null
> +++ b/package/libnfc/libnfc.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256 945e74d8e27683f9b8a6f6e529557b305d120df347a960a6a7ead6cb388f4072  libnfc-1.7.1.tar.bz2
> +

It was also on several other patches: useless trailing newline here.

I've (hopefully) fixed before applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

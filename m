From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Mar 2011 23:57:11 +0100
Subject: [Buildroot] [PATCH] libnss: Add new package.
In-Reply-To: <AANLkTinFsyQbjv2PvuzV3TDmzMDZkCfAR95_sycwBo1x@mail.gmail.com>
References: <AANLkTinFsyQbjv2PvuzV3TDmzMDZkCfAR95_sycwBo1x@mail.gmail.com>
Message-ID: <20110315235711.05d56f8d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Mar 2011 17:24:56 +0000
Will Newton <will.newton@gmail.com> wrote:

> NSS is the Network Security Services library developed as part of
> the Mozilla project. It provides similar functions to OpenSSL but
> allows MPL, GPL and LGPL licensing.

Just curious, besides Mozilla software, are there other software
components that rely on libnss ?

> +config BR2_PACKAGE_LIBNSS
> +	bool "libnss"
> +	depends on BR2_PACKAGE_LIBNSPR
> +	depends on BR2_PACKAGE_SQLITE
> +	depends on BR2_PACKAGE_ZLIB

The tradition is to use "select" dependencies for
non-obvious dependencies on libraries.

> diff --git a/package/libnss/libnss-cross.patch
> b/package/libnss/libnss-cross.patch

Your patch seems wrapped.

The patch lacks a description.

Regards!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

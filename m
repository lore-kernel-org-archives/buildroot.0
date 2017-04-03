From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 15:30:39 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libva-utils: new package
In-Reply-To: <20170403055449.10347-1-bernd.kuhls@t-online.de>
References: <20170403055449.10347-1-bernd.kuhls@t-online.de>
Message-ID: <20170403153039.7e74b53f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new iteration!

On Mon,  3 Apr 2017 07:54:49 +0200, Bernd Kuhls wrote:
> The utils provided by this package were formerly packaged with libva.
> Libva contained a patch not to compile mpeg2vldemo to reduce
> dependencies by avoiding C++, this patch is not moved to this package.

So, why is there no C++ dependency in libva-utils?

> +comment "libva-utils needs libva"
> +	depends on !BR2_PACKAGE_LIBVA

This comment is IMO useless. If you want libva-utils, surely you know
that libva should be enabled.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

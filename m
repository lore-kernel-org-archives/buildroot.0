From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Oct 2010 15:53:07 +0200
Subject: [Buildroot] [git commit master 1/1] package: add libmpeg2
In-Reply-To: <20101006103554.2176D8B7C6@busybox.osuosl.org>
References: <20101006103554.2176D8B7C6@busybox.osuosl.org>
Message-ID: <20101006155307.574dcfb9@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 6 Oct 2010 11:48:58 +0200
Peter Korsgaard <jacmet@sunsite.dk> wrote:

> +config BR2_PACKAGE_LIBMPEG2_BINS
> +       bool "mpeg2 binaries"
> +       depends on BR2_PACKAGE_LIBMPEG2
> +       help
> +         Install mpeg2dec, corrupt_mpeg2 and extrac_mpeg2 programs as
> +	 well.

Tiny typos here: extracT_mpeg2 and incorrect indentation.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

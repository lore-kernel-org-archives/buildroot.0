From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed, 11 Jan 2012 22:11:41 -0500
Subject: [Buildroot] [PATCH] tiff: add utility commands and library
	options
In-Reply-To: <87d3aq9msb.fsf@macbook.be.48ers.dk>
References: <1326084271-12749-1-git-send-email-fhunleth@troodon-software.com>
 <87d3aq9msb.fsf@macbook.be.48ers.dk>
Message-ID: <CA+-urNRp5r0-PJRqSiggBRpF3RqNJsRxZTJM9MV0V_dhruKSyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 11, 2012 at 12:22 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>
> >>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:
>
> ?Frank> +
> ?Frank> +config BR2_PACKAGE_TIFF_LARGE_FILE
> ?Frank> + ? ? ? ?bool "Large file support"
> ?Frank> + ? ? ? default y
>
> Need to indent with <tab>.

Fixed.

>
> How is this related to the global BR2_LARGEFILE setting? We already pass
> --disable-largefile for !BR2_LARGEFILE builds (see package/Makefile.in).

Cool. I hadn't noticed that --disable-largefile was getting passed
automatically. Removing the large file lines from the patch.

Thanks,
Frank

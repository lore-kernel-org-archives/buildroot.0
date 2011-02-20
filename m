From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sun, 20 Feb 2011 01:41:53 +0100
Subject: [Buildroot] Moving from 2.6.36.1 to 2.6.35.11 (or perhaps
	2.6.35.9)
In-Reply-To: <AANLkTikMqQa2b8VALCFzCvhzhLGokgjjeu5jwWgbspv1@mail.gmail.com>
References: <AANLkTikMqQa2b8VALCFzCvhzhLGokgjjeu5jwWgbspv1@mail.gmail.com>
Message-ID: <AANLkTi=EMuXuUUuN2UqLUHW3GLA-vbpC9mdmNEqkueyc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 20 February 2011 00:21, Charles Krinke <charles.krinke@gmail.com> wrote:
> My group desires to use the 2.6.35.11 kernel as it is listed as a longterm
> stable kernel instead of the 2.6.36.1 buildroot currently supports <sigh>.
>
> In looking at at buildroot, it appears that changine
> buildroot-2010.11/.config BR2_DEFAULT_KERNEL_HEADERS *and* linux/Config.in
> (3 places) would do it to change to an arbitrary kernel version.
>
> Is this the correct procedure to change these two files? I can make it work
> with 2.6.35.9, but it seems that kernel.org/pub/linux/kernel/v2.6/ contains
> up to 2.6.35.9 but not 2.6.35.10 or 2.6.35.11 so 2.6.35.9 works but
> 2.6.35.11 fails.

I don't think editing files is necessary: In 'make menuconfig' you can
change the kernel mirror, set custom kernel version string or set a
full kernel tarball URL.

Best regards,
Bj?rn Forsman

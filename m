From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 8 Nov 2016 09:38:36 -0600
Subject: [Buildroot] minnowboard_defconfig fails to build
In-Reply-To: <20161105145735.6a941b3a@free-electrons.com>
References: <20161105145735.6a941b3a@free-electrons.com>
Message-ID: <CAAEAJfCAzvs0rMWjTr7By=AQhy8vWkxF9eTrUxv0ST6wdCUU4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 5 November 2016 at 08:57, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Ezequiel,
>
> The minnowboard_defconfig fails to build (but minnowboard_max_defconfig
> is OK), due to the use of a Linux kernel version that is too old to
> build with gcc 5.x.
>
> Do you have access to the Minnowboard (not MAX) ? If so, would you be
> willing to look into this issue, and provide an updated defconfig ?
>

No, I only have a Minnowboard Turbot, MAX compatible.

AFAIK, the reason to use the old Linux kernel is to have some
platform-specific GPIO keys,
that wasn't upstreamed at the time (maybe it is now, or maybe we need to be able
to have the acpi manipulation thing, don't really remember).

Peter and I discussed about this board having an old kernel. I think
we should just
move to upstream, but he'd rather stick with the old and support all
the hardware.

Maybe now we have no choice but upstream?

> See the full build log at
> http://free-electrons.com/~thomas/pub/buildroot-defconfigs/minnowboard_defconfig.log.FAIL.
>


-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar

From: Erico Nunes <nunes.erico@gmail.com>
Date: Mon, 22 Aug 2016 16:52:36 +0200
Subject: [Buildroot] [PATCH 2/2] configs/pc_x86_64_efi_defconfig: enable
 kernel EFI support
In-Reply-To: <20160822164446.26484ffb@free-electrons.com>
References: <20160822015216.425-1-nunes.erico@gmail.com>
 <20160822015216.425-2-nunes.erico@gmail.com>
 <20160822163741.021a7577@free-electrons.com>
 <014f0b85214e71fdfe5a9fec8c683273@zacarias.com.ar>
 <20160822164446.26484ffb@free-electrons.com>
Message-ID: <CAK4VdL0pn=FF5LTa7ni2LYUN12nNpdAo1ovhHkanQfuafb9wdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Aug 22, 2016 at 4:44 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 22 Aug 2016 11:40:16 -0300, Gustavo Zacarias wrote:
>
>> Indeed, it won't hurt a bit, the main difference between the bios and
>> efi defconfigs is the bootloader strategy, so on the kernel side "just
>> give it the feature".
>
> Thanks for the feedback. Erico, could you adjust your patch accordingly?

Thanks for the review.
I was in doubt about that too and decided to go with separate at
first, but no problem with me about adding it in linux-extras.config.
I'll change it and re-submit.

Erico

From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sun, 26 Oct 2014 22:16:33 +0100
Subject: [Buildroot] [PATCH 1/2] kconfig/lxdialog: get ncurses CFLAGS
	with pkg-config
In-Reply-To: <CAEYzJUGaae4Uqj_v9fWbi4kfygoSLGAku_P8=AedfDV04gCCxA@mail.gmail.com>
References: <1414329446-16587-1-git-send-email-bjorn.forsman@gmail.com>
 <1414329446-16587-2-git-send-email-bjorn.forsman@gmail.com>
 <20141026164155.4c1bc8db@free-electrons.com>
 <CAEYzJUGaae4Uqj_v9fWbi4kfygoSLGAku_P8=AedfDV04gCCxA@mail.gmail.com>
Message-ID: <CAEYzJUEV=Z5yb6+DS_vZ9NuOjtsTfX0KGU5jYFa8wjMRt=v8dw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 26 October 2014 17:06, Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:
> On 26 October 2014 16:41, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> [...]
>> Hum, whenever we do change in the kconfig code, we like them to be part
>> of the patch series we have. See support/kconfig/README.buildroot for
>> details. In this case, indeed, the fix is already upstream. But still,
>> we would like to keep separated the base kconfig version (copied
>> as-is from the kernel) from any further modification we have made.
>>
>> Thanks!
>
> Ok. I understand. I'll try to do the re-sync as described in
> support/kconfig/README.buildroot then.

I've tried to re-sync with linux 3.18-rc1. Without luck. Quite
frustrating. Something is changed upstream and I don't (yet) manage to
fill in the missing bits of Make code to have Buildroot's "make
menuconfig" work with these changes.

Would it be acceptable to add the patch posted in this thread directly
to support/kconfig/patches/ instead?

Best regards,
Bj?rn Forsman

From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 13 Aug 2016 21:41:24 +0900
Subject: [Buildroot] [PATCH 1/2] zynq: enable
	BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
In-Reply-To: <20160810145836.38fc9c79@free-electrons.com>
References: <1469943791-4805-1-git-send-email-yamada.masahiro@socionext.com>
 <1469943791-4805-2-git-send-email-yamada.masahiro@socionext.com>
 <CANQCQpZwHuC+dxR=nfDbJt-=-q_eAyq8-Nkyuz0-_dw9Nb2=pg@mail.gmail.com>
 <CAK7LNASOxdp=pXoZREUA-vnqJR1bJsbgDJpd0Np-JoN2aUGycg@mail.gmail.com>
 <20160810145836.38fc9c79@free-electrons.com>
Message-ID: <CAK7LNATHApQ4xe55WjdRskDROHay7sy7-mbY9WPX6LRzTNEPhg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2016-08-10 21:58 GMT+09:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Wed, 10 Aug 2016 21:31:16 +0900, Masahiro Yamada wrote:
>
>> Setting aside 2/2,
>> 1/2 (this one) is apparently a bug fix and Matt reviewed it,
>> so isn't it ready for v2016.08 ?
>
> I don't understand why 1/2 is a bug fix. Could you clarify?
>

"make uboot-menuconfig" does not work,
where it should work.



-- 
Best Regards
Masahiro Yamada

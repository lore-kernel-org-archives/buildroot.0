From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 18 Oct 2014 18:54:37 +0200
Subject: [Buildroot] [PATCH 2/5] busybox: Install scripts only when
	needed
In-Reply-To: <20141018185305.312f75b2@free-electrons.com>
References: <1413643624-14757-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1413643624-14757-3-git-send-email-maxime.hadjinlian@gmail.com>
 <20141018185305.312f75b2@free-electrons.com>
Message-ID: <CAGduivz6peNjgWajrUjAMjsE4f5ufUdMFX696fYYF8r5HHbxaw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all
On Sat, Oct 18, 2014 at 6:53 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Maxime Hadjinlian,
>
> On Sat, 18 Oct 2014 16:47:01 +0200, Maxime Hadjinlian wrote:
>
>> +ifeq ($(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX), y)
>
>         , y
>
> should be
>
>         ,y
>
> i.e, with no space.
>
>> +ifeq ($(BR2_PACKAGE_BUSYBOX_WATCHDOG),y)
>> +ifeq ($(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX), y)
>
> Ditto.
Ah yes, I thought I had fixed that everywhere. Thanks !
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

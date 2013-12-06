From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 6 Dec 2013 10:21:53 +0100
Subject: [Buildroot] [PATCH v6 3/3] ModemManager: add new package
In-Reply-To: <20131206101027.52c490a8@skate>
References: <1386150904-16813-1-git-send-email-yegorslists@googlemail.com>
 <1386150904-16813-3-git-send-email-yegorslists@googlemail.com>
 <20131206101027.52c490a8@skate>
Message-ID: <CAGm1_ku+G7wUG+Rvk4_N+j4AbafP_-wk=EnHPspSiOM7yAvtoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 6, 2013 at 10:10 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Yegor,
>
> On Wed,  4 Dec 2013 10:55:04 +0100, yegorslists at googlemail.com wrote:
>
>> +MODEM_MANAGER_VERSION = 1.0.0
>> +MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
>> +MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager/
>> +MODEM_MANAGER_LICENSE = GPLv2
>
> This should be:
>
> MODEM_MANAGER_LICENSE = GPLv2+ (programs, plugins), LGPLv2+ (libmm-glib)
>
> For those looking: there are two other libraries, libqcdm and libwmc,
> under GPLv2+, but those libraries are not installed: they are directly
> linked into the application, and just used as a way of splitting things
> in the source code.
>
> With the license information fixed, which hopefully Peter can adjust,
> this patch has my:
>
> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks for review. This licence stuff seems to be tricky sometimes.

Yegor

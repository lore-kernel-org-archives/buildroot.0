From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 18 Nov 2014 22:00:02 +0000 (UTC)
Subject: [Buildroot] Unable to boot Arm926t with big endian support
References: <B28B6A721CC23347BBD5566C377D30416461F1CA@se-got-mb01.semcon.se>
 <20141118133630.650c534a@free-electrons.com>
 <loom.20141118T141649-194@post.gmane.org>
Message-ID: <m4gfh2$ovo$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-11-18, Peder Alm <peder.alm@semcon.com> wrote:
> Dear Thomas
>
>> Thanks for the report. On which platform are you testing this? I do
>> have some ARMv7 platforms to test BE on, but not ARMv5.

> I'm using the Olimex board SAM9-L9260 and XUbuntu 14.04 on my PC.

AFAIK, the AT91 family only work in little-endian mode.  The CPU core
can be switched, but the rest of the part is designed specifically for
little-endian mode, and many/some of the peripherals are not going to
work right.  At least that's what the Atmel FAE told me when I
asked....

-- 
Grant Edwards               grant.b.edwards        Yow! I feel like I am
                                  at               sharing a ``CORN-DOG''
                              gmail.com            with NIKITA KHRUSCHEV ...

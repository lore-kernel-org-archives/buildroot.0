From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 6 Mar 2015 20:49:33 +0100
Subject: [Buildroot] [PATCH 2/2] modem-manager: bump to version 1.4.4
In-Reply-To: <CANPyyuMg99KM4EbFwiF_Tpu=u+4+BoVu79_D3xXg2emUk78peA@mail.gmail.com>
References: <1425617186-14203-1-git-send-email-petr.vorel@gmail.com>
 <1425617186-14203-2-git-send-email-petr.vorel@gmail.com>
 <CANPyyuMg99KM4EbFwiF_Tpu=u+4+BoVu79_D3xXg2emUk78peA@mail.gmail.com>
Message-ID: <CAGm1_ktO3PKWys6k7CZUnGNAoaYRes=Zm7OaEvViGXdX0ZmbWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 6, 2015 at 6:35 PM, Mike Williams <mike@mikebwilliams.com> wrote:
> This needs my patch to bump libqmi to 1.2.6 applied first, but otherwise:
>
> Tested-by: Mike Williams <mike@mikebwilliams.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

And as mentioned earlier add an updated hash file.

> On Thu, Mar 5, 2015 at 11:46 PM, Petr Vorel <petr.vorel@gmail.com> wrote:
>> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
>> ---
>>  package/modem-manager/modem-manager.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
>> index 349517d..a6e1b36 100644
>> --- a/package/modem-manager/modem-manager.mk
>> +++ b/package/modem-manager/modem-manager.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>
>> -MODEM_MANAGER_VERSION = 1.4.2
>> +MODEM_MANAGER_VERSION = 1.4.4
>>  MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
>>  MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
>>  MODEM_MANAGER_LICENSE = GPLv2+ (programs, plugins), LGPLv2+ (libmm-glib)
>> --
>> 2.1.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 6 Mar 2015 12:20:34 -0500
Subject: [Buildroot] [PATCH] libqmi: bump to 1.12.4
In-Reply-To: <CAGm1_kvJ6b84B9wrhWNe=ko4nCrejePQ8qZijs6pC5mNqWgAzQ@mail.gmail.com>
References: <1425655766-347-1-git-send-email-mike@mikebwilliams.com>
 <CAGm1_kvJ6b84B9wrhWNe=ko4nCrejePQ8qZijs6pC5mNqWgAzQ@mail.gmail.com>
Message-ID: <CANPyyuP6CKvu4=neAob+PFz7m6=_Fa-Sdj-361qFizmeiN5S4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good catch, new patch incoming.

On Fri, Mar 6, 2015 at 10:33 AM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Fri, Mar 6, 2015 at 4:29 PM, Mike Williams <mike@mikebwilliams.com> wrote:
>> ModemManager 1.4.4 requires libqmi >= 1.12.4.
>>
>> Signed-off-by: Mike Williams <mike@mikebwilliams.com>
>> ---
>>  package/libqmi/libqmi.hash | 2 +-
>>  package/libqmi/libqmi.mk   | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
>> index f5f2578..d4f1b6b 100644
>> --- a/package/libqmi/libqmi.hash
>> +++ b/package/libqmi/libqmi.hash
>> @@ -1,2 +1,2 @@
>>  # Locally computed:
>> -sha256  d1661d73b510482b29b93b7e396756c433d35360b3d44c72afa7921339a98624  libqmi-1.12.2.tar.xz
>> +sha256  65a2819e2259c2a77d3e8d91c1cc47d28c332d0aac68fbc5f1918922840fc774  libqmi-1.12.4.tar.xz
>> diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
>> index 9e5f9cb..3c1d7aa 100644
>> --- a/package/libqmi/libqmi.mk
>> +++ b/package/libqmi/libqmi.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>
>> -LIBQMI_VERSION = 1.12.2
>> +LIBQMI_VERSION = 1.12.4
>
> Why not the latest? 1.12.6?
>
> http://www.freedesktop.org/software/libqmi/
>
>>  LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
>>  LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
>>  LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
>> --
>> 2.1.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot

From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 6 Jul 2016 09:47:02 -0400
Subject: [Buildroot] [PATCH v6 1/6] audit: bump to version 2.6
In-Reply-To: <20160705171615.GJ6533@free.fr>
References: <1466980753-667-1-git-send-email-Aduskett@gmail.com>
 <1466980753-667-2-git-send-email-Aduskett@gmail.com>
 <20160705171615.GJ6533@free.fr>
Message-ID: <CAFSsvmp7sABianSmyfWOUv+P3-Y+ZOFVqf5cctU8Acs_zUz+kQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey! Sorry about not getting back to you sooner; I will look into this
right away!

On Tue, Jul 5, 2016 at 1:16 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Adam, All,
>
> On 2016-06-26 18:39 -0400, Adam Duskett spake thusly:
>> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
>> ---
> [--SNIP--]
>> diff --git a/package/audit/audit.mk b/package/audit/audit.mk
>> index 1fbc623..937244d 100644
>> --- a/package/audit/audit.mk
>> +++ b/package/audit/audit.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>
>> -AUDIT_VERSION = 2.4.4
>> +AUDIT_VERSION = 2.6
>
> This is causing a bunch of autobuilder failures:
>     http://autobuild.buildroot.org/?reason=audit-2.6.2
>
> Care to have a look at it, please?
>
> Regards,
> Yann E. MORIN.
>
>>  AUDIT_SITE = http://people.redhat.com/sgrubb/audit
>>  AUDIT_LICENSE = GPLv2
>>  AUDIT_LICENSE_FILES = COPYING
>> --
>> 2.7.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

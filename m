From: universe II <universeii@gmx.de>
Date: Mon, 24 Aug 2015 18:25:40 +0200
Subject: [Buildroot] Add missing config to RPM target package
In-Reply-To: <55D72A86.1050505@imgtec.com>
References: <55D70AF3.3050604@gmx.de> <55D72A86.1050505@imgtec.com>
Message-ID: <55DB4584.1000102@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 21.08.2015 um 15:41 schrieb Vicente Olivert Riera:
> Dear Andreas,
>
>> diff -Naur a/package/rpm/rpm.mk b/package/rpm/rpm.mk
>> --- a/package/rpm/rpm.mk        2015-08-07 11:38:37.559148663 +0200
>> +++ b/package/rpm/rpm.mk        2015-08-21 11:13:31.679042077 +0200
>> @@ -34,7 +34,7 @@
>>   RPM_DEPENDENCIES += pcre
>>   RPM_CONF_OPTS += --with-pcre=external
>>   else
>> -RPM_CONF_OPTS += --with-pcre=none
>> +RPM_CONF_OPTS += --with-pcre=internal
>>   endif
>>
>>   ifeq ($(BR2_PACKAGE_FILE),y)
> I cannot apply your patch:
>
> $ wget http://patchwork.ozlabs.org/patch/509471/mbox/ -q -O - | git am
> Applying: Add missing config to RPM target package
> error: patch failed: package/rpm/rpm.mk:34
> error: package/rpm/rpm.mk: patch does not apply
> Patch failed at 0001 Add missing config to RPM target package
> When you have resolved this problem run "git am --resolved".
> If you would prefer to skip this patch, instead run "git am --skip".
> To restore the original branch and stop patching run "git am --abort".
>
> Please make your patches using git, as stated in the Buildroot manual:
>
> http://buildroot.uclibc.org/downloads/manual/manual.html#submitting-patches
>
> Regards,
>
> Vincent.
Dear Vincent,
I tried to make my patch using git according to the manual, but I always 
got an error. Maybe related to my inexperience with git. After 4 hours 
of different tries I gave up and sent the patch via email. Sorry for the 
inconvenience.

Regards,
Andreas

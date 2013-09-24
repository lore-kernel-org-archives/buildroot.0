From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Tue, 24 Sep 2013 17:58:18 +0200
Subject: [Buildroot] [PATCH v2 2/2] Align =
In-Reply-To: <20130924172203.75d10f2d@skate>
References: <1380011709-20253-1-git-send-email-thierry.bultel@wanadoo.fr>
 <1380011709-20253-3-git-send-email-thierry.bultel@wanadoo.fr>
 <20130924172203.75d10f2d@skate>
Message-ID: <5241B69A.6030808@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
fixed and re-sent
best regards
Thierry

Le 24/09/2013 17:22, Thomas Petazzoni a ?crit :
> Dear Thierry Bultel,
>
> On Tue, 24 Sep 2013 10:35:09 +0200, Thierry Bultel wrote:
>> ---
>>   package/lesstif/lesstif.mk |    4 ++--
>>   1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/lesstif/lesstif.mk b/package/lesstif/lesstif.mk
>> index 4c0ef4c..e912554 100644
>> --- a/package/lesstif/lesstif.mk
>> +++ b/package/lesstif/lesstif.mk
>> @@ -4,8 +4,8 @@
>>   #
>>   ################################################################################
>>   LESSTIF_VERSION = 0.95.2
>> -LESSTIF_SOURCE = lesstif-$(LESSTIF_VERSION).tar.bz2
>> -LESSTIF_SITE =  http://downloads.sourceforge.net/project/lesstif/lesstif/$(LESSTIF_VERSION)
>> +LESSTIF_SOURCE  = lesstif-$(LESSTIF_VERSION).tar.bz2
>> +LESSTIF_SITE    = http://downloads.sourceforge.net/project/lesstif/lesstif/$(LESSTIF_VERSION)
>>   LESSTIF_INSTALL_STAGING = YES
>>   LESSTIF_DEPENDENCIES = \
>>   	xlib_libXt \
>
> This should be part of the previous patch. See how to use "git rebase
> -i" to reorganize your Git patches.
>
> Best regards,
>
> Thomas
>

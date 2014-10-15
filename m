From: =?UTF-8?B?SsO2cmcgS3JhdXNl?= <jkrause@posteo.de>
Date: Wed, 15 Oct 2014 11:15:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnfs: bump to version 1.9.5
In-Reply-To: <543E2EC6.1000205@trzebnica.net>
References: <1413357933-10973-1-git-send-email-jkrause@posteo.de>
 <543E2EC6.1000205@trzebnica.net>
Message-ID: <543E3B42.7030309@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerzy,

On 10/15/2014 10:22 AM, Jerzy Grzegorek wrote:
> Hi J?rg,
>
>> * bump to version 1.9.5
>> * fix version and site symbol
>>
>> Signed-off-by: J?rg Krause <jkrause@posteo.de>
>> ---
>>   package/libnfs/libnfs.mk | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
>> index a17d8c3..f2d7938 100644
>> --- a/package/libnfs/libnfs.mk
>> +++ b/package/libnfs/libnfs.mk
>> @@ -4,8 +4,8 @@
>>   #
>> ################################################################################
>>   -LIBNFS_VERSION = libnfs-1.8.0
>> -LIBNFS_SITE = $(call github,sahlberg,libnfs,$(LIBNFS_VERSION))
>> +LIBNFS_VERSION = 1.9.5
>> +LIBNFS_SITE = $(call github,sahlberg,libnfs,libnfs-$(LIBNFS_VERSION))
>
> Since the tag of libnfs version 1.9.5 is libnfs-1.9.5
> so this should be:
>
> +LIBNFS_VERSION = libnfs-1.9.5
> +LIBNFS_SITE = $(call github,sahlberg,libnfs,$(LIBNFS_VERSION))
>

You're right, the tag is libnfs-1.9.5. I didn't liked that libnfs was 
build in libnfs-libnfs-1.9.5 (now it builds in libnfs-1.9.5). But I've 
seen in the manual that version should be a tag or a commit. I will fix 
this.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141015/d16c4fda/attachment.html>

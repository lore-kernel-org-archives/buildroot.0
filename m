From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 23 Sep 2015 14:59:30 +0100
Subject: [Buildroot] [PATCH] genimage: bump to version 8
In-Reply-To: <5602AF69.8080909@imgtec.com>
References: <1443015293-16426-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <5602AF69.8080909@imgtec.com>
Message-ID: <5602B042.4000609@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vivien Didelot,

On 09/23/2015 02:55 PM, Vicente Olivert Riera wrote:
> Dear Vivien Didelot,
> 
> thanks a lot for your contribution.
> 
> When you bump a version, you also need to provide a new hash for the new
> tarball. Please modify package/genimage/genimage.hash accordingly and
> send a v2 of your patch. Also, don't forget to mark this one as
> deprecated in Patchwork.

s/deprecated/supersesded

Sorry, I'm not having a good day.

Regards,

Vincent.

> 
> Regards,
> 
> Vincent.
> 
> On 09/23/2015 02:34 PM, Vivien Didelot wrote:
>> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
>> ---
>>  package/genimage/genimage.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
>> index 07d95a4..2dffbc5 100644
>> --- a/package/genimage/genimage.mk
>> +++ b/package/genimage/genimage.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>  
>> -GENIMAGE_VERSION = 7
>> +GENIMAGE_VERSION = 8
>>  GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
>>  GENIMAGE_SITE = http://www.pengutronix.de/software/genimage/download
>>  GENIMAGE_DEPENDENCIES = host-pkgconf libconfuse
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

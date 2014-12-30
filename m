From: =?windows-1252?Q?Andr=E9_Hentschel?= <nerv@dawncrow.de>
Date: Tue, 30 Dec 2014 20:39:32 +0100
Subject: [Buildroot] [PATCH 1/2] lcms2: Install into staging
In-Reply-To: <20141230051606.GD16594@tarshish>
References: <1419905244-7418-1-git-send-email-nerv@dawncrow.de>
 <20141230051606.GD16594@tarshish>
Message-ID: <54A2FF74.1040501@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 30.12.2014 um 06:16 schrieb Baruch Siach:
> Hi Andr?,
> 
> On Tue, Dec 30, 2014 at 03:07:23AM +0100, Andr? Hentschel wrote:
>> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
>> ---
>>  package/lcms2/lcms2.mk | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
>> index 5d22041..c2eda98 100644
>> --- a/package/lcms2/lcms2.mk
>> +++ b/package/lcms2/lcms2.mk
>> @@ -6,6 +6,7 @@
>>  
>>  LCMS2_VERSION = 2.5
>>  LCMS2_SITE = http://downloads.sourceforge.net/lcms/lcms
>> +LCMS2_INSTALL_STAGING = YES
> 
> Please explain in the commit log why you need this. The same goes for the next 
> patch in this series (sane-backends).
> 
> baruch
> 

Hi Baruch,

I'm about to resend the patches and i hope to do it right.

But first i'd like to introduce myself quickly:
I'm a OSS developer from Germany, please find my openhub page here: https://www.openhub.net/accounts/Andre_H
Buildroot is great for testing software on different archictectures without finding a distro or something.
I'll try to get a Wine package upstream, i hope this work is welcome.

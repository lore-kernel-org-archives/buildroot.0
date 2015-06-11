From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 11 Jun 2015 22:45:25 +0200
Subject: [Buildroot] [PATCH v3 1/3] atf: new package
In-Reply-To: <5579F272.4070109@savoirfairelinux.com>
References: <1433717727-30214-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>	<1433717727-30214-2-git-send-email-sebastien.bourdelin@savoirfairelinux.com>	<20150611223430.47b7fb18@free-electrons.com>
 <5579F272.4070109@savoirfairelinux.com>
Message-ID: <5579F365.5030206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/11/15 22:41, Sebastien Bourdelin wrote:
> Hi Thomas.
> 
> I do not know a lot about licenses, so it will be a lucky mistake if
> it's correct otherwise i can add the BSD-2c if you think it's required.

 BSD-2c, BSD-3c is exactly what I suggested in my review of v1... But that was
probably not clear enough.

 Regards,
 Arnout

> 
> Thanks.
> 
> On 06/11/2015 04:34 PM, Thomas Petazzoni wrote:
>> Dear Sebastien Bourdelin,
>>
>> On Sun,  7 Jun 2015 18:55:25 -0400, Sebastien Bourdelin wrote:
>>
>>> +ATF_VERSION = 0.21
>>> +ATF_SITE = https://github.com/jmmv/atf/releases/download/atf-$(ATF_VERSION)
>>> +ATF_INSTALL_STAGING = YES
>>> +ATF_LICENSE = BSD-3c
>> The COPYING file actually has both BSD-2c and BSD-3c. Maybe specifying
>> only BSD-3c is OK since it's the same as BSD-2c + an additional
>> restriction. But I was just wondering what lead to mentioning only
>> BSD-3c.
>>
>> Thanks,
>>
>> Thomas
> 
> 
>  
>  
> ************************************************************************************
> This footnote confirms that this email message has been scanned by
> PineApp Mail-SeCure for the presence of malicious code, vandals & computer viruses.
> ************************************************************************************
> 
> 
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

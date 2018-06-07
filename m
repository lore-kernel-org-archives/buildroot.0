From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Jun 2018 20:55:55 +0200
Subject: [Buildroot] [PATCH] libbsd: bump to version 0.9.1
In-Reply-To: <20180606075802.3f397dd9@windsurf>
References: <f54e614d6b4a1de2ab39e843ed6266828faecd15.1528222775.git.baruch@tkos.co.il>
 <20180605221634.3a53fa0b@windsurf>
 <20180606040131.drvicwte22lzicad@sapphire.tkos.co.il>
 <20180606075802.3f397dd9@windsurf>
Message-ID: <2af4dc0e-7f6f-1e09-6ce7-07066a12572f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-06-18 07:58, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 6 Jun 2018 07:01:31 +0300, Baruch Siach wrote:
> 
>>> because the license text itself refers to Peter Wemm.  
>>
>> The libbsd COPYING fine appends the copyright holder to a number of common 
>> licenses like BSD-3-clause-John-Birrell and BSD-4-clause-Niels-Provos. That's 
>> probably because each COPYING entry lists specific files with their copyright 
>> holders.
> 
> Correct.
> 
>> We usually only use the SPDX identifier string. So I don't think 
>> there is a reason to do that for this license.
> 
> Well, normally an SPDX identifier string refers to a specific version
> of the license. If the license text is different (even for subtle
> reasons), the SPDX identifier string should probably be different.
 Indeed, but at the moment we don't follow that rule at all. Our license tags
are really just a hint, they're still a long way off from a full SPDX spec.

 Regards,
 Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

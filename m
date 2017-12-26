From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 26 Dec 2017 14:20:39 +0100
Subject: [Buildroot] [PATCH v2] package/mfgtools: bump to 0.02
In-Reply-To: <20171226115845.3na3tjdmhqisgdae@t450s.lan>
References: <20171225143635.12778-1-romain.naour@gmail.com>
 <20171226114405.dhdenhezgnf6mjvx@t450s.lan>
 <20171226115845.3na3tjdmhqisgdae@t450s.lan>
Message-ID: <b895035b-c942-dbfd-e805-0061a01e2128@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

Le 26/12/2017 ? 12:58, Gary Bisson a ?crit?:
> Hi Romain,
> 
> On Tue, Dec 26, 2017 at 12:44:05PM +0100, Gary Bisson wrote:
>> Hi Romain,
>>
>> On Mon, Dec 25, 2017 at 03:36:35PM +0100, Romain Naour wrote:
>>> Bump mfgtools to include the fix [1] for the C++ build issue reported
>>> by the autobuilders.
>>>
>>> This bump include only 4 small commit fixing memory leak and this
>>> build issue.
>>>
>>> Remove CPOL.htm (removed upstream) from MFGTOOLS_LICENSE_FILES but CPOL
>>> license is still valid.
>>> Add the README.txt file to MFGTOOLS_LICENSE_FILES since it contains
>>> licensing informations:
>>>
>>> Licenses:
>>> - CPOL: MfgToolLib/XmlLite.CPP and XmlLite.h
>>> - BSD: Others.
>>>
>>> Add license file hash.
>>>
>>> [1] https://github.com/codeauroraforum/mfgtools/commit/b370a43e548440025d274ff2abbb25342bbaa78c
>>>
>>> Fixes:
>>> http://autobuild.buildroot.net/results/7c2bbbe13ab315684f3502afd96958a76879b1d5
>>>
>>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>>> Cc: Gary Bisson <gary.bisson@boundarydevices.com>
>>> ---
>>> This patch should be backported to stable branches 2017.02 and 2017.08.
>>>
>>> v2: update url (Baruch)
>>>     add README.txt to MFGTOOLS_LICENSE_FILES (Baruch)
>>
>> Thanks for taking care of it.
>> Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
>>
>> Note that all the NXPMicro repositories have moved to CodeAurora (to be
>> Qualcomm-friendly) and that other projects using old URL will be
>> updated in my next update series (within the next couple of weeks).
> 
> Actually I just realized that NXPMicro repository is mentioned in the
> Config.in.host, maybe this should be updated as well to point to the
> proper URL. Not blocking IMO but I'd rather mention it now.

Thanks, I just send an updated version.

Best regards,
Romain

> 
> Regards,
> Gary
> 

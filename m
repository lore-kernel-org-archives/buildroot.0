From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 26 Dec 2017 18:14:14 +0100
Subject: [Buildroot] [PATCH v3] package/mfgtools: bump to 0.02
In-Reply-To: <87fu7xwig1.fsf@dell.be.48ers.dk>
References: <20171226131921.8312-1-romain.naour@gmail.com>
 <87fu7xwig1.fsf@dell.be.48ers.dk>
Message-ID: <c865db51-bff1-af62-7a9c-b584504b0e46@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le 26/12/2017 ? 17:41, Peter Korsgaard a ?crit?:
>>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:
> 
>  > Bump mfgtools to include the fix [1] for the C++ build issue reported
>  > by the autobuilders.
> 
>  > This bump include only 4 small commit fixing memory leak and this
>  > build issue.
> 
>  > Remove CPOL.htm (removed upstream) from MFGTOOLS_LICENSE_FILES but CPOL
>  > license is still valid.
>  > Add the README.txt file to MFGTOOLS_LICENSE_FILES since it contains
>  > licensing informations:
> 
>  > Licenses:
>  > - CPOL: MfgToolLib/XmlLite.CPP and XmlLite.h
>  > - BSD: Others.
> 
>  > Add license file hash.
> 
>  > [1] https://github.com/codeauroraforum/mfgtools/commit/b370a43e548440025d274ff2abbb25342bbaa78c
> 
>  > Fixes:
>  > http://autobuild.buildroot.net/results/7c2bbbe13ab315684f3502afd96958a76879b1d5
> 
>  > Signed-off-by: Romain Naour <romain.naour@gmail.com>
>  > Cc: Gary Bisson <gary.bisson@boundarydevices.com>
> 
> Committed, thanks.
> 
>> ---
>  > This patch should be backported to stable branches 2017.02 and 2017.08.
> 
> 2017.08? I guess you mean 2017.11? I'll take care of that when I sync
> 2017.02.x / 2017.11.x with master, thanks.

Yes 2017.11 sorry.
This patch needs to be backported to stable branches that are still maintained :)

Best regards,
Romain

> 

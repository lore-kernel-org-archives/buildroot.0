From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 3 Sep 2019 12:13:19 +0200
Subject: [Buildroot] [PATCH] package/libnss: security bump to version
 3.46
In-Reply-To: <87mufm4wlf.fsf@dell.be.48ers.dk>
References: <20190831204033.93610-1-giulio.benetti@micronovasrl.com>
 <36a5f792-cb9d-0873-6efb-76a36e2267d6@micronovasrl.com>
 <87ef10brmq.fsf@tarshish>
 <2588ad91-fdc1-7634-f1d8-253e1cd58ba6@micronovasrl.com>
 <87mufm4wlf.fsf@dell.be.48ers.dk>
Message-ID: <1e31d088-4f42-48df-a31a-11bb1f5fa035@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 02/09/2019 16:11, Peter Korsgaard ha scritto:
>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:
> 
>   > Hi Baruch,
>   > Il 01/09/2019 05:51, Baruch Siach ha scritto:
>   >> Hi Giulio,
>   >>
>   >> On Sat, Aug 31 2019, Giulio Benetti wrote:
>   >>> Subject should be: "package/libnss: bump to version 3.46" without
>   >>> 'security'.
>   >>
>   >> This bump fixes CVE-2019-11727 and CVE-2019-11719. The commit log should
>   >> mention that though.
> 
>   > Sorry for my ignorance, where can I find the list of all CVE fixed by
>   > nss? I've tried to check all around but can't find it.
> 
>  From the release notes:
> 
> CVE-2019-11719 and CVE-2019-11727 were fixed in 3.45:
> 
> https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.45_release_notes
> 

Thank you, just sent v2 with reworded commit log and a previous patch 
for bumping nspr version.

Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

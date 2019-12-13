From: Jan Kiszka <jan.kiszka@siemens.com>
Date: Fri, 13 Dec 2019 07:24:31 +0100
Subject: [Buildroot] [PATCH 1/4] package/xenomai: Smokey's not a skin
In-Reply-To: <20191212214820.1c84b011@windsurf>
References: <cover.1576176280.git.jan.kiszka@siemens.com>
 <f23ad7759ce2abdebafcf0464cf15145e163285b.1576176280.git.jan.kiszka@siemens.com>
 <20191212214820.1c84b011@windsurf>
Message-ID: <2a94d986-e9d9-d87b-0e12-4f61da232a84@siemens.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12.12.19 21:48, Thomas Petazzoni wrote:
> On Thu, 12 Dec 2019 19:44:37 +0100
> Jan Kiszka <jan.kiszka@siemens.com> wrote:
> 
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> That's a testsuite tool.
>>
>> Rename XENOMAI_REMOVE_SKIN_LIST at this chance as it's cleaning
>> libraries.
> 
> I am confused, aren't psos, rtai, uitron, vxworks and al. called
> "skins" in the Xenomai speak ?

Yes, they are and remain so.

> 
> Ideally, this variable rename should be done in a separate patch, since
> it's independent from the smokey option removal.

We still use XENOMAI_REMOVE_LIBS_LIST to remove the smokey *lib* when
the testsuite is disabled. Therefore, XENOMAI_REMOVE_SKIN_LIST ws not an
appropriate name. Same context, therefore same patch.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

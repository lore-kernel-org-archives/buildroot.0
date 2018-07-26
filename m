From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Thu, 26 Jul 2018 13:13:36 +0200
Subject: [Buildroot] [PATCH 2/2] package/lvm2: Fix runtime crash when
 using uclibc
In-Reply-To: <b332421e-78bc-d9fb-922e-4ac08a39692a@grinn-global.com>
References: <20180725123703.12826-1-m.niestroj@grinn-global.com>
 <20180725123703.12826-2-m.niestroj@grinn-global.com>
 <20180725180911.5952264a@windsurf>
 <5414fc7d-7041-f854-db5c-3b742f060daa@grinn-global.com>
 <20180725182536.0c1ee5ef@windsurf>
 <b332421e-78bc-d9fb-922e-4ac08a39692a@grinn-global.com>
Message-ID: <a1a068d8-514c-d454-18b4-6d897b8f4db5@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 25.07.2018 18:37, Marcin Niestroj wrote:
> Hi,
> 
> On 25.07.2018 18:25, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Wed, 25 Jul 2018 18:18:46 +0200, Marcin Niestroj wrote:
>>
>>>> Is this needed only with the lvm2 bump to 2.02.180 ? Or is it needed
>>>> even with the current version of lvm2 we have packaged in Buildroot ?
>>>
>>> This is also needed for older version (currently packaged in Buildroot).
>>
>> Then it should be PATCH 1/2 in your series, to make it clear that it is
>> needed today with the current version of lvm2 we have.
> 
> Ok, I will check if this patch applies cleanly for older version
> as well, then make it PATCH 1/2.
> 

Patch does not apply cleanly on 2.02.173 (current Buildroot). However it
is easy to adjust patch for that version. Do you still want to make it
PATCH 1/2 and then adjust it in PATCH 2/2 "package/lvm2: bump to
version 2.02.180" ?

Regards,
Marcin

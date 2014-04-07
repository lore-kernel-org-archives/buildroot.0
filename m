From: Lionel Orry <lionel.orry@gmail.com>
Date: Mon, 7 Apr 2014 17:07:21 +0200
Subject: [Buildroot] [PATCH 1/1] zeromq: bump to version 4.0.1
In-Reply-To: <CAAXf6LVOm34-2gHVMbiEp85otVQa7PVuzqsFbNCGOB0upKAAQA@mail.gmail.com>
References: <1381509097-5424-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <20140301232520.4ee4b22b@skate>
 <CAKAx1cj3DKFEcSjtw2-d1y3sZSO9y6kpvE6ZGjRdycnNAAugMw@mail.gmail.com>
 <20140303084702.7790637d@skate>
 <CAKAx1chY=kd3Y_N2-HRqmtELox8gSA9+hVUmaEAT4BNv_mXb9g@mail.gmail.com>
 <20140303111124.1126480c@skate>
 <CAAXf6LVOm34-2gHVMbiEp85otVQa7PVuzqsFbNCGOB0upKAAQA@mail.gmail.com>
Message-ID: <CAKAx1chU0LVSgEF_vCYhOdEmJKt95wc27sNgPZa+u36yUbCT2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Apr 7, 2014 at 4:32 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Jerzy, Lionel,
>
> On Mon, Mar 3, 2014 at 11:11 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Lionel Orry,
>>
>> On Mon, 3 Mar 2014 09:14:44 +0100, Lionel Orry wrote:
>>
>>> > What do you mean by "such a patch" ? Maybe you forgot to attach a patch
>>> > to your e-mail?
>>>
>>> um no, I meant the "appropriate patch" you were suggesting Jerzy to
>>> prepare so that mongrel2 compiles. If I understood correctly.
>>
>> Ah ok.
>>
>>> > Does ZeroMQ v4 changes the API/behavior a lot compared to v3 ?
>>>
>>> The v2 -> v3 transistion has been a nightmare more many devs, but they
>>> learnt from it and it seems the v3->v4 is much smoother.
>>>
>>> By the way, I noticed the mongrel2 devs tagged a v1.9.0 a month ago,
>>> and this release includes a zeromq4 compliance, plus other fixes and
>>> enhancements. May I suggest we simply bump the mongrel2 version ?
>>
>> Indeed, seems like the best solution.
>>
>> Jerzy, can you have a look into this?
>
> Any of you interested in reviving this patch, bumping mongrel2 at the same time?

As soon as I have time, I'll prepare a patch for mongrel2 bump
version, which should solve quite everything on the subject. Don't
hesitate to ping me if I am taking too much time :)


>
> Thanks,
> Thomas

Cheers,
Lionel

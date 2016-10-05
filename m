From: Jean-Michel Hautbois <jean-michel.hautbois@veo-labs.com>
Date: Wed, 5 Oct 2016 10:30:12 +0200
Subject: [Buildroot] Xenomai 3.x
In-Reply-To: <20161005095532.683204d0@free-electrons.com>
References: <CAH-u=80UriOruAmAcS0uiJfXzEXTB6LeM+OwV9=vB0D7+e3xgw@mail.gmail.com>
 <20161005095532.683204d0@free-electrons.com>
Message-ID: <CAH-u=818PtBnsOqsUtSvUwACE9S-oxBsR0q+W3oQb7NRLwG2xg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2016-10-05 9:55 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Wed, 5 Oct 2016 09:07:28 +0200, Jean-Michel Hautbois wrote:
>
>> I am trying to get a working Xenomai 3.x package with buildroot.
>> My main objective is to have it running with Mercury (ie. PREEMPT_RT
>> and not Adeos), and ideally with the compatibility layer for Xenomai
>> 2.x existing applications.
>>
>> I had a look at this thread :
>> http://lists.busybox.net/pipermail/buildroot/2016-January/150791.html
>>
>> I was wondering if anyone already worked on this stuff, in order to
>> combine the efforts ?
>> I can do it on my own, of course, but I think it would be better to
>> have it integrated upstream :) !
>
> So far, we haven't received any patch to add Xenomai 3.x support in
> Buildroot, and I've not heard (besides you asking questions on IRC)
> anyone working on this currently.
>
> So patches are definitely welcome. It's not clear to me whether we want
> to support both Xenomai 2.x and Xenomai 3.x, or if supporting Xenomai
> 3.x is sufficient, as a replacement for Xeonmai 2.x.

Well, yes, it is not clear for me either.
I am not sure that it has to be compiled the same way.
Well, if I have anything I can show, I will ask for advices.

Thanks,
JM

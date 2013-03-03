From: Stephan Hoffmann <sho@relinux.de>
Date: Sun, 03 Mar 2013 18:51:29 +0100
Subject: [Buildroot] Google Summer of Code 2013
In-Reply-To: <20130303144339.7c5a189a@skate>
References: <20130209004253.207e0741@skate>
 <201302131955.35889.yann.morin.1998@free.fr> <20130214152547.555d4553@skate>
 <20130303144339.7c5a189a@skate>
Message-ID: <51338DA1.3090000@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 03.03.2013 14:43, schrieb Thomas Petazzoni:
> On Thu, 14 Feb 2013 15:25:47 +0100, Thomas Petazzoni wrote:
>
>>> In short:
>>>   - mentoring applications must be sent from 2013-03-18 19:00Z, and
>>>     no later than 2013-03-29 19:00Z.
>>>   - list of accepted mentoring organisations published on 2013-04-08 19:00Z
>>>   - students start working 2013-06-17, until 2013-09-23 19:00Z
>>>   - mentor submit is on 2013-10-19 and 2013-10-20 (at Google HQs?)
>>>
>>> Now, we're left to imagining what we'll be submitting. ;-)
>> I've written down three ideas:
>> http://elinux.org/Buildroot:GSoC2013Ideas.
>>
>> Comments on those ideas are welcome, as well as additional ideas.
> Any opinions about this?
Hello Thomas,

I think all the suggestions are good, but the ARM SoC multimedia
libraries are most important. These chips seem to become very popular,
especially since there are low-cost platforms available as Beaglebone,
Pengwyn, Wandboard or Raspberry Pi. As I have seen at the Embedded World
in Nuremberg last week there are lots of industrial grade boards and
modules especially with iMX5x, iMX6 and AM335x available or introduced.
I expect that these systems will get a significant market share soon. So
it might be really important to have good support for them in buildroot.

There are gazillions of such SoC available, but I think that Freescale
and Texas are the most wide spread. Of course we cannot leave out RPi,
although  I do not think that it has a significance in the industrial
sector.

Maybe we should think about splitting this up into different projects,
since the three platforms might be to much for one student.

Regarding the autotests I'd really like to see some automatically tested
well-defined configurations, also regarding the SoC multimedia
libraries. These could also be a convenient start point for new users.

Kind regards

Stephan
>
> Thanks,
>
> Thomas

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130303/d9da4a46/attachment.html>

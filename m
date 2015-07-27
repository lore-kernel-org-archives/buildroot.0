From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 27 Jul 2015 19:42:08 +0200
Subject: [Buildroot] [PATCH 00/13] Update Freescale packages to
	3.10.53-1.1.0_GA
In-Reply-To: <CAD7j7Q_sNtMoMvD5oCbGAG8zUr1tyiPEgGNQfODXxz-z2_TVdQ@mail.gmail.com>
References: <CAD7j7Q-B9NAQqVHZr+uPmFTjOa5BJ-Orc3bOKFx81UHYX8Yk0Q@mail.gmail.com>
 <20150718215519.4c789c41@free-electrons.com>
 <CAD7j7Q_sNtMoMvD5oCbGAG8zUr1tyiPEgGNQfODXxz-z2_TVdQ@mail.gmail.com>
Message-ID: <CAAMH-yuqz=JYq8Z=CuRAtzauxP3LQv4vyNGVLBpUwdB-Pt1Mjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

On Sat, Jul 18, 2015 at 10:06 PM, Carlos Soto <csotoalonso@gmail.com> wrote:
>
>
> 2015-07-18 21:55 GMT+02:00 Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>:
>>
>> Dear Carlos Soto,
>>
>> On Sat, 18 Jul 2015 21:36:04 +0200, Carlos Soto wrote:
>>
>> > Any news witch those patches? Would they be commmitted any time soon?
>> > I've
>> > tried to apply them to my local copy and I wasn't able to, so instead I
>> > applied the changes "manually" (I know, a bit noob :P)
>>
>> They have all been committed.
>
>
> Ooops! You're right, of course, Thomas. I should have checked it before
> asking.
>
>>
>>
>> > Anyway, they seem to work except for the fact that as soon as a program
>> > is
>> > stopped (mainly I've tried with glxgears) the xserver crashes. That's
>> > the
>> > error log:
>>
>> I'm adding Gary in Cc, he can probably help about this, at least
>> confirm whether he can reproduce the same problem or not.
>
>
> Great! I'll also try it again once I update my local copy

Yes I confirm I've built the master branch today and I see this error
when closing the X app. I will let you know if I find what causes this
error. Note that in my case it doesn't happen all the time. I suspect
the vivante libraries...

Regards,
Gary

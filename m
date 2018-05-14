From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 14 May 2018 17:56:10 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-05-10
In-Reply-To: <CANQCQpa3nFjuax6K1Csw+099m4LsS99MVYfTxTAKDW2SGK1F8w@mail.gmail.com>
References: <20180511060052.6B11C208B6@mail.bootlin.com>
 <CANQCQpaXv50gaegjR954LMBd1FLj0U3jefnG_DSVAMujzv-qWQ@mail.gmail.com>
 <20180511144826.mtmjci4ppvacqorg@tarshish>
 <CANQCQpaHtYa3DwxLu_337Zhocm1jdEfX5ZUuo_YSwp4r1Ti7UA@mail.gmail.com>
 <20180511173533.2a43aa9f@windsurf.home>
 <CANQCQpa3nFjuax6K1Csw+099m4LsS99MVYfTxTAKDW2SGK1F8w@mail.gmail.com>
Message-ID: <CANQCQpZ6GuNQV2Y0A4290Mjftr+qq=gScO+zvqqaZQYRuQucWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Fri, May 11, 2018 at 11:13 AM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> On Fri, May 11, 2018 at 10:35 AM, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>> Hello,
>>
>> On Fri, 11 May 2018 10:30:16 -0500, Matthew Weber wrote:
>>
>>> > traceroute fails[1] for a similar reason on your autobuilder, this time
>>> > because of -lm. I wonder what makes your machine special?
>>> >
>>> > [1] http://autobuild.buildroot.net/?reason=traceroute-2.1.0
>>>
>>>
>>> I'll take a look.  Nothing to special about it.  I know the version of
>>> make is 3.8.1 so that we can build older kernels.....
>>
>> You said "make 3.81" on IRC, not "make 3.8.1". Which one is true ?
>>
>> My autobuilder also has "make 3.81", and I don't think it exhibits
>> those build failures.
>>
>
> Oops, sorry.
>
> # make --version
> GNU Make 3.81

I switched back to 4.1 (U16.04 default) and the issue for both
traceroute and xfsprogs went away.  Doesn't answer why but resolves
the failures....

Matt

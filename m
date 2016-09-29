From: servo gmrt <servo.gmrt@gmail.com>
Date: Fri, 30 Sep 2016 01:04:19 +0530
Subject: [Buildroot] RTAI math module compilation
In-Reply-To: <87vaxi2zip.fsf@dell.be.48ers.dk>
References: <CAEqQue108OTCsmAejX1sR6q8HL2zCj7jXtaB927b=kHo=UQTrA@mail.gmail.com>
 <78c4ab72-52be-571c-e81a-a0f78c1e2e7f@mind.be>
 <87vaxi2zip.fsf@dell.be.48ers.dk>
Message-ID: <CAEqQue3VOmTHMNOavNZrP93sagLki-VaUVYoO4EcXf95b2Sf=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

RTAI supports to ARM ,m68,  PPC and x86.

I am using it in my project.

Recently I compiled RTAI-4.0.1 with 3.8.13 kernel. It is working fine.

I found some changes and modifications are required for building
rtai_math.ko module.

I did the changes in generated makefile after that it started building. (I
followed http://mail.rtai.org/pipermail/rtai/2012-December/025250.html )

Rtai releases are not as fast as Linux Kernel and buildroot.Don't remove
the RTAI module from buildroot.





On Tue, Sep 27, 2016 at 1:40 AM, Peter Korsgaard <peter@korsgaard.com>
wrote:

> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
> Hi,
>
>  >  Perhaps we should remove RTAI. The most recent patch for x86 is 3.8,
> and the
>  > most recent patch for ppc is 2.6.29... Oh, and there is a new version
> 5.0-test2
>  > released in May that goes up to 4.1 for x86 (and drops ppc).
>
> So x86 is the only supported arch? I see that test2 isn't even announced
> on rtai.org :/
>
> I personally don't have any issues removing RTAI if it doesn't get
> updated / nobody uses it.
>
> If you DO use it, please speak up.
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160930/fe0a34d4/attachment.html>

From: Markos Chandras <markos.chandras@gmail.com>
Date: Mon, 27 May 2013 16:11:22 +0100
Subject: [Buildroot] [PATCH] external-toolchain: Allow MIPS64 for
 Codesourcery MIPS toolchains
In-Reply-To: <20130527111829.42368807@skate>
References: <1368627740-4094-1-git-send-email-markos.chandras@gmail.com>
 <20130526152910.2a32ecbb@skate>
 <CAG2jQ8hK4nY2mL4PQEX8miQyCZLbvV=H9scJu8ZaQPNZnnruNw@mail.gmail.com>
 <20130527111829.42368807@skate>
Message-ID: <CAG2jQ8gFdXRE9SF4m-5C0-oW=LHfUgZWkvVsZNLv3=T_=3+Lrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27 May 2013 10:18, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Markos Chandras,
>
> On Mon, 27 May 2013 10:05:10 +0100, Markos Chandras wrote:
>
>> I did limited testing and I haven't seen this problem but I haven't
>> build busybox to be honest.
>> However, on the release notes they say they support MIPS64/n64
>> https://sourcery.mentor.com/GNUToolchain/release2358?@template=datasheet
>>
>> so I just allowed buildroot to select this combination as well.
>>
>> My understanding is that the compilation problem is orthogonal to
>> mip64/n64 patch in the sense
>> that forbidding the combination just hides the problem for now :)
>
> I agree that the problem is orthogonal, but having an external
> toolchain that isn't even capable of building Busybox worries me a
> little bit. This means that an user selecting mips64 and external
> toolchain, and keep all the other options as default, will see a
> failing build. Not really nice.

Ok I agree. I will try an out-of-buildroot build for busybox using
this toolchain just to rule out specific buildroot problems. If that
fails too then I will see if there is a way to report this problem.

--
Regards,
Markos Chandras

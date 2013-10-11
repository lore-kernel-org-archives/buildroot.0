From: Lionel Orry <lionel.orry@gmail.com>
Date: Fri, 11 Oct 2013 16:43:46 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-10-10
In-Reply-To: <20131011163133.7755b2c0@skate>
References: <20131011063009.335B352C1A0@lolut.humanoidz.org>
 <CAKAx1chC4oz0iJRed6_koLNiMR=HhOSF_K__DYGhvGZXa2UrNw@mail.gmail.com>
 <CAAXf6LWPcf3LSouCznvD_R=s33OL2SyidjFSob20k-PRGczWzg@mail.gmail.com>
 <20131011163133.7755b2c0@skate>
Message-ID: <CAKAx1chHiKeO8x5QXKgRVm4WxHTo-GqpEZ3PhZA+2izF19WkEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Oct 11, 2013 at 4:31 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Fri, 11 Oct 2013 16:30:33 +0200, Thomas De Schampheleire wrote:
>
>> Thanks for this suggestion.
>> Based on this, I was able to fix the build error using:
>>
>> RUBY_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -O2"
>>
>> Now my question: would you like to send a patch for this, or would you
>> like me to do it?
>
> Should this be done only for the SuperH architecture? Only for the
> affected external toolchains?

Yes, only for SuperH, this is specific to the architecture. I don't
know about the toolchains, several bugs on gcc bugzilla refer to
various versions, but a good bunch of them are marked as resolved so
I'm not sure...

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

Thanks,
Lionel

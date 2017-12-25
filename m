From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 24 Dec 2017 19:46:03 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-12-23
In-Reply-To: <d5eb5b67-0a7b-0490-d119-e6ffc4a0dae3@gmail.com>
References: <20171224070010.58DF22070B@mail.free-electrons.com>
 <d5eb5b67-0a7b-0490-d119-e6ffc4a0dae3@gmail.com>
Message-ID: <CANQCQpYAVCagCrqYUyuzRaMTFXzYxraBC21cjAhRXJtP6N6msA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Sun, Dec 24, 2017 at 4:36 AM, Romain Naour <romain.naour@gmail.com> wrote:
> Hi All,
>
> Le 24/12/2017 ? 08:00, Thomas Petazzoni a ?crit :
>> Hello,
>>
>> Build statistics for 2017-12-23
>> ===============================
[snip]
>>      powerpc |             liburiparser-0.8.1 | TIM | http://autobuild.buildroot.net/results/e7816d6a15d2a96ca9a401e95955c75d54e7d6da |
>>       x86_64 | make[2]: *** [libtests/buil... | TIM | http://autobuild.buildroot.net/results/fded34f8e5da52737f4c40107e28ad77a223d64b |
>>       x86_64 | make[2]: *** [Makefile:71: ... | TIM | http://autobuild.buildroot.net/results/52f9379d98a1826e1d0faa60ba89a8d5ac09895e |
> The default timeout value seems too short for my autobuilder.

I've got a autobr patchset I'll send out in the next couple days that
removes the timeout and makes it based on updates to the
build-time.log.  I think I've got enough test coverage at this point.
My largo autobuilder has been running for a couple day and handling
8+hr builds as well as successful/timeouts.

Matt Weber

From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 1 Apr 2015 16:09:48 -0500
Subject: [Buildroot] [PATCH 1/1] jamvm: add depends on toolchain
	w/threads
In-Reply-To: <20150401164428.7fcc4854@free-electrons.com>
References: <1427385280-63133-1-git-send-email-matthew.weber@rockwellcollins.com>
 <CAMQcK5KRF47ZyTyzfj1e+xcDO0V_J8oUUXEgUiqF3zR6VYv7Qw@mail.gmail.com>
 <CANQCQpaJObqR6poUyh5FMm58vPFGyruJm=JBWBbQtPgsP8pf1g@mail.gmail.com>
 <CAMQcK5Lsur2cCryZ=fTGeeWRQzwCtaErkP-Of9auJ+-s6cHkEQ@mail.gmail.com>
 <20150401164428.7fcc4854@free-electrons.com>
Message-ID: <CANQCQpaUASXg+Rb_ea7wA+=okCuEyE_j1WpRrLuB0tVQEX5_9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Wed, Apr 1, 2015 at 9:44 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Ryan Barnett,
>
> On Wed, 1 Apr 2015 09:28:12 -0500, Ryan Barnett wrote:
>
>> > While running an autobuilder internally.  It's a arm uclibc build
>> > failure looking for pthreads.
>>
>> I am curious about the Buildroot autobuilders then if they don't have
>> javac available on them to build.
>>
>> Thomas - are there autobuilders that have javac installed on them?
>
> The autobuild-run script detects whether javac is available or not. If
> it's not available, it makes sure to not attempt a build that has the
> Buildroot packages that require javac to be installed.
>

Ok, it looks like it's detecting it as "javac 1.7.0_75" on ours.  I'll
update my buildroot-test branch to the latest and retest (I'm a couple
months behind).

Thanks,
Matt

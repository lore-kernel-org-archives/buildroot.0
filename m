From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 3 Mar 2013 18:29:24 +0100
Subject: [Buildroot] Google Summer of Code 2013
In-Reply-To: <20130303144339.7c5a189a@skate>
References: <20130209004253.207e0741@skate>
 <201302131955.35889.yann.morin.1998@free.fr>
 <20130214152547.555d4553@skate> <20130303144339.7c5a189a@skate>
Message-ID: <CAAXf6LW8ACwDL_1=gAMFo9-hrZj5RnUR6rCcXsuxin1n3+CNNA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Mar 3, 2013 at 2:43 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> On Thu, 14 Feb 2013 15:25:47 +0100, Thomas Petazzoni wrote:
>
>> > In short:
>> >   - mentoring applications must be sent from 2013-03-18 19:00Z, and
>> >     no later than 2013-03-29 19:00Z.
>> >   - list of accepted mentoring organisations published on 2013-04-08 19:00Z
>> >   - students start working 2013-06-17, until 2013-09-23 19:00Z
>> >   - mentor submit is on 2013-10-19 and 2013-10-20 (at Google HQs?)
>> >
>> > Now, we're left to imagining what we'll be submitting. ;-)
>>
>> I've written down three ideas:
>> http://elinux.org/Buildroot:GSoC2013Ideas.
>>
>> Comments on those ideas are welcome, as well as additional ideas.
>
> Any opinions about this?

Thanks for your efforts in writing this down!

A few small remarks:
- For the ARM SoC multimedia support, one of the steps written is:
"Get some packages accepted upstream in the official Buildroot Git
repository, by going through the traditional patch submission/review
process."
In my opinion, the goal is to get *all* packages accepted upstream.
With a partial integration, someone else will have to pick up the
remaining patches and prepare them for inclusion.

- For the Blackfin integration project, I think that prior
experience/knowledge with/about Blackfin and/or other no-MMU platforms
would also be a plus.

- Finally, for the testing infrastructure: in addition to the qemu
testing, it would also be nice if we had automatic real target testing
on some boards, for example with Beaglebone/Beagleboard/Pandaboard.
This would require some of these boards to be permanently hooked up to
a host machine, and a set of tests to execute on the device. Being
able to remotely reset the board even without a booting system would
also be nice, to prevent needing to much manual rescuing. Obviously,
this is more involved than with qemu, and we'd need a place where
these setups are hosted (somewhere at Peter's place or in Free
Electron's offices?) It may also be too much for this GSoC, but I
thought I'd mention it anyway.

Best regards,
Thomas

From: Bernhard Fischer <rep.nop@aon.at>
Date: Tue, 12 Dec 2006 11:21:09 +0100
Subject: [Buildroot] [patch] qtopia4
In-Reply-To: <37c712e0612120205p5c580f20k7696bbfe24626093@mail.gmail.com>
References: <20061211093336.GA11591@zelow.no> <20061211102408.GB20661@aon.at>
	<20061211120041.GB11591@zelow.no> <20061211134347.GA21997@aon.at>
	<20061211215648.GA15000@zelow.no>
	<20061211222708.GE4442@aon.at> <20061212083851.GA6677@zelow.no>
	<37c712e0612120205p5c580f20k7696bbfe24626093@mail.gmail.com>
Message-ID: <20061212102109.GA5767@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 12, 2006 at 06:05:31PM +0800, Allan Clark wrote:
>On 12/12/06, Thomas Lundquist <lists@zelow.no> wrote:
>> On Mon, Dec 11, 2006 at 11:27:08PM +0100, Bernhard Fischer wrote:
>> [...]
>>
>> > >It's a habit. Any real reason we should make it a requirement not to
>> > >have it or is it just for looks?
>> >
>> > Well, it's bloat :) Habit of mine to omit them if they are not needed.
>>
>> hehe.
>>
>> but space isn't much of an issue in the buildroot scripts.
>
>(I think we're still tlaking about ";")

We do indeed.
>
>I'm involved in a project where a ";" instead of a "&&" between two
>dependent build steps is evil, naughty, and generally bad.  Seems the

Note that we're talking about the command-separator of sed.

I don't buy the argument that "space isn't much of an issue in the
buildroot scripts", fwiw.

Just don't add bloat in the first place, especially when it's
superfluous, doesn't serve any purpose whatsoever etc. Anywhere.
Anytime. At any rate.

It's a no-go.
Grossly OT, though. :P

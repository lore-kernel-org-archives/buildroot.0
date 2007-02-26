From: Allan Clark <allanc@chickenandporn.com>
Date: Sun, 25 Feb 2007 19:26:01 -0600
Subject: [Buildroot] Mac OS X status
In-Reply-To: <b15982770702251720v71d2dd5fo87e5a6f56f34d6a5@mail.gmail.com>
References: <45E1751E.2010406@cs.helsinki.fi>
	<b15982770702251720v71d2dd5fo87e5a6f56f34d6a5@mail.gmail.com>
Message-ID: <37c712e0702251726m95f94a8h35d46440de18fb36@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2/25/07, David Smoot <davidsmoot@gmail.com> wrote:
> On 2/25/07, Heikki Lindholm <holindho@cs.helsinki.fi> wrote:
> > Hello,
> >
> > In case there are some other parties interested in seeing buildroot
> > working on a Mac OS X host, here's a short status report. Using the sed
> > patch I posted and after fixing some incompatible "cp"'s, one "du -l", a
> > few missing headers, and a missing "getline" function, I can build a
> > simple uclibc+busybox installation up to where it would need fakeroot,
> > which, unfortunately, doesn't seem to work on OS X.
> >
> > -- Heikki Lindholm
>
> Big thumbs up to you for doing this.  I'm sure it is a small group of people
> that would use buildroot on a Mac but I appreciate it.  And I would imagine
> Buildroot will benefit by the extra effort to make it POSIX compliant.
> David

I've contributed to this in the past, others have, this would need
some assurance that the parts for buildroot on MacOSX would have a
chance of merging to baseline, or there will probably be an annual
"hey, I have an idea, buildroot on MacOSX" attempt.  If the changes go
to baseline, then the issue becomes maintenance, not re-invention.

Allan

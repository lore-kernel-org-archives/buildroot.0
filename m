From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Oct 2014 18:14:24 +0200
Subject: [Buildroot] Review of FOSDEM 2014 meeting action points
In-Reply-To: <CAGduivy-PEV9kqjD50yhKc3T8=iZa6cdg-q0Z48dQvA4SnYg1g@mail.gmail.com>
References: <20141008104845.495ad683@free-electrons.com>
 <CAHXCMMLaWJki-F0NXKAw243DWUKdtWeE=q1iDNoVdi+2_z9s7w@mail.gmail.com>
 <CAGduivy-PEV9kqjD50yhKc3T8=iZa6cdg-q0Z48dQvA4SnYg1g@mail.gmail.com>
Message-ID: <20141008181424.27e753c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Wed, 8 Oct 2014 13:01:56 +0200, Maxime Hadjinlian wrote:

> >>  - SystemV/systemd init scripts. The idea was to do automatic
> >>    installation of init scripts / service files located in
> >>    package/<foo>/. Maxime Hadjinlian said he would work on this, but
> >>    not much happened. On a related note, there is a need to separate
> >>    the skeleton to not avoid Busybox-related init scripts in a pure
> >>    systemd configuration.
> I know.. shame on me.

No problem. The point of doing a review of the action points is
definitely *not* to put the blame on anybody.

> I still have a branch with a beginning of something. I would *really*
> like to finish this during the dev-days, it would be great.

Ok. Though from my perspective, active development could better take
place outside of the dev-days. Maybe focusing the dev-days on
cleaning up the patchwork backlog is a better idea.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

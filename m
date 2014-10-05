From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 14:30:44 +0200
Subject: [Buildroot] [PATCH 00 of 15] packages: rename FOO_BAR_OPT into
 FOO_BAR_OPTS
In-Reply-To: <CAAXf6LVLp2GnVswKTuFWCOCs1RoFDix4-mvwuKE=6iXwbvVJQg@mail.gmail.com>
References: <patchbomb.1411846357@localhost>
 <20141004190749.2a9c9e31@free-electrons.com>
 <20141005091735.GD4220@free.fr>
 <20141005130744.15148459@free-electrons.com>
 <CAAXf6LVLp2GnVswKTuFWCOCs1RoFDix4-mvwuKE=6iXwbvVJQg@mail.gmail.com>
Message-ID: <20141005143044.1e517832@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 5 Oct 2014 14:22:12 +0200, Thomas De Schampheleire wrote:

> The reason these patches were part of the _OPT series was that due to
> the introduction of an extra letter, some alignment was broken. If we
> do not removal all alignment consistently, then how do you propose to
> handle this?
> 
> a. do nothing, and thus let the alignment be broken
> b. expect the submitter of such renaming changes to fix the specific
> alignment issues he/she introduced? (which is painful (but not
> impossible) since the renaming typically happens with an automated
> command or script)
> c. remove all fragile alignment in one go, so that such problems do not occur.
> 
> In my original patches I went for reasoning c.
> How would you handle the alignment issue instead?

Good question. For now, I'm tempted to say (a) :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

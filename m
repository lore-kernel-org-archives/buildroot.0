From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Jan 2014 08:37:14 +0100
Subject: [Buildroot] [PATCH 1/1] Fixed tcpreplay auto build errors
In-Reply-To: <CAFOYHZDmMG8iMshnUwwdgoNeG2g+Xe3DaVbsfTyyz8WzsOsy9Q@mail.gmail.com>
 (Chris Packham's message of "Thu, 23 Jan 2014 13:54:10 +1300")
References: <1390300886-15282-1-git-send-email-martin@barkynet.com>
 <CAFOYHZDW+N_0oOYDCigr8-hG=vP-wW=Yey7ADrponotyXnxRFg@mail.gmail.com>
 <87vbxce6ks.fsf@dell.be.48ers.dk>
 <CAFOYHZDmMG8iMshnUwwdgoNeG2g+Xe3DaVbsfTyyz8WzsOsy9Q@mail.gmail.com>
Message-ID: <87txcvb13p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Packham <judge.packham@gmail.com> writes:

Hi,

 > I'm already working on an upstream fix
 > https://github.com/appneta/tcpreplay/pull/60 just waiting to hear some
 > feedback. Buildroot could carry my patch or just wait for the change
 > to be merged upstream. I've also got a different change needed for
 > x86_64 but I think that's more a ubuntu/debian thing than a x86_64
 > architecture thing.

 > Mine is a slightly different solution to what you suggest. Doing some
 > grepping through the tcpreplay source it looks like my solution of
 > adding a format string has been used in other places.

Ahh ok, yes - It also works to change the callers of the macro,
naturally. Lets see what upstream says.

 > I'll take a look at your suggestion for TCPREPLAY_CONF_ENV and see if
 > I can come up with a solution that works when cross compiling.

Thanks!

-- 
Bye, Peter Korsgaard

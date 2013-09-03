From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Sep 2013 09:18:18 +0200
Subject: [Buildroot] [PATCH 2 of 9 v4] Config.in.legacy: update
 description for users
In-Reply-To: <52257EA4.9030001@mind.be>
References: <patchbomb.1378152469@argentina>
 <ac4d080274a06689e8d4.1378152471@argentina>
 <20130902225514.7d9323cc@skate> <52257EA4.9030001@mind.be>
Message-ID: <20130903091818.616d6665@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 03 Sep 2013 08:16:04 +0200, Arnout Vandecappelle wrote:

> >>   if BR2_LEGACY
> >>   comment "Your old configuration uses legacy options that no  "
> >> -comment "longer exist in buildroot.                          "
> >> -comment "Please look at the options which have been selected "
> >> -comment "and read their help text.                           "
> >> -comment "As long as these options stay selected, the build   "
> >> +comment "longer exist in buildroot, as indicated in the menu "
> >> +comment "below. As long as these options stay selected, or in"
> >> +comment "case of string options are non-empty, the build     "
> >>   comment "will fail.                                          "
> >> +comment "*                                                   "
> >> +comment "Where possible, an automatic conversion from old to "
> >> +comment "new symbols has been performed. Before making any   "
> >> +comment "change in this legacy menu, make sure to exit the   "
> >> +comment "configuration editor a first time and save the      "
> >> +comment "configuration. Otherwise, the automatic conversion  "
> >> +comment "of symbols will be lost.                            "
> >
> > This really seems ugly for users, no? I know it's been discussed, but
> > can you summarize why this should be done by our users?
> 
>   I.e., add "because of Kconfig limitations", right?

That I understood, but for my own culture, can you summarize what are
those limitations? Maybe it would be good to document them in the big
fat comment inside Config.in.legacy (not the one shown to the user, but
the one inside the source code). Having to exit menuconfig, and restart
it doesn't seem like a really great thing, so I'd like to understand
why we need that, and what are our options to maybe solve this in the
future.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

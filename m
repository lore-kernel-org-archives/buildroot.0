From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Tue, 28 Dec 2010 10:19:37 -0600
Subject: [Buildroot] oprofile "requires" gmp??? Slight fork:
	BR2_STAGING_DIR
In-Reply-To: <4D19E079.9030704@zacarias.com.ar>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1EA26053@EXV1.corp.adtran.com><20101223082740.3a8e44c4@surf><9AC3F0E75060224C8BBC5BA2DDC8853A1EA263BF@EXV1.corp.adtran.com>	<20101224090517.0c935c19@surf>	<9AC3F0E75060224C8BBC5BA2DDC8853A1EA2689B@EXV1.corp.adtran.com>
	<4D18D7B3.3020900@zacarias.com.ar>
	<4D18D873.9010502@zacarias.com.ar>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EAEB132@EXV1.corp.adtran.com>
	<4D19E079.9030704@zacarias.com.ar>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1EAEB2EA@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > Where did BR2_STAGING_DIR go?  I'm used to it being under Build
> Options,
> > but I cannot find it.
> >
> > In fact, when I put this in and did a make oldconfig it deleted my
> entry
> > in the .config file.
> 
> Staging lives now in output/host/usr/tuple/sysroot, it's no longer an
> option. We can keep


You have a period there after "option" with "We can keep" as a partial
sentence.  So, what does that mean exactly?  Do you mean "it's no longer
an option we can keep." or do you mean "it's no longer an option.  We
can keep [this if enough people want that option]."

If it is the latter, please keep this as an option as I use this option
extensively with our code management system.  

Andy

From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Wed, 29 Oct 2008 19:02:34 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <873aif2zqq.fsf@macbook.be.48ers.dk>
References: <20081028094026.563A73C671@busybox.net>
	<061E11D86E3DFF459604DF5B36F0805F1BA6D0@salka01.valka.local>
	<873aif2zqq.fsf@macbook.be.48ers.dk>
Message-ID: <200810291902.35097.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard, 29.10.2008:
> >>>>> "Arnar" == Arnar Mar Sigur?sson <antab@valka.is> writes:
> 
> Hi,
> 
>  Arnar> This breaks building Qt for AVR32. It will force qmake to be
>  Arnar> build for the target so its unusable later on.
> 
> Ok, I don't do Qt nor AVR32 - Markus, Thomas?

Sorry for this. I'm a bit ashamed, as I use AVR32 myself. I used it at the
office on the AVR32, but after the PKG_CONFIG cleanup the day before I decided
to introduce TARGET_CONFIGURE_OPTS at home and only tested it for i386.

Please try the patch I just sent, Arnar. It fixes it for me on AVR32 and
should fix it for you, too.

Markus

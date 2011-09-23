From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Sep 2011 16:13:29 +0200
Subject: [Buildroot] Comments on boost package
In-Reply-To: <1316777702-12037-1-git-send-email-a@awn.dk>
References: <1316777702-12037-1-git-send-email-a@awn.dk>
Message-ID: <20110923161329.62330598@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 23 Sep 2011 13:35:01 +0200,
"Allan W. Nielsen" <a@awn.dk> a ?crit :

> > Maybe this can be done with a make $(subst ...) call.
> 
> I simply could not get it to work.

It's a little bit tricky:

	$(subst $(space),$(comma),$(myvar))

The "space" and "comma" variables are defined by the main Buildroot
Makefile, and they allow to pass a space and a comma as argument to
$(subst) :-)

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Jul 2009 14:17:31 +0200
Subject: [Buildroot] [PATCH] Add support for custom post-build script
In-Reply-To: <20090727115838.GS13236@buzzloop.caiaq.de> (Daniel Mack's message
	of "Mon\, 27 Jul 2009 13\:58\:38 +0200")
References: <1247086018-18816-1-git-send-email-daniel@caiaq.de>
	<87vdlgsbvy.fsf@macbook.be.48ers.dk>
	<20090727115838.GS13236@buzzloop.caiaq.de>
Message-ID: <877hxupbfo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

Hi,

 >> It would be good to have a note about it in the documentation - Could
 >> I get you to add a short note about it in docs/buildroot.html?

 Daniel> Sure, see below.

Thanks! One comment:

 Daniel> +      find that a certain package generates wrong or unneeded files, you
 Daniel> +      should rather fix than package than shipping your way around it
 Daniel> +      with a cleanup script.</p>

I think '.. than working around it with a cleanup script.' sounds a
bit better - OK with you?


-- 
Bye, Peter Korsgaard

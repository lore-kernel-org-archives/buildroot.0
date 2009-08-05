From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Aug 2009 15:52:09 +0200
Subject: [Buildroot] [PATCH 1/2] e2fsprogs: factor out libuuid support
In-Reply-To: <20090805115505.GD19257@buzzloop.caiaq.de> (Daniel Mack's message
	of "Wed\, 5 Aug 2009 13\:55\:05 +0200")
References: <20090729172019.GS19257@buzzloop.caiaq.de>
	<1248888083-11767-1-git-send-email-daniel@caiaq.de>
	<20090803143614.GK19257@buzzloop.caiaq.de>
	<20090803165815.312deddd@surf>
	<20090803150941.GM19257@buzzloop.caiaq.de>
	<873a88sjx0.fsf@macbook.be.48ers.dk>
	<20090804082822.GO19257@buzzloop.caiaq.de>
	<87ocquo52y.fsf@macbook.be.48ers.dk>
	<20090805115505.GD19257@buzzloop.caiaq.de>
Message-ID: <877hxinzau.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

Hi,

 Daniel> Great, thanks. Could you merge the ubifs-target patch as well.
 Daniel> (That was 2/ of my original posting)

Sure, I'll have a closer look at it a bit later today.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Aug 2009 13:47:17 +0200
Subject: [Buildroot] [PATCH 1/2] e2fsprogs: factor out libuuid support
In-Reply-To: <20090804082822.GO19257@buzzloop.caiaq.de> (Daniel Mack's message
	of "Tue\, 4 Aug 2009 10\:28\:22 +0200")
References: <20090729172019.GS19257@buzzloop.caiaq.de>
	<1248888083-11767-1-git-send-email-daniel@caiaq.de>
	<20090803143614.GK19257@buzzloop.caiaq.de>
	<20090803165815.312deddd@surf>
	<20090803150941.GM19257@buzzloop.caiaq.de>
	<873a88sjx0.fsf@macbook.be.48ers.dk>
	<20090804082822.GO19257@buzzloop.caiaq.de>
Message-ID: <87ocquo52y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

 >> Why did you make this a hidden config? Couldn't we imagine someone
 >> wanting to use libuuid in their own programs?

 Daniel> I didn't image that ;) But you're right, that could help. See
 Daniel> the new patch below.

Thanks, committed.

You were missing -clean and -source targets, but I've added those.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Oct 2009 23:06:21 +0200
Subject: [Buildroot] [PATCH] gst-plugins-good: make new dependency-less
	plugins configurable
In-Reply-To: <1256145290.19499.0.camel@sven> (Sven Neumann's message of "Wed\,
	21 Oct 2009 19\:14\:50 +0200")
References: <200910200018.17071.markus.heidelberg@web.de>
	<1256066492-8158-1-git-send-email-s.neumann@raumfeld.com>
	<87vdi9qhqe.fsf@macbook.be.48ers.dk> <1256115940.11240.5.camel@sven>
	<87my3lq960.fsf@macbook.be.48ers.dk> <1256145290.19499.0.camel@sven>
Message-ID: <87hbtspicy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 >> Is that directdraw as in the component of Microsoft DirectX? That indeed
 >> doesn't seem like something we would want to enable. Why did you remove
 >> the line?

 Sven> Ah right, now I rememeber. It is not any longer a valid configure
 Sven> option for the new release. So I removed it.

Ok, committed - Thanks.

-- 
Bye, Peter Korsgaard

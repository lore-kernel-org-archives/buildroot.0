From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Oct 2009 15:56:24 +0200
Subject: [Buildroot] [PATCH] e2fsprogs: add a patch to link against
	SEM_INIT libs
In-Reply-To: <20091007134105.GW9361@buzzloop.caiaq.de> (Daniel Mack's message
	of "Wed\, 7 Oct 2009 15\:41\:05 +0200")
References: <1254826414-20763-1-git-send-email-daniel@caiaq.de>
	<1254826414-20763-2-git-send-email-daniel@caiaq.de>
	<8763armir5.fsf@macbook.be.48ers.dk>
	<20091007134105.GW9361@buzzloop.caiaq.de>
Message-ID: <871vlfmho7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

 >> But your patch removes stuff (PRIVATE_LIBS_CMT), it doesn't add
 >> anything?

 Daniel> The e2fsprog make setup is really screwed. They set
 Daniel> PRIVATE_LIBS_CMT to "#" in configure which then causes all
 Daniel> subsequent paramters to get ignored. As I think 'CMT' stands
 Daniel> for 'comment', I guess this is intended. Took me awhile to find
 Daniel> out what they do, too ;)

Ahh, ok, thanks for the description.

Committed both patches, thanks!

-- 
Bye, Peter Korsgaard

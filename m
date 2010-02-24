From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Feb 2010 21:48:34 +0100
Subject: [Buildroot] [PATCH] bump linux kernel versions
In-Reply-To: <201002231555.50237.hartleys@visionengravers.com> (H. Hartley
	Sweeten's message of "Tue, 23 Feb 2010 15:55:50 -0700")
References: <201002231555.50237.hartleys@visionengravers.com>
Message-ID: <87vddm742l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

 H> Bump all the linux kernel version to the latest available and add a
 H> help note for all of them with the release data and status.

 H> The long-term stable 2.6.27 kernel is really out of date (.27 -> .45).

 H> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

Committed, thanks - I really think we should move to a free form version
selection (E.G. a string) in the long term though.

-- 
Bye, Peter Korsgaard

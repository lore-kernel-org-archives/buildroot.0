From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Feb 2014 22:12:32 +0100
Subject: [Buildroot] [PATCH] transmission: fix uTP enabled build with
	ccache
In-Reply-To: <22e21340ef00524eba07.1392732990@argentina> (Thomas De
 Schampheleire's message of "Tue, 18 Feb 2014 15:16:30 +0100")
References: <22e21340ef00524eba07.1392732990@argentina>
Message-ID: <8761oc5dmn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > Transmission would incorrectly determine the C++ compiler when ccache is
 > enabled, causing a build with uTP to fail at the configure step.
 > This patch adds a patch against transmission, fixing the problem.

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

 > +Upstream-status: submitted: https://trac.transmissionbt.com/ticket/5612

Great, thanks.

-- 
Bye, Peter Korsgaard

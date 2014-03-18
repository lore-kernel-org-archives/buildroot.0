From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Mar 2014 23:32:18 +0100
Subject: [Buildroot] [PATCH] support: do not depend on bash
In-Reply-To: <1395173848-15759-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 18 Mar 2014 21:17:28 +0100")
References: <1395173848-15759-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87siqfw32l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > We do want to work properly whatever the system shell or the
 > user's login shell are.

 > The current check is anyway broken, as it only checks if the
 > user's login shell is bash, not what the system shell is.

 > Remove the check altogether, since it is unneeded, and broken.

But we (currently atleast) do want bash for our own Makefiles (see
toplevel Makefile). I'm not sure we're completely bashism-free (or if it
is worth the trouble to be so).

-- 
Bye, Peter Korsgaard

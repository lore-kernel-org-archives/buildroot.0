From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Feb 2014 16:35:03 +0100
Subject: [Buildroot] [PATCH] package/linux-headers: add comment to
	safely ignore missing cross-compiler
In-Reply-To: <1393166118-26660-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 23 Feb 2014 15:35:18 +0100")
References: <1393166118-26660-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87lhx1q1ug.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > For some architectures (eg. Arc, Cris, Hexagon, ia64, Parisc, Score and
 > Xtensa), the Linux buildsystem tries to call the cross-compiler when
 > installing the headers.

 > This is a spurious call, since a cross-compiler is not needed at all to
 > install the headers.

 > As some users have reported the issue, just add a comment in linux-headers.mk
 > directing the user to ignore those errors.

 > Reported-by: Noam Camus <noamc@ezchip.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

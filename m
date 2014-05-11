From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 May 2014 23:17:30 +0200
Subject: [Buildroot] [PATCH v2] freetype: freetype-patch: depends on
	host-automake
In-Reply-To: <1399298902-19863-1-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Mon, 5 May 2014 16:08:22 +0200")
References: <1399298902-19863-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <87y4y86mmt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 > The "make freetype-patch" fails because does not found autogen.sh,
 > because autogen.sh available only for the configure stage.
 > To fix this add host-automake as a prerequisite to freetype-patch.

 > This change also fix the support to top-level parallel make.

 > Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
 > Cc: Samuel Martin <s.martin49@gmail.com>
 > ---
 > v2:
 >  - Add host-automake as a order-only-prerequisite because it is a
 >    phony target.

Committed, thanks.

-- 
Bye, Peter Korsgaard

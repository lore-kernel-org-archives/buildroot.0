From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Aug 2010 23:09:40 +0200
Subject: [Buildroot] [PATCH] pppd.mk installs radattr.so twice and omits
	radrealms.so
In-Reply-To: <1282245557.29366.8.camel@tr-pentomino> (Darcy Watkins's message
	of "Thu, 19 Aug 2010 12:19:17 -0700")
References: <1282245557.29366.8.camel@tr-pentomino>
Message-ID: <87aao5yvl7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Darcy" == Darcy Watkins <dwatkins@tranzeo.com> writes:

 Darcy> Hello,
 Darcy> In the pppd.mk (for pppd package) the radattr.so plugin (for radiua) is
 Darcy> installed twice (the second install overwriting the first) but the
 Darcy> radrealms.so plugin is omitted from the install.  This appears to be a
 Darcy> copy-paste error.

 Darcy> Below is patch that corrects this.

 Darcy> signed-off by: Darcy Watkins <dwatkins@tranzeo.com>

Committed, thanks!

-- 
Bye, Peter Korsgaard

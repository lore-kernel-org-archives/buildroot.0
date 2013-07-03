From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 03 Jul 2013 16:18:41 +0200
Subject: [Buildroot] [PATCHv3 ] python3: Port python2 patches to reduce
	the interpreter size
In-Reply-To: <20130703092041.GH2969@lukather> (Maxime Ripard's message of
 "Wed, 3 Jul 2013 11:20:41 +0200")
References: <1369816617-6315-1-git-send-email-maxime.ripard@free-electrons.com>
 <87obapxr4y.fsf@dell.be.48ers.dk>
 <CANxTyt52OPdj0gmCZ8narNkgSpAZahnWR_-iuTHTe+nvHsjvHQ@mail.gmail.com>
 <20130703092041.GH2969@lukather>
Message-ID: <874ncbrake.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> Hi Danomi,
 Maxime> On Mon, Jul 01, 2013 at 03:29:59PM -0400, Danomi Manchego wrote:
 >> I noticed that most the original python3-3.3-* patches got renamed to
 >> python3-*.  But one did not, python3-3.3-012-old-stdlib-cache.patch.  This
 >> feels like an oversight - was it supposed to be renamed, or deleted maybe?

 Maxime> Yeah, sorry, I somehow forgot to rename that patch.

 Maxime> Do you want to do it?

Yes, I'll rename it.

-- 
Bye, Peter Korsgaard

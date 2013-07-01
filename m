From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 01 Jul 2013 11:42:39 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	yem-misc-updates
In-Reply-To: <cover.1372545265.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 30 Jun 2013 00:38:11 +0200")
References: <cover.1372545265.git.yann.morin.1998@free.fr>
Message-ID: <87bo6mvcog.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Hello All!

 Yann> This two-patch series adds some cosmetics to the legacy menu.

 Yann> The first patch displays the removal date in the menuconfig, to show
 Yann> the user how old the legacy options he's using are.

 Yann> The second patch adds to the top-level comment, that legacy options
 Yann> will be removed at some point in the future, and that non-updated
 Yann> .config files may fail to build, or run, in unpredictable ways.

 Yann> If we do not intend to remove legacy options, let's just drop patch #2,
 Yann> of course.

I think we do, question is how soon? 6 months, 1 year?

They are not very expensive, so I suggest we keep them for 1 year.

Committed series, thanks.

-- 
Bye, Peter Korsgaard

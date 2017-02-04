From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 04 Feb 2017 09:23:26 +0100
Subject: [Buildroot] [PATCH 1/1] libuio: remove gettext dependency
In-Reply-To: <20170203213534.16429-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Fri, 3 Feb 2017 22:35:34 +0100")
References: <20170203213534.16429-1-patrickdepinguin@gmail.com>
Message-ID: <87wpd6z7nl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > The gettext dependency of libuio is only needed for internationalization of
 > messages in the lsuio program. Since the real purpose for libuio is the
 > library, the impact of gettext on build time is considered too large for the
 > benefit for those users that want to use lsuio.

 > Patch libuio to disable internationalization.
 > Previous statements related to gettext, makeinfo, ... are now no longer
 > needed.

Hmm, we don't like to maintain non-upstreamable patches like this. Have
you discussed this with upstream? Perhaps they would be OK with
something like a --disable-tools configure flag?

-- 
Bye, Peter Korsgaard

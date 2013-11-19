From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 19 Nov 2013 13:29:55 +0100
Subject: [Buildroot] [PATCH 2 of 2 for-2013.11] vim: add dependency to
	gettext if locale support is requested
In-Reply-To: <d39e6b9c7e577930b1c9.1384859750@argentina> (Thomas De
 Schampheleire's message of "Tue, 19 Nov 2013 12:15:50 +0100")
References: <patchbomb.1384859748@argentina>
 <d39e6b9c7e577930b1c9.1384859750@argentina>
Message-ID: <87li0kvakc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > Until now, if locale support was requested, vim would be built with NLS or
 > not depending on the build order. This patch now makes the dependency
 > explicit.

Committed, thanks.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Feb 2012 20:53:13 +0100
Subject: [Buildroot] [PATCH] e2fsprogs: disable build of e4defrag unless
	explicitly enabled
In-Reply-To: <1330428153-2484-1-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Tue, 28 Feb 2012 12:22:33 +0100")
References: <1330427777.2274.27.camel@sven>
 <1330428153-2484-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87k436enva.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> The e2fsprogs configure script enables the build of the e4defrag
 Sven> utility by default. Disable it unless BR2_PACKAGE_E2FSPROGS_E4DEFRAG
 Sven> is selected.

Committed to next, thanks.

-- 
Bye, Peter Korsgaard

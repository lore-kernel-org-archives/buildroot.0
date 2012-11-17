From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Nov 2012 09:31:10 +0100
Subject: [Buildroot] [PATCH] python: uses fork(),
	only available on MMU platforms
In-Reply-To: <1353139970-25414-1-git-send-email-maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Sat, 17 Nov 2012 09:12:50 +0100")
References: <1353139970-25414-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <874nkowrzl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> Fixes
 Maxime> http://autobuild.buildroot.org/results/1738a8b09b04d2b2fc1de6d1ff5eb0363fed6348/build-end.log

Committed, thanks. What about python3?

-- 
Bye, Peter Korsgaard

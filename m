From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 May 2014 22:02:43 +0200
Subject: [Buildroot] [PATCH] libenca: Move build host tool to
	PRE_BUILD_HOOKS
In-Reply-To: <1399296247-26320-1-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Mon, 5 May 2014 15:24:07 +0200")
References: <1399296247-26320-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87oaz8avj0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > The make_hash host tool, should be built during a PRE_BUILD_HOOKS and
 > not a POST_CONFIGURE_HOOKS.

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

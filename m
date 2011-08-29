From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 29 Aug 2011 22:38:35 +0200
Subject: [Buildroot] [PATCH 1/2] Fix the CodeSourcery ARM 2009q3
	toolchain use.
In-Reply-To: <1314633391-27020-1-git-send-email-maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Mon, 29 Aug 2011 17:56:31 +0200")
References: <1314633391-27020-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <87y5ycneb8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> The prefix is not set when selecting this toolchain, resulting in a
 Maxime> build failure.

Committed, thanks.

-- 
Bye, Peter Korsgaard

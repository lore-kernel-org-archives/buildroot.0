From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Jul 2011 10:17:31 +0200
Subject: [Buildroot] [PATCH 3/6] Remove quirk for older busybox not
	supported any more
In-Reply-To: <1309355181-21048-3-git-send-email-maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Wed, 29 Jun 2011 15:46:18 +0200")
References: <1309355181-21048-3-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <87hb721muc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> This code is no longer useful, since the older version supported by
 Maxime> Builroot is 1.16.

Committed, thanks. The fix was actually related to uClibc 0.9.29, but
I'm removing that now.

-- 
Bye, Peter Korsgaard

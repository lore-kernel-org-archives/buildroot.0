From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Feb 2017 23:27:36 +0100
Subject: [Buildroot] [PATCH] Revert "reproducible: fix DATE/TIME macros
	in toolchain-wrapper"
In-Reply-To: <1487610991-12814-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 20 Feb 2017 18:16:31 +0100")
References: <1487610991-12814-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87mvdgpkfb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > This reverts commit 76838f63412a30a358210e457dda4b79f7730624.
 > The commit referenced above explicitly states that the function was
 > copied as-is from the gcc source code at the time. And indeed that is
 > exactly how the function appeared in gcc in commit
 > e3e8c48c4a494d9da741c1c8ea6c4c0b7c4ff934.

 > However, our toolchain wrapper is "GPLv2 only", while the file this
 > function was copied from is "GPLv3 or later". As such we can't get that
 > function.

 > Furthermore, the code is far from optimum.

 > Since this feature is not release-critical, revert it until we do
 > re-implement it.

Reworded slightly and committed, thanks.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 17 Jan 2014 21:56:41 +0100
Subject: [Buildroot] [PATCH] Revert "prevent recursion in %_defconfig
	rules"
In-Reply-To: <1389982376-18064-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 17 Jan 2014 19:12:56 +0100")
References: <1389982376-18064-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87a9eunx86.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > This reverts commit 94dd02f5d0ce89549a82a99c56602e1c4a73bae7.

 > The change breaks defconfigs from BR2_EXTERNAL, both for in-tree and
 > out-of-tree builds.

 > Besides, the problem reported in 94dd02f could not be reproduced.

 > I can read French, and I suspect a relative path was used for either
 > BR2_EXTERNAL or O.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: J?r?my Rosen <jeremy.rosen@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard

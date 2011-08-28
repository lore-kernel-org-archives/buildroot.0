From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Aug 2011 10:43:43 +0200
Subject: [Buildroot] [PATCH 0/2] Update crostool-NG backend
In-Reply-To: <1314479263-8979-1-git-send-email-yann.morin.1998@anciens.enib.fr>
 (Yann E. MORIN's message of "Sat, 27 Aug 2011 23:07:41 +0200")
References: <1314479263-8979-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87k49yori8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> Hello All!
 Yann> This short patch series updates the crosstool-NG backend in two ways:
 Yann>  - patch 2 is the simple one, and  updates to 1.12.1, which has a few
 Yann>    fixes since 1.12.0

 Yann>  - patch 1 is in itself quite simple, but the reasoning behind it is a
 Yann>    bit more complex, and gave me a headache for a few evenings before I
 Yann>    could pin-point the issue. More explanation in the patch description.

 Yann>    Of course, this would require much more love to properly fix, but not
 Yann>    that close to a release. Hopefully, we can use the dev day in Prague
 Yann>    to disguss the issue.

 Yann>    [PATCH 1/2] toolchain/crosstool-NG: fix bundled config files
 Yann>    [PATCH 2/2] package/crosstool-NG: update version to 1.12.1

Committed both, thanks!

-- 
Bye, Peter Korsgaard

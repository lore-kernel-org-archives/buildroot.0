From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Jul 2013 15:32:18 +0200
Subject: [Buildroot] [PATCHv3 13/14] uclibc: add Thumb2 fixes
In-Reply-To: <1373961805-3901-14-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 16 Jul 2013 10:03:24 +0200")
References: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373961805-3901-14-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k3kqzl3x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This commit adds three patches to uClibc that are needed to make
 Thomas> Thumb2 support work properly:

 Thomas>  uclibc-0006-arm-clone-restore-stack-pointer-just-after-return-fr.patch
 Thomas>  uclibc-0007-arm-clone.S-Add-missing-IT-instruction-for-Thumb2.patch
 Thomas>  uclibc-0008-arm-move-check-for-BX-to-its-own-header.patch

 Thomas> The first one is a necessary dependency of the second one. Both of
 Thomas> those patches have already been merged upstream, after 0.9.33.2. The
 Thomas> third one hasn't been merged upstream yet, but it has already been
 Thomas> submitted a while ago by Yann E. Morin, without receiving attention
 Thomas> from upstream.

Committed, thanks.

-- 
Bye, Peter Korsgaard

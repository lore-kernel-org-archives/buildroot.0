From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 27 Aug 2011 23:07:41 +0200
Subject: [Buildroot] [PATCH 0/2] Update crostool-NG backend
Message-ID: <1314479263-8979-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This short patch series updates the crosstool-NG backend in two ways:
 - patch 2 is the simple one, and  updates to 1.12.1, which has a few
   fixes since 1.12.0

 - patch 1 is in itself quite simple, but the reasoning behind it is a
   bit more complex, and gave me a headache for a few evenings before I
   could pin-point the issue. More explanation in the patch description.

   Of course, this would require much more love to properly fix, but not
   that close to a release. Hopefully, we can use the dev day in Prague
   to disguss the issue.

   [PATCH 1/2] toolchain/crosstool-NG: fix bundled config files
   [PATCH 2/2] package/crosstool-NG: update version to 1.12.1

Regards,
Yann E. MORIN.

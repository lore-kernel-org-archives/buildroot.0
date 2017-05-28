From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 May 2017 15:37:50 +0200
Subject: [Buildroot] [PATCH] package/firejail: mark as broken
References: <1489325570-3550-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <ee0rvdxfme.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 12 Mar 2017 14:32:50 +0100 schrieb Yann E. MORIN:

> If the package is not fixed before 2017.05-rc1, we will remove it
> altogether (as it was never part of an official release so far).

Hi,

what about removing the package on master branch before releasing 2017.05?
FYI: version 0.9.46 still has no cross-compile support.

Regards, Bernd

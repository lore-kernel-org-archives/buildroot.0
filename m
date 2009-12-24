From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu, 24 Dec 2009 01:35:11 +0100
Subject: [Buildroot] [PATCH 0/5] package: add efl librairies
Message-ID: <1261614916-8219-1-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the (not so) recent activity around e17 and the new snapshot
released earlier this month, people might get interested in the EFL
integration in buildroot.

Currently compiled/tested on directfb. Any comment/fix/test is welcome.
The libedje package depends on another patch on lua :
http://lists.busybox.net/pipermail/buildroot/2009-December/031334.html

 [PATCH 1/5] efl: added libeet package
 [PATCH 2/5] efl: added libevas package
 [PATCH 3/5] efl: added libecore package
 [PATCH 4/5] efl: added libembryo package
 [PATCH 5/5] efl: added libedje package

Regards,

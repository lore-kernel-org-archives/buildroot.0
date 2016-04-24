From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Apr 2016 21:16:27 +0200
Subject: [Buildroot] [PATCH] package/yajl: fix build when explicit link
 with	libm is needed
References: <1461522578-25792-1-git-send-email-s.martin49@gmail.com>
Message-ID: <blivucxj3a.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 24 Apr 2016 20:29:38 +0200 schrieb Samuel Martin:

> This change adds another fix to the yajl build-system code.

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(compile-tested using gcc6/uclibc-ng)

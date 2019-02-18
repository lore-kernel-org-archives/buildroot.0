From: David PICARD <dplamp@gmx.com>
Date: Mon, 18 Feb 2019 16:09:41 +0100
Subject: [Buildroot] minicom aborts
Message-ID: <trinity-76e60e04-b256-49e6-9a96-952ff2003124-1550502581474@3c-app-mailcom-bs08>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
?
When I try to start minicom, some test fails, and minicom quits straight away :

# minicom
minicom: minicom.c: 1041: test_mbswidth: Assertion `mbswidth(e[i].s) == e[i]._mbswidth || mbswidth(e[i].s) == e[i]._mbswidth_kaputt' failed.
Aborted
?
The minicom.c file can be found here :
https://salsa.debian.org/minicom-team/minicom/blob/master/src/minicom.c
?
My only locale is "C".
?
I'm not sure if it's a bug in minicom or if something is missing on my system.
?
- David

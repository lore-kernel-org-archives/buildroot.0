From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Sun, 19 Sep 2010 10:21:13 +0200
Subject: [Buildroot] ready for testing util-linux-NG and xfsprogs 3.1.3
Message-ID: <1284884475-2390-1-git-send-email-marcus.osdoba@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi mailinglist,
Please find attached a new version of util-linux-ng and xfsprogs.
I have tested both on my target (seagatedockstar armv5te LE).
Both are working fine (despite the fact, that xfs itself is not stable on ARM).

Feel free to test both patches.

They work independantly from each other. So you won't have to upgrade
to util-linux-ng if you like to test xfsprogs. I tested tested xfsprogs
with both configurations -
including libuuid from e2fsprogs respectively from util-linux-NG.

Let me know what do you think about it and what needs to be refactored 
for inclusion into upcoming 2010.11.

Regards,
Marcus

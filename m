From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  8 Oct 2010 06:09:20 +0000 (UTC)
Subject: [Buildroot] [Bug 2557] [PATCH] mkfs.xfs complains about missing
	libxfs.so.0
In-Reply-To: <bug-2557-163@https.bugs.busybox.net/>
References: <bug-2557-163@https.bugs.busybox.net/>
Message-ID: <20101008060920.66DEA8C062@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2557

--- Comment #2 from Ossy <marcus.osdoba@googlemail.com>  ---
Created attachment 2575
  --> https://bugs.busybox.net/attachment.cgi?id=2575
xfsprogs 3.1.3 may use util-linux-ng

converts to autotargets and uses libuuid

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

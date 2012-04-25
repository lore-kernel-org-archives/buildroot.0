From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 25 Apr 2012 15:40:54 +0000 (UTC)
Subject: [Buildroot] [Bug 5102] qt package moc, uic,
	rcc read from wrong place
In-Reply-To: <bug-5102-163@https.bugs.busybox.net/>
References: <bug-5102-163@https.bugs.busybox.net/>
Message-ID: <20120425154054.AC27D96BBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5102

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-04-25 15:40:54 UTC ---
I think you're using the wrong qmake. You should be executing the qmake from
output/host/usr/bin/qmake.

I'll try to find the source code of your example and build it.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

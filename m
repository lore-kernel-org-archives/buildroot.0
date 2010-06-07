From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Jun 2010 14:48:25 +0000 (UTC)
Subject: [Buildroot] [Bug 1711] Should libtool package install ltmain.sh
	into staging ?
In-Reply-To: <bug-1711-163@https.bugs.busybox.net/>
References: <bug-1711-163@https.bugs.busybox.net/>
Message-ID: <20100607144825.A357682BDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1711

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
So you're suggesting to replace package/buildroot-libtool.patch by a copy of a
"sane" ltmain.sh ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

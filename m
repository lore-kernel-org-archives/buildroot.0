From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  5 Jan 2014 22:31:33 +0000 (UTC)
Subject: [Buildroot] [Bug 6752] genext2fs: e2fsck must run before tunefs -U
	random
In-Reply-To: <bug-6752-163@https.bugs.busybox.net/>
References: <bug-6752-163@https.bugs.busybox.net/>
Message-ID: <20140105223133.12B489C37C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6752

--- Comment #5 from Daniel Mentz <daniel@exxm.de> 2014-01-05 22:31:32 UTC ---
Created attachment 5156
  --> https://bugs.busybox.net/attachment.cgi?id=5156
This commit to e2fsprogs probably broke buildroot

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  5 Jan 2014 22:19:58 +0000 (UTC)
Subject: [Buildroot] [Bug 6752] genext2fs: e2fsck must run before tunefs -U
	random
In-Reply-To: <bug-6752-163@https.bugs.busybox.net/>
References: <bug-6752-163@https.bugs.busybox.net/>
Message-ID: <20140105221958.A725B9C3D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6752

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> 2014-01-05 22:19:58 UTC ---
Hmm, it seems that indeed ext4 is broken since the last bump
of e2fsprogs.

Thanks for the report, I'll investigate.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

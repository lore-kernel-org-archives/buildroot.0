From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Oct 2013 22:05:24 +0000 (UTC)
Subject: [Buildroot] [Bug 5780] spurious build failure because it cannot
 remove ubinize.cfg
In-Reply-To: <bug-5780-163@https.bugs.busybox.net/>
References: <bug-5780-163@https.bugs.busybox.net/>
Message-ID: <20131030220524.5FA4B9BC3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5780

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-10-30 22:05:24 UTC ---
This would be fixed if we decide to commit:

Subject: [Buildroot] [PATCH v2] fs/ubi: add option to use custom ubinize config
file
Date: Sun, 15 Sep 2013 21:04:07 -0400

http://patchwork.ozlabs.org/patch/275088/

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

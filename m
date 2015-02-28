From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 28 Feb 2015 15:55:46 +0000 (UTC)
Subject: [Buildroot] [Bug 7892] systemd-journald is broken
In-Reply-To: <bug-7892-163@https.bugs.busybox.net/>
References: <bug-7892-163@https.bugs.busybox.net/>
Message-ID: <20150228155546.2CB028057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7892

--- Comment #6 from nroach44 at gmail.com 2015-02-28 15:55:45 UTC ---
Reverting d380dde1d2878bd8f09317081960bfc82b0f420b and
c6ca6fc9a3714842485618676390aba114442511 fixes the issue.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

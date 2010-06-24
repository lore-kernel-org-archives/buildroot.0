From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Jun 2010 14:05:36 +0000 (UTC)
Subject: [Buildroot] [Bug 2101] blackbox depends on locale support
In-Reply-To: <bug-2101-163@https.bugs.busybox.net/>
References: <bug-2101-163@https.bugs.busybox.net/>
Message-ID: <20100624140536.B099681D7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2101

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Instead, we should do like samba: add a dependency on libiconv if locale aren't
enabled.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

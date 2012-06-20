From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 20 Jun 2012 07:00:41 +0000 (UTC)
Subject: [Buildroot] [Bug 5318] Grub requires package rxvt to configure
In-Reply-To: <bug-5318-163@https.bugs.busybox.net/>
References: <bug-5318-163@https.bugs.busybox.net/>
Message-ID: <20120620070041.E5F1083686@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5318

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-06-20 07:00:41 UTC ---
It very likely instead related to a dependency on rxvt, it would make no sense
for grub to depend on rxvt. The problem must be a might more complicated than
that, I'd say.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

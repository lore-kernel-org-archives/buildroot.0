From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 08:52:11 +0000 (UTC)
Subject: [Buildroot] [Bug 5180] External toolchain path should accept
	relative paths
In-Reply-To: <bug-5180-163@https.bugs.busybox.net/>
References: <bug-5180-163@https.bugs.busybox.net/>
Message-ID: <20130526085211.229469A56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5180

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-05-26 08:51:00 UTC ---
This is something you can already do today:

BR2_TOOLCHAIN_EXTERNAL_PATH="$(TOPDIR)/../../x-tools/linaro-2012.09/"

Just tested, it works.

I'm marking this bug as "works for me", but if you believe the proposed
solution is not appropriate, do not hesitate to re-open the bug and add more
details.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

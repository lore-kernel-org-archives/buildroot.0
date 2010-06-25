From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 25 Jun 2010 12:05:42 +0000 (UTC)
Subject: [Buildroot] [Bug 1741] external toolchain linking error
In-Reply-To: <bug-1741-163@https.bugs.busybox.net/>
References: <bug-1741-163@https.bugs.busybox.net/>
Message-ID: <20100625120542.18F2081DD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1741

--- Comment #8 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Can you post the .config you used for both builds (i.e the Buildroot that
builds the toolchain, and the Buildroot that builds the system using the
previously built toolchain) ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 21 May 2010 12:37:46 +0000 (UTC)
Subject: [Buildroot] [Bug 1759] qt.mk stops build to prompts user
In-Reply-To: <bug-1759-163@https.bugs.busybox.net/>
References: <bug-1759-163@https.bugs.busybox.net/>
Message-ID: <20100521123747.04DB59C5EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1759

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
We already have the BR2_PACKAGE_QT_LICENSE_APPROVED option that automatically
approves the license. Was this option set in your configuration ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

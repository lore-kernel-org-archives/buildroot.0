From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  1 Mar 2011 14:05:19 +0000 (UTC)
Subject: [Buildroot] [Bug 3349] host-module-init-tools-3.12 fails on Fedora
 13 with buildroot-2011.02-rc2
In-Reply-To: <bug-3349-163@https.bugs.busybox.net/>
References: <bug-3349-163@https.bugs.busybox.net/>
Message-ID: <20110301140519.C51F58D329@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3349

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
This is a FAQ. See http://buildroot.org/downloads/buildroot.html#faq. You have
to install glibc-static.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

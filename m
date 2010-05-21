From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 21 May 2010 14:30:03 +0000 (UTC)
Subject: [Buildroot] [Bug 1729] alsamixergui fails to build
In-Reply-To: <bug-1729-163@https.bugs.busybox.net/>
References: <bug-1729-163@https.bugs.busybox.net/>
Message-ID: <20100521143003.5A67612E280@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1729

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
I have just sent a pull request on the Buildroot mailing list with a patch
fixing this problem. With the proposed fix, FLTK now builds fine, which allows
alsamixergui to build correctly.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

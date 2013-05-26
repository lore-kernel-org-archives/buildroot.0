From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 14:13:59 +0000 (UTC)
Subject: [Buildroot] [Bug 4988] flex and m4 problems
In-Reply-To: <bug-4988-163@https.bugs.busybox.net/>
References: <bug-4988-163@https.bugs.busybox.net/>
Message-ID: <20130526141359.311B89A326@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4988

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-05-26 14:12:49 UTC ---
Thanks, I've adapted your patches 1 and 2 to the latest Buildroot (after doing
some minor improvements). However, your patch 3 was not necessary here. Maybe
some other change in flex had fixed the problem.

I'm marking the bug as fixed, I will send the patch later today on the mailing
list.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

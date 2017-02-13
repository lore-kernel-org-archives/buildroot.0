From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 13 Feb 2017 20:46:47 +0000
Subject: [Buildroot] [Bug 9291] perl: SysV message queues not configured,
 even if available
In-Reply-To: <bug-9291-163@https.bugs.busybox.net/>
References: <bug-9291-163@https.bugs.busybox.net/>
Message-ID: <bug-9291-163-IRjw7EEz95@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9291

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This issue has been fixed in perl-cross by commit
https://github.com/arsv/perl-cross/commit/c707e92c99c9d468c490bf8aed0df95941da9c5c,
which is in perl-cross since version 1.1.2, and Buildroot is currently using
perl-cross 1.1.3.

Therefore, this bug is now fixed.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

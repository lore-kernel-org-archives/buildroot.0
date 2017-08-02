From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 02 Aug 2017 19:07:57 +0000
Subject: [Buildroot] [Bug 7892] systemd-journald is broken
In-Reply-To: <bug-7892-163@https.bugs.busybox.net/>
References: <bug-7892-163@https.bugs.busybox.net/>
Message-ID: <bug-7892-163-6wW17fAxvc@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7892

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #26 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
The patch series from Yann that allows to have a systemd specific skeleton, and
proper support for systemd on a read-only filesystem has been merged. Hence
this bug is now fixed. Thanks a lot Yann for the work. Thanks to Arnout for the
final polish. Thanks Andrey for the testing!

-- 
You are receiving this mail because:
You are on the CC list for the bug.

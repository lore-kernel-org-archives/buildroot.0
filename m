From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Jan 2020 17:44:25 +0000
Subject: [Buildroot] [Bug 12481] minicom fails when output directory path
 contains "m4"
In-Reply-To: <bug-12481-163@https.bugs.busybox.net/>
References: <bug-12481-163@https.bugs.busybox.net/>
Message-ID: <bug-12481-163-tjBXPL8RvB@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12481

Giulio Benetti <giulio.benetti@benettiengineering.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #7 from Giulio Benetti <giulio.benetti@benettiengineering.com> ---
I've opened a PR to fix it:
https://github.com/sabotage-linux/gettext-tiny/pull/49

This solves the bug.
I'm going to send the patch to Buildroot ML.

Heiko, can you please check if this patch solve the problem?

Thank you

-- 
You are receiving this mail because:
You are on the CC list for the bug.

From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Dec 2019 21:39:24 +0000
Subject: [Buildroot] [Bug 11766] Console (getty) issues with systemd
In-Reply-To: <bug-11766-163@https.bugs.busybox.net/>
References: <bug-11766-163@https.bugs.busybox.net/>
Message-ID: <bug-11766-163-Khqd63iv2I@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11766

Carlos Santos <unixmania@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |NEEDINFO
             Status|REOPENED                    |RESOLVED

--- Comment #7 from Carlos Santos <unixmania@gmail.com> ---
(In reply to Simon from comment #6)

This bug was open aiming a problem with the Raspberry Pi 3 board. Please don't
reopen old bugs just because they are similar to your current problem.

If you are using systemd just don't select BR2_TARGET_GENERIC_GETTY and no
serial-console@<console>.service will be created.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 18 Apr 2020 21:40:23 +0000
Subject: [Buildroot] [Bug 12786] Systemd spawns two getty processes when the
 getty port is set to console
In-Reply-To: <bug-12786-163@https.bugs.busybox.net/>
References: <bug-12786-163@https.bugs.busybox.net/>
Message-ID: <bug-12786-163-NjIGVZQK27@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12786

--- Comment #1 from Matt Weber <matthew.weber@rockwellcollins.com> ---
 I can confirm I see similar with aarch64 build using master.  I noticed it is
possible to login and run commands you just have to keep escaping the new getty
:-)

-- 
You are receiving this mail because:
You are on the CC list for the bug.

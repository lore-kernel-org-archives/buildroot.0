From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 11 Feb 2016 16:59:05 +0000
Subject: [Buildroot] [Bug 8681] kbd 2.0.3 does not build on rpi
In-Reply-To: <bug-8681-163@https.bugs.busybox.net/>
References: <bug-8681-163@https.bugs.busybox.net/>
Message-ID: <bug-8681-163-UyfvvfXhZ2@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8681

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for reporting the issue. It should be fixed with commit
https://git.busybox.net/buildroot/commit/?id=9f81bad770304871177c16147fc150a1998ee4cc.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

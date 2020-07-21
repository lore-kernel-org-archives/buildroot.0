From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 21 Jul 2020 12:52:56 +0000
Subject: [Buildroot] [Bug 13101] BR audit2allow support
In-Reply-To: <bug-13101-163@https.bugs.busybox.net/>
References: <bug-13101-163@https.bugs.busybox.net/>
Message-ID: <bug-13101-163-9VdVshr9lk@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13101

Tomas V Arredondo <surf_fanatico@yahoo.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Priority|P5                          |P2
           Severity|normal                      |major

--- Comment #1 from Tomas V Arredondo <surf_fanatico@yahoo.com> ---
This essentially blocks new policy creation as auditwallow is critical to
selinux.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

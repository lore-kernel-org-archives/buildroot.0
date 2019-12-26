From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 26 Dec 2019 20:05:59 +0000
Subject: [Buildroot] [Bug 12121] PyQt5.QtSerialPort and other modules not
 being built.
In-Reply-To: <bug-12121-163@https.bugs.busybox.net/>
References: <bug-12121-163@https.bugs.busybox.net/>
Message-ID: <bug-12121-163-CD7yYhUApw@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12121

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for the bug report. This has been fixed in commit
https://git.buildroot.org/buildroot/commit/?id=2320dec34c87d28ab7ab3f445e3f6e429023f01f.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

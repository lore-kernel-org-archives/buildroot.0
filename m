From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 06 Nov 2017 09:45:30 +0000
Subject: [Buildroot] [Bug 10361] python3 python-config script generates
 invalid includes
In-Reply-To: <bug-10361-163@https.bugs.busybox.net/>
References: <bug-10361-163@https.bugs.busybox.net/>
Message-ID: <bug-10361-163-JmZty8rnCB@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10361

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=04d1699ba4cecaa77f688b4effbcac5e84419b15

-- 
You are receiving this mail because:
You are on the CC list for the bug.

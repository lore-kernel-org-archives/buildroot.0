From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 Oct 2016 21:43:47 +0000
Subject: [Buildroot] [Bug 8811] rp-pppoe - generated scripts commands use
 HOST pathnames, not necessarily TARGET
In-Reply-To: <bug-8811-163@https.bugs.busybox.net/>
References: <bug-8811-163@https.bugs.busybox.net/>
Message-ID: <bug-8811-163-yVYiBbUFWN@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8811

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=cebf8219f319d1153fa10a1d43d02577bff5b966

-- 
You are receiving this mail because:
You are on the CC list for the bug.

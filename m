From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 15 Sep 2019 13:59:19 +0000
Subject: [Buildroot] [Bug 12141] eudev package is missing "render" and "kvm"
 groups
In-Reply-To: <bug-12141-163@https.bugs.busybox.net/>
References: <bug-12141-163@https.bugs.busybox.net/>
Message-ID: <bug-12141-163-IwZOiCeIGj@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12141

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=0aa66343184676482b0d77446614e332ee5ccd99.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.

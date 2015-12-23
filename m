From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 Dec 2015 17:48:59 +0000
Subject: [Buildroot] [Bug 8296] nodejs 0.12.7 - npm crashes (seg core dump)
In-Reply-To: <bug-8296-163@https.bugs.busybox.net/>
References: <bug-8296-163@https.bugs.busybox.net/>
Message-ID: <bug-8296-163-c4VGuUWYkI@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8296

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #9 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.busybox.net/buildroot/commit/?id=5bba3ca130249a2557f250095ccfccb6aadb8576.
Thanks Martin!

-- 
You are receiving this mail because:
You are on the CC list for the bug.

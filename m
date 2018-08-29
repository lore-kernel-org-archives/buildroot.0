From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Aug 2018 20:07:19 +0000
Subject: [Buildroot] [Bug 11241] ACPID shouldn't depend on BR2_x86_64 ||
 BR2_i386
In-Reply-To: <bug-11241-163@https.bugs.busybox.net/>
References: <bug-11241-163@https.bugs.busybox.net/>
Message-ID: <bug-11241-163-Mp3gA1iIr6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11241

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?h=next&id=1bcc6e87410c76efb2f4bdd9714916acef84b7d0.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.

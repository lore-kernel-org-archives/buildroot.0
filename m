From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 17 Dec 2019 15:38:59 +0000
Subject: [Buildroot] [Bug 12411] Kernel zImage is actually a uImage
In-Reply-To: <bug-12411-163@https.bugs.busybox.net/>
References: <bug-12411-163@https.bugs.busybox.net/>
Message-ID: <bug-12411-163-TLotE7YfSI@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12411

Bradley Gamble <bradley.gamble@ncipher.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #2 from Bradley Gamble <bradley.gamble@ncipher.com> ---
Looks like this is actually a bug specific to the Linux kernel rather than
Buildroot - I've created a separate a bug in their Bugzilla stream with more
details.
https://bugzilla.kernel.org/show_bug.cgi?id=205889

-- 
You are receiving this mail because:
You are on the CC list for the bug.

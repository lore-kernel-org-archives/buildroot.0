From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 13 Apr 2019 15:13:32 +0000
Subject: [Buildroot] [Bug 11761] Building custom kernel 5.1-rc3 or later
 breaks on tools/objtool
In-Reply-To: <bug-11761-163@https.bugs.busybox.net/>
References: <bug-11761-163@https.bugs.busybox.net/>
Message-ID: <bug-11761-163-0HV7ABQKFN@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11761

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #2 from Arnout Vandecappelle <arnout@mind.be> ---
Fixed by commit 615e2edc2ae8351519448d1965f0c4eec4e793b1. Please reopen if that
doesn't fix it for you.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

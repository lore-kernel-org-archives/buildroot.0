From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 30 Jun 2018 19:57:38 +0000
Subject: [Buildroot] [Bug 11121] statfs call corrupts memory struct statfs
 too small
In-Reply-To: <bug-11121-163@https.bugs.busybox.net/>
References: <bug-11121-163@https.bugs.busybox.net/>
Message-ID: <bug-11121-163-4QJElHLyIw@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11121

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for reporting the bug to upstream uClibc. I'll close the bug here, since
there isn't much we can do at the Buildroot level about this.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

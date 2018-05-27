From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 27 May 2018 21:49:48 +0000
Subject: [Buildroot] [Bug 11046] Git package binaries are ~180MB (compared
 to ~20MB in stable branches).
In-Reply-To: <bug-11046-163@https.bugs.busybox.net/>
References: <bug-11046-163@https.bugs.busybox.net/>
Message-ID: <bug-11046-163-0gSIIIvbMG@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11046

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #5 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed by:
https://git.buildroot.org/buildroot/commit/?id=065e7672e1e933f8b5257eddc9d1d8b7021a1687

-- 
You are receiving this mail because:
You are on the CC list for the bug.

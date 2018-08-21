From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 21 Aug 2018 07:12:34 +0000
Subject: [Buildroot] [Bug 11091] BR2_PRIMARY_SITE doesn't work (wget is
 selected every time as backend)
In-Reply-To: <bug-11091-163@https.bugs.busybox.net/>
References: <bug-11091-163@https.bugs.busybox.net/>
Message-ID: <bug-11091-163-ThcVIVkL0Y@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11091

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed by:
https://git.buildroot.org/buildroot/commit/?id=38de43412327b68de1943ead3fea512ec42be625

-- 
You are receiving this mail because:
You are on the CC list for the bug.

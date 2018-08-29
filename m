From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Aug 2018 20:10:06 +0000
Subject: [Buildroot] [Bug 11141] WF111 package no longer availabe
In-Reply-To: <bug-11141-163@https.bugs.busybox.net/>
References: <bug-11141-163@https.bugs.busybox.net/>
Message-ID: <bug-11141-163-J9kJjeMxiS@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11141

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This problem has been fixed by:

 (1) Adding the old tarballs in sources.buildroot.org (this is the fix for
2018.08)

 (2) Updating the wf111 version used on ARM in commit
https://git.buildroot.org/buildroot/commit/package/wf111?h=next&id=1e80bd9ec64ff4065f72ab0d47d863e87bf0580c
(this is going to be in 2018.11)

Thanks for the initial bug report!

-- 
You are receiving this mail because:
You are on the CC list for the bug.

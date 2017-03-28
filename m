From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 Mar 2017 20:35:41 +0000
Subject: [Buildroot] [Bug 9771] toolchain-external misses lib directory when
 copying sysroot
In-Reply-To: <bug-9771-163@https.bugs.busybox.net/>
References: <bug-9771-163@https.bugs.busybox.net/>
Message-ID: <bug-9771-163-tIKXhD35Ov@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9771

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
(In reply to Arnout Vandecappelle from comment #3)
Arnout, what makes you think those patches will fix the issue? From a quick
look at the toolchain, I don't see anything being in <sysroot>/lib/<variant>,
all libraries are in <sysroot>/lib64, which is the standard organization that
we should just support fine today.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

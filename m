From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 25 Apr 2016 22:05:36 +0000
Subject: [Buildroot] [Bug 8346] wf111 package removes all kernel module
	dependencies
In-Reply-To: <bug-8346-163@https.bugs.busybox.net/>
References: <bug-8346-163@https.bugs.busybox.net/>
Message-ID: <bug-8346-163-1CACYfGgcF@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8346

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.net/buildroot/commit/?id=eee68714a85b159050caecc2628fa349c4d9489e.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

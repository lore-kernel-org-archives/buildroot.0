From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Dec 2016 14:25:56 +0000
Subject: [Buildroot] [Bug 9526] Embedded NPM fails to start with "no such
 file or directory" error
In-Reply-To: <bug-9526-163@https.bugs.busybox.net/>
References: <bug-9526-163@https.bugs.busybox.net/>
Message-ID: <bug-9526-163-OzXrpZECdt@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9526

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
What is your ./post-build.sh script doing ?

Remember: we need to be able to reproduce the issues that you face, otherwise,
no way we can debug them.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

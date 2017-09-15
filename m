From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 15 Sep 2017 00:10:03 +0000
Subject: [Buildroot] [Bug 10316] Building grub fails on debian stretch
In-Reply-To: <bug-10316-163@https.bugs.busybox.net/>
References: <bug-10316-163@https.bugs.busybox.net/>
Message-ID: <bug-10316-163-bYqTck0Ol1@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10316

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
We now grub is broken, and Yann E. Morin has sent some patches to remove grub
from Buildroot (of course we would keep grub2). What is your use case for using
grub instead of grub2 ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.

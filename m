From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 03 Jun 2019 07:01:54 +0000
Subject: [Buildroot] [Bug 11926] Cross compiled Qt applications aren't
 working anymore
In-Reply-To: <bug-11926-163@https.bugs.busybox.net/>
References: <bug-11926-163@https.bugs.busybox.net/>
Message-ID: <bug-11926-163-Mxbe9aitDV@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11926

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Could you try reverting 951d438ddd212eb8163a67670383f2c86a8abc1b and see if it
helps ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.

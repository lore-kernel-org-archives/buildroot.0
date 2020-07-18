From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 18 Jul 2020 06:21:18 +0000
Subject: [Buildroot] [Bug 13081] host-e2fsprogs attempts to create udev
 rules.d on build host if not exists
In-Reply-To: <bug-13081-163@https.bugs.busybox.net/>
References: <bug-13081-163@https.bugs.busybox.net/>
Message-ID: <bug-13081-163-tcW1Ji4Wbw@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13081

--- Comment #2 from Christian Stewart <christian@paral.in> ---
Created attachment 8536
  --> https://bugs.busybox.net/attachment.cgi?id=8536&action=edit
hacky fix for e2fs progs writing to host system

-- 
You are receiving this mail because:
You are on the CC list for the bug.

From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 21 Feb 2016 09:36:07 +0000
Subject: [Buildroot] [Bug 8651] libMonoPosixHelper.so wrong link reference
 in buildroot image
In-Reply-To: <bug-8651-163@https.bugs.busybox.net/>
References: <bug-8651-163@https.bugs.busybox.net/>
Message-ID: <bug-8651-163-izi4etaPFO@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8651

--- Comment #9 from Angelo <angelo.compagnucci@gmail.com> ---
Created attachment 6336
  --> https://bugs.busybox.net/attachment.cgi?id=6336&action=edit
libmonoposixhelper location patch

Dear Markus Egle,

Could you try the attached patch?

Simply drop it into package/mono folder and rebuild mono.

Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.

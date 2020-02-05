From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 05 Feb 2020 15:40:24 +0000
Subject: [Buildroot] [Bug 11926] Cross compiled Qt applications aren't
 working anymore
In-Reply-To: <bug-11926-163@https.bugs.busybox.net/>
References: <bug-11926-163@https.bugs.busybox.net/>
Message-ID: <bug-11926-163-9Od71b2n82@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11926

--- Comment #6 from Martin <martinv1985@gmail.com> ---
I was having similar issues when compiling a image with qt for arm. Even
qtdiag, which was also build using buildroot, had the error that the EGL/GLES
libraries where linked using the absolute paths of the machine running
buildroot. However, when testing Qt version 5.14 this problem seems to be
resolved. The qtdiag works again and i can also compile and run one of the
example programs myself.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

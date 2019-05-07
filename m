From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 07 May 2019 16:57:56 +0000
Subject: [Buildroot] [Bug 11811] lsblk (util-linux) should depend on libudev
 if available
In-Reply-To: <bug-11811-163@https.bugs.busybox.net/>
References: <bug-11811-163@https.bugs.busybox.net/>
Message-ID: <bug-11811-163-iblnRmtX6F@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11811

--- Comment #9 from Carlos Santos <unixmania@gmail.com> ---
I just sent for review a patch that fixes the problem:

    https://patchwork.ozlabs.org/patch/1096436/

The solution requires a quite invasive patch to avoid building and installing
the util-linux libraries twice.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

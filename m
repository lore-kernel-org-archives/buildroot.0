From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 23 Feb 2021 06:25:01 +0000
Subject: [Buildroot] [Bug 13551] 2021.02.rc2: Unicode not work on qt 5.15.2
In-Reply-To: <bug-13551-163@https.bugs.busybox.net/>
References: <bug-13551-163@https.bugs.busybox.net/>
Message-ID: <bug-13551-163-uwFLF7hd5x@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13551

--- Comment #3 from Alfredo Pons Menargues <alfredo.pons@gmail.com> ---
You test is very good to reproduce the probem in a simple way.

In my Ubuntu 20.04 I get the same result as you. It's correct.


But in the buildroot image for rpi3 (2021.02.rc2) I get:

  $ ./test 2>&1 | hexdump -C

  00000000  3f 0a                                             |?.|
  00000002


I don't understand why this is happening.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

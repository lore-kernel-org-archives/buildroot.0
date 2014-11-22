From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 22 Nov 2014 08:51:17 +0000 (UTC)
Subject: [Buildroot] [Bug 7670] Fails to build mpc-1.0.2 on latest Cygwin
In-Reply-To: <bug-7670-163@https.bugs.busybox.net/>
References: <bug-7670-163@https.bugs.busybox.net/>
Message-ID: <20141122085117.C849F7FE2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7670

--- Comment #5 from Alexandr Zarubkin <me21@yandex.ru> 2014-11-22 08:51:14 UTC ---
I found the workaround: place original cygmpfr-4.dll (or link to it) to
/usr/lib/gcc/i686-pc-cygwin/4.8.3 directory. Then the build process continues.

Yann, Thomas, does the unsupported status of Cygwin mean that no bugs against
this build configuration should be created? Or may I create them with
workaround if I find one?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

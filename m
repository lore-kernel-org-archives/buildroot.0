From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 May 2019 12:58:33 +0000
Subject: [Buildroot] [Bug 11911] systemd v240 memory leak in
 systemd-journald (buildroot 2019.02 LTS affected)
In-Reply-To: <bug-11911-163@https.bugs.busybox.net/>
References: <bug-11911-163@https.bugs.busybox.net/>
Message-ID: <bug-11911-163-PhuNt68u82@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11911

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #5 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed in git by
https://git.buildroot.org/buildroot/commit/?id=ae43e724e84dde358320775ba7423619b78d1839,
thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.

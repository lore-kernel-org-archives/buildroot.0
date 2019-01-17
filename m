From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 17 Jan 2019 22:14:56 +0000
Subject: [Buildroot] [Bug 11576] Unable to start apache with event MPM on
 raspberry pi 3
In-Reply-To: <bug-11576-163@https.bugs.busybox.net/>
References: <bug-11576-163@https.bugs.busybox.net/>
Message-ID: <bug-11576-163-JFpnJ5YkpD@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11576

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=7a3b44f445ff82acdc7524e401148b16bfdd24ff
- Thanks

-- 
You are receiving this mail because:
You are on the CC list for the bug.

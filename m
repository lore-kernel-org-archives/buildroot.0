From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 26 Aug 2016 14:42:34 +0000
Subject: [Buildroot] [Bug 9196] raspberry pi 3 default build seem broken
In-Reply-To: <bug-9196-163@https.bugs.busybox.net/>
References: <bug-9196-163@https.bugs.busybox.net/>
Message-ID: <bug-9196-163-LSGbjo0uAY@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9196

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
I presume you mean does NOT allow you to login? On what interface are you
trying to login on? HDMI/keyboard or serial?

Thanks for the post-build report. I have now fixed it to work correctly when
systemd/no-init is used:

https://git.buildroot.net/buildroot/commit/?id=720b9095a6a9fb23c7a2d7d3e4dabbe6b5299b12

-- 
You are receiving this mail because:
You are on the CC list for the bug.

From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 02 Feb 2021 18:01:30 +0000
Subject: [Buildroot] [Bug 13506] BR2_PACKAGE_DHCPCD missing directory
 creation
In-Reply-To: <bug-13506-163@https.bugs.busybox.net/>
References: <bug-13506-163@https.bugs.busybox.net/>
Message-ID: <bug-13506-163-gncd0fc9V9@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13506

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed in git for 2020.11.x, thanks:
https://git.buildroot.org/buildroot/commit/?h=2020.11.x&id=41cbb88372601346aedc2e9f7ab379ff481d1a2f

-- 
You are receiving this mail because:
You are on the CC list for the bug.

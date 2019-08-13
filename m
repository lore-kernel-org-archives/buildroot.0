From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 13 Aug 2019 19:41:24 +0000
Subject: [Buildroot] [Bug 12096] tcpreplay: build fails if libdumbnet-dev is
 installed in the host
In-Reply-To: <bug-12096-163@https.bugs.busybox.net/>
References: <bug-12096-163@https.bugs.busybox.net/>
Message-ID: <bug-12096-163-MB4rcEY7S0@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12096

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=3a4b68278ab20aee6de80bc9001788c4558282d2
and
https://git.buildroot.org/buildroot/commit/?id=3cd991c226539316e0db94573780cf51261410f8

-- 
You are receiving this mail because:
You are on the CC list for the bug.

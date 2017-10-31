From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 31 Oct 2017 20:57:01 +0000
Subject: [Buildroot] [Bug 10451] libpcap 1.8.x and 1.7x does not compile on
	PPC
In-Reply-To: <bug-10451-163@https.bugs.busybox.net/>
References: <bug-10451-163@https.bugs.busybox.net/>
Message-ID: <bug-10451-163-63WoPnR37w@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10451

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WONTFIX

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I'm going to close this bug because this is not a Buildroot bug, but a gcc
issue.

However, I don't think we caught this issue with our autobuilders, which means
our coverage of PowerPC testing isn't great. Karl, would you mind reviewing
https://git.buildroot.org/buildroot/tree/support/config-fragments/autobuild and
see if the set of PowerPC configurations is relevant or not ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.

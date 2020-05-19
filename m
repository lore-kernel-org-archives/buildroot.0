From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 19 May 2020 21:43:50 +0000
Subject: [Buildroot] [Bug 12271] python-iptables runtime dependencies
In-Reply-To: <bug-12271-163@https.bugs.busybox.net/>
References: <bug-12271-163@https.bugs.busybox.net/>
Message-ID: <bug-12271-163-qY8LKrpeNh@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12271

Thomas Petazzoni <thomas.petazzoni@bootlin.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
This has been fixed by:

https://git.buildroot.org/buildroot/commit/?id=21b85bc56cdcf030cced57dea0f78cdce59912b8
https://git.buildroot.org/buildroot/commit/?id=90c18ab269c600ee7643f69212713ee3b74c38bd
https://git.buildroot.org/buildroot/commit/?id=52276cdda34aa986410626592031560bf64d788b

-- 
You are receiving this mail because:
You are on the CC list for the bug.

From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 27 Nov 2019 20:49:48 +0000
Subject: [Buildroot] [Bug 12316] tzdata fails to install with empty "default
 local time"
In-Reply-To: <bug-12316-163@https.bugs.busybox.net/>
References: <bug-12316-163@https.bugs.busybox.net/>
Message-ID: <bug-12316-163-WMcTUZzfp8@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12316

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=0fb87516a49629901f5fe280cd08c9fdcf0eea24.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.

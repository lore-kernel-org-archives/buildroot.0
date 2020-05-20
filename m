From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 20 May 2020 10:30:15 +0000
Subject: [Buildroot] [Bug 12876] nodejs fails to build when host-icu has
 been built before
In-Reply-To: <bug-12876-163@https.bugs.busybox.net/>
References: <bug-12876-163@https.bugs.busybox.net/>
Message-ID: <bug-12876-163-yqiN740zBo@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12876

Thomas Petazzoni <thomas.petazzoni@bootlin.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|putilimp.h **error**:       |nodejs fails to build when
                   |missing binary operator     |host-icu has been built
                   |before token "(" #elif      |before
                   |__has_builtin(__c11_atomic_ |
                   |load) && \                  |

-- 
You are receiving this mail because:
You are on the CC list for the bug.

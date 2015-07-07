From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  7 Jul 2015 15:47:15 +0000 (UTC)
Subject: [Buildroot] [Bug 8161] default /bin/sh symlink to busybox is full
 path and not relative
In-Reply-To: <bug-8161-163@https.bugs.busybox.net/>
References: <bug-8161-163@https.bugs.busybox.net/>
Message-ID: <20150707154715.E224380831@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8161

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-07-07 15:47:15 UTC ---
This was fixed in
http://git.buildroot.net/buildroot/commit/system?id=e26ec6e45cb4246353bb4b88fbe718212fc89c61/

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

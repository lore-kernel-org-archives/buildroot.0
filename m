From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Jul 2015 10:13:30 +0000 (UTC)
Subject: [Buildroot] [Bug 7682] Missing dependencies for NFS
In-Reply-To: <bug-7682-163@https.bugs.busybox.net/>
References: <bug-7682-163@https.bugs.busybox.net/>
Message-ID: <20150730101330.99C757FFD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7682

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-07-30 10:13:30 UTC ---
Fixed in
http://git.buildroot.net/buildroot/commit/package/nfs-utils?id=182520a8af734c735c4dbdff29dc07af1d615a0a.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

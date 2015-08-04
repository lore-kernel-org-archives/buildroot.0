From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  4 Aug 2015 19:01:11 +0000 (UTC)
Subject: [Buildroot] [Bug 8081] systemd init system: /tmp is not mode 1777
In-Reply-To: <bug-8081-163@https.bugs.busybox.net/>
References: <bug-8081-163@https.bugs.busybox.net/>
Message-ID: <20150804190111.98DA581E65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8081

Floris Bos <bos@je-eigen-domein.nl> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Floris Bos <bos@je-eigen-domein.nl> 2015-08-04 19:01:11 UTC ---
Issue with /tmp not being mode 1777 when systemd is used, is no longer
reproducible with recent buildroot from git.

Logging is still broken when systemd is used, but there is already bug 7892 for
that, so closing this.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

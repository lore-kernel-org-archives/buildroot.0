From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 Aug 2015 20:13:23 +0000 (UTC)
Subject: [Buildroot] [Bug 8276] package/dropbear: symlink resolution
	incorrect
In-Reply-To: <bug-8276-163@https.bugs.busybox.net/>
References: <bug-8276-163@https.bugs.busybox.net/>
Message-ID: <20150824201324.06EED7FCB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8276

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-08-24 20:13:23 UTC ---
Bug fixed by
http://git.buildroot.net/buildroot/commit/?id=29a0f0557984ccb299426712b71fee5abaaa2ca9.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

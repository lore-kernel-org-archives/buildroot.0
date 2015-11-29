From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 29 Nov 2015 23:02:29 +0000 (UTC)
Subject: [Buildroot] [Bug 8476] [lttng] Version 2.6.0 unusable with kernel
	v4.0.0
In-Reply-To: <bug-8476-163@https.bugs.busybox.net/>
References: <bug-8476-163@https.bugs.busybox.net/>
Message-ID: <20151129230229.8A1C281E41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8476

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-11-29 23:02:29 UTC ---
This is fixed by
http://git.buildroot.net/buildroot/commit/?h=next&id=c2be38b9e3bee22129b9da160a8d131ce4e1efac,
which will be part of the 2016.02 release. It was too late for this version
bump to be part of 2015.11.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

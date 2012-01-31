From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 31 Jan 2012 20:00:32 +0000 (UTC)
Subject: [Buildroot] [Bug 4454] There should be simple way to update image,
 when changing external fs skeleton
In-Reply-To: <bug-4454-163@https.bugs.busybox.net/>
References: <bug-4454-163@https.bugs.busybox.net/>
Message-ID: <20120131200032.0298890963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4454

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Severity|minor                       |enhancement

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-01-31 20:00:31 UTC ---
This is an enhancement request, not a bug.

For the moment, the recommended method is to use a post-build script that
modifies the target filesystem, rather than making changes to the root
filesystem skeleton. The post-build script is executed at every make
invocation, so it is much, much easier to use that the root filesystem skeleton
mechanism.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

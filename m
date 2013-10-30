From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Oct 2013 22:30:53 +0000 (UTC)
Subject: [Buildroot] [Bug 6404] Buildroot's coreutils 'uname -p' reports
 'Unknown' on recent ARM kernels
In-Reply-To: <bug-6404-163@https.bugs.busybox.net/>
References: <bug-6404-163@https.bugs.busybox.net/>
Message-ID: <20131030223054.07AAC9BC02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6404

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-10-30 22:30:53 UTC ---
This really is a coreutils upstream problem. Could you report this directly to
the coreutils developers? On Buildroot side, I believe we should drop
coreutils-uname.patch since it's really a feature patch, and it apparently has
no chance of making its way to the upstream.

Another option is to look for an updated version of this patch somewhere.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

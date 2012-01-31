From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 31 Jan 2012 22:42:37 +0000 (UTC)
Subject: [Buildroot] [Bug 4117] 2011.08: default config with qt + ssl.
	Linking fails
In-Reply-To: <bug-4117-163@https.bugs.busybox.net/>
References: <bug-4117-163@https.bugs.busybox.net/>
Message-ID: <20120131224237.2A79190962@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4117

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-01-31 22:42:36 UTC ---
The original problem is that statically linking with pthread doesn't work with
uClibc. It is a known problem, which has been discussed on the uClibc
mailing-list already:
http://lists.uclibc.org/pipermail/uclibc/2011-March/045109.html. I haven't
heard of it being fixed, though. As it is not a Buildroot bug, but a uClibc
bug, I will be closing this bug, and I encourage you to report the problem to
the uClibc people.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Sep 2011 10:00:20 +0000 (UTC)
Subject: [Buildroot] [Bug 1711] Should libtool package install ltmain.sh
	into staging ?
In-Reply-To: <bug-1711-163@https.bugs.busybox.net/>
References: <bug-1711-163@https.bugs.busybox.net/>
Message-ID: <20110918100020.7C77D8D5D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1711

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
I'm by far no libtool expert either, but the solution we have currently in
Buildroot, which consists in patching ltmain.sh seems to work quite well for
all the packages we have. That solution has been around for quite some time and
has been very stable. The number of libtool versions to handle is relatively
limited (three at the moment) and the different patches are very similar, so
the maintainance burden is really not a problem.

Therefore, I'd prefer to keep the libtool patching mechanism as it is today,
unless there are compelling reasons to change it (like a package not working in
the current mechanism).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Apr 2009 08:38:57 +0000 (UTC)
Subject: [Buildroot] [Bug 299] add shared-mime-info package
In-Reply-To: <bug-299-163@https.bugs.busybox.net/>
References: <bug-299-163@https.bugs.busybox.net/>
Message-ID: <20090429083857.5F7327646C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=299


Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #8 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2009-04-29 08:38:56 UTC ---
Ok, that makes sense.

FWIW, we already have update-mime-database in $(HOST_DIR) :

$ file build_arm/host_dir/usr/bin/update-mime-database 
build_arm/host_dir/usr/bin/update-mime-database: ELF 32-bit LSB executable,
Intel 80386, version 1 (SYSV), for GNU/Linux 2.6.8, dynamically linked (uses
shared libs), not stripped


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 28 Feb 2013 11:20:34 +0000 (UTC)
Subject: [Buildroot] [Bug 2245] nc needs to support -k (multiple listen) BSD
	extension
In-Reply-To: <bug-2245-163@https.bugs.busybox.net/>
References: <bug-2245-163@https.bugs.busybox.net/>
Message-ID: <20130228112034.95BE89ADCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2245

Denys Vlasenko <vda.linux@googlemail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #7 from Denys Vlasenko <vda.linux@googlemail.com> 2013-02-28 11:20:58 UTC ---
Fixed in git:

commit de6f14800675cd0401106876da81da7618de71c6
Author: Denys Vlasenko <vda.linux@googlemail.com>
Date:   Thu Feb 28 12:20:06 2013 +0100

    nc_bloaty: support -ll and -lk. Closes 2245

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

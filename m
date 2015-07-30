From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Jul 2015 10:09:12 +0000 (UTC)
Subject: [Buildroot] [Bug 7981] Target file system skeleton permissions
	hazard
In-Reply-To: <bug-7981-163@https.bugs.busybox.net/>
References: <bug-7981-163@https.bugs.busybox.net/>
Message-ID: <20150730100912.CAC6081E8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7981

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-07-30 10:09:12 UTC ---
The umask problem has been fixed by
http://git.buildroot.net/buildroot/commit/Makefile?id=bee5745ccc20be6dbba243b1f8af0d5c522923e8,
http://git.buildroot.net/buildroot/commit/Makefile?id=361d3573f5373618b2c566e250430269dd7200e5
and related commits.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

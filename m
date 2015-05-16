From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 May 2015 11:52:03 +0000 (UTC)
Subject: [Buildroot] [Bug 8111] 2015.05.rc2 LIBFOO_CONF_OPTS not working
In-Reply-To: <bug-8111-163@https.bugs.busybox.net/>
References: <bug-8111-163@https.bugs.busybox.net/>
Message-ID: <20150516115203.8ADF780D95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8111

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-05-16 11:52:03 UTC ---
Of course, <foo>_CONF_OPTS only affect target packages. You should use
HOST_<foo>_CONF_OPTS for host packages.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

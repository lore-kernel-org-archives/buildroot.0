From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  6 Jan 2015 20:18:42 +0000 (UTC)
Subject: [Buildroot] [Bug 7766] logrotate default gzip path is usually wrong
In-Reply-To: <bug-7766-163@https.bugs.busybox.net/>
References: <bug-7766-163@https.bugs.busybox.net/>
Message-ID: <20150106201842.56DC58079A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7766

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-01-06 20:18:42 UTC ---
(In reply to comment #5)

> should be:
> GZIP_CONF_OPT = --exec-prefix=/

Not in recent Buildroot versions. GZIP_CONF_OPTS is now the right variable.

I've applied Gustavo's patch, as
http://git.buildroot.net/buildroot/commit/?id=09d6597cb5ab326097533cd4be7b9764b960c930,
so I'm closing this bug.

Thanks Henrik and Gustavo!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

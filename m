From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 20 Jul 2010 10:59:30 +0000 (UTC)
Subject: [Buildroot] [Bug 2245] Netcat does not work due to incorrect
 assumptions about signed chars.
In-Reply-To: <bug-2245-163@https.bugs.busybox.net/>
References: <bug-2245-163@https.bugs.busybox.net/>
Message-ID: <20100720105930.9F51682B45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2245

--- Comment #5 from Peter Korsgaard <jacmet@uclibc.org>  ---
(In reply to comment #4)

> I've now got BSD netcat on my target anyway, the Debian patches to build it
> under Linux work pretty well for buildroot too.  I can submit the package if
> you are at all interested in having a third nc implementation in buildroot  ...

Thanks, but to be honest - Not really.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

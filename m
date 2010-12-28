From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 Dec 2010 22:52:11 +0000 (UTC)
Subject: [Buildroot] [Bug 2935] Ntpdate isn't installed
In-Reply-To: <bug-2935-163@https.bugs.busybox.net/>
References: <bug-2935-163@https.bugs.busybox.net/>
Message-ID: <20101228225211.431458EE38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2935

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
Hi,

I'm not quite following you. Do you want to add options to the ntp package to
allow installation of ntpdate and make ntpd optional? In that case you are
missing the Config.in changes in the patch.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

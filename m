From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 24 Apr 2011 06:22:03 +0000 (UTC)
Subject: [Buildroot] [Bug 3643] popt source url is not responding
In-Reply-To: <bug-3643-163@https.bugs.busybox.net/>
References: <bug-3643-163@https.bugs.busybox.net/>
Message-ID: <20110424062203.F325882A28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3643

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  ---
normally a missing / down upstream doesn't matter much, as buildroot then falls
back to sources.buildroot.net, which DOES have popt-1.15.tar.gz. Isn't that
working for you?

E.G.:

>>> popt 1.15 Downloading
--2011-04-24 08:19:48--  http://rpm5.org/files/popt/popt-1.15.tar.gz
Resolving rpm5.org... failed: Name or service not known.
wget: unable to resolve host address ?rpm5.org?
--2011-04-24 08:19:49--  http://sources.buildroot.net//popt-1.15.tar.gz
Resolving sources.buildroot.net... 88.198.64.109
Connecting to sources.buildroot.net|88.198.64.109|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 666242 (651K) [application/x-gzip]
Saving to: ?/var/lib/downloads/popt-1.15.tar.gz?

100%[======================================>] 666,242     1.36M/s   in 0.5s

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

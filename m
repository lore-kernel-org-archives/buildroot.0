From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 31 Jan 2012 22:45:43 +0000 (UTC)
Subject: [Buildroot] [Bug 2197] classpath should depends on IPv6
In-Reply-To: <bug-2197-163@https.bugs.busybox.net/>
References: <bug-2197-163@https.bugs.busybox.net/>
Message-ID: <20120131224543.2412090962@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2197

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-01-31 22:45:42 UTC ---
The classpath package has been removed by commit
b0bcafc6a0e03e5ee7506a051ebbb0b93c94941b because nobody was maintaining the
Java stuff in Buildroot. If you are interested in maintaining these packages,
we would be happy to resurect the packages and get your patches to make them
work properly.

In the mean time, I am closing this bug.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

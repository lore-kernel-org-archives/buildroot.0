From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 14 Dec 2010 11:03:17 +0000 (UTC)
Subject: [Buildroot] [Bug 561] ltp-testsuite failed to install
In-Reply-To: <bug-561-163@https.bugs.busybox.net/>
References: <bug-561-163@https.bugs.busybox.net/>
Message-ID: <20101214110317.A6DD58E2F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=561

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED
    Remaining Hours|0.3                         |0.0

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
The ltp-testsuite package has been updated and reworked by
http://git.buildroot.net/buildroot/commit/?id=a72a670489547a3ca645ff7c3a0d9c3fb66eab51,
and I have been able to successfully build it and run it.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

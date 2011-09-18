From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Sep 2011 09:46:03 +0000 (UTC)
Subject: [Buildroot] [Bug 605] [PATCH] Enhancement of libglib2 package
In-Reply-To: <bug-605-163@https.bugs.busybox.net/>
References: <bug-605-163@https.bugs.busybox.net/>
Message-ID: <20110918094603.298B78D5A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=605

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
The patch is way too old to properly apply. Moreover, the patch by itself isn't
sufficient, it would require checking all packages that are using libglib, and
find out which exact libraries from libglib they require.

rvpaasen, I will close this bug. But if you're still interested, please feel
free to submit an updated patch which takes into account the fact that all
users of libglib need to be verified.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

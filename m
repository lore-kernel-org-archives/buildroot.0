From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Jun 2015 01:08:36 +0000 (UTC)
Subject: [Buildroot] [Bug 7956] glibc 2.20 and 2.21 fail to build for
 sh64-buildroot-linux-gnu
In-Reply-To: <bug-7956-163@https.bugs.busybox.net/>
References: <bug-7956-163@https.bugs.busybox.net/>
Message-ID: <20150603010836.DCD3480794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7956

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-06-03 01:08:36 UTC ---
We've now marked sh64 as deprecated in Buildroot. According to the commit log:

    sh64: deprecate support for this dead architecture

    As discussed on the mailinglist, this should be deprecated
    before removal.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

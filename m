From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  5 Nov 2015 21:10:13 +0000 (UTC)
Subject: [Buildroot] [Bug 7772] libxml-parser-perl build failure: missing
 dependency ExtUtils/MakeMaker
In-Reply-To: <bug-7772-163@https.bugs.busybox.net/>
References: <bug-7772-163@https.bugs.busybox.net/>
Message-ID: <20151105211014.08A3181EEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7772

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #8 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-11-05 21:10:13 UTC ---
Vicente has suggested that we can close this bug. No-one else reported this
issue, as it seems on most distros the ExtUtils/MakeMaker Perl module is part
of the standard Perl installation. We can always revise that later if we get
more reports about this.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

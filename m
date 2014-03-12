From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Mar 2014 10:55:20 +0000 (UTC)
Subject: [Buildroot] [Bug 6956] New: Packaging libsoxr
Message-ID: <bug-6956-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6956

           Summary: Packaging libsoxr
           Product: buildroot
           Version: 2014.02
          Platform: All
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: prezi77 at wp.pl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Since 18.6 mpd has support for libsoxr. This is better and more efficient
re-sampling library for embedded systems. This is faster and smaller. I would
do it by myself but is uses cmake I don't understand. The best option would be
replacing libsamplerate with libsoxr or making them both available.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

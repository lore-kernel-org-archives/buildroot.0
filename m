From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  9 Feb 2014 19:00:51 +0000 (UTC)
Subject: [Buildroot] [Bug 6866] New: Ambiguous recommend method for
 customizing the generated target filesystem in Manual
Message-ID: <bug-6866-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6866

           Summary: Ambiguous recommend method for customizing the
                    generated target filesystem in Manual
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: All
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: jeffball55 at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5234
  --> https://bugs.busybox.net/attachment.cgi?id=5234
Rewords the two ambiguous sections to clarify.

The way I read Section 3.3.1 of the Manual (Customizing the generated target
filesystem) is ambiguous toward the recommended method.  In my interpretation,
the section recommends both a filesystem overlay (in bullet 2) and a post-build
script (in bullet 4).  

I've attached a short patch that I think clarifies this.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

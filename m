From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 13 Oct 2015 07:50:54 +0000 (UTC)
Subject: [Buildroot] [Bug 8396] New: CCACHE initialization
Message-ID: <bug-8396-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8396

           Summary: CCACHE initialization
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: All
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: sv99 at inbox.ru
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


In the Makefile 

372: ifeq ($(BR2_CCACHE),y)
373    CCACHE := $(HOST_DIR)/usr/bin/ccache

$(HOST_DIR) ???

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

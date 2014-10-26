From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 Oct 2014 17:58:00 +0000 (UTC)
Subject: [Buildroot] [Bug 7556] New: make interactive CLI optional for
	nftables
Message-ID: <bug-7556-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7556

           Summary: make interactive CLI optional for nftables
           Product: buildroot
           Version: 2014.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: alex at digriz.org.uk
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5744
  --> https://bugs.busybox.net/attachment.cgi?id=5744
patch to make nftables cli optional

nftables requires readline (and thus in turn ncurses) which adds considerably
to the size of the root filesystem (~500kB for MIPS).

Did a bit of work and we can now make it optional (by default it is not
enabled).

Is this patch reasonable, need me to do anything else to it for it to be
considered for buildroot.  I am also reaching out to the nftables team to see
about upstreaming this.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

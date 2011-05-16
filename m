From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 16 May 2011 19:37:40 +0000 (UTC)
Subject: [Buildroot] [Bug 3733] New: dropbear: make zlib optional
Message-ID: <bug-3733-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3733

           Summary: dropbear: make zlib optional
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Keywords: patch
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: alex at digriz.org.uk
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I noticed for my buildroot environment the only componment that was pulling in
zlib was dropbear.  The patch included drops the zlib dependency when compiling
with DROPBEAR_SMALL, pruning ~70kB for a LZO compressed root which is handy for
me with my 4MB NAND.

No idea if the patch is 'correct' by your standards but it gets my usual
stamps, 'seal of approval' and 'works for me'...

Cheers

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

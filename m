From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Mar 2011 04:43:59 +0000 (UTC)
Subject: [Buildroot] [Bug 3529] New: alsa-lib 1.0.24.1 build fails with
 daily snapshot (2011-03-29)
Message-ID: <bug-3529-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3529

           Summary: alsa-lib 1.0.24.1 build fails with daily snapshot
                    (2011-03-29)
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mjhammel at graphics-muse.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


make[4]: Entering directory
`/home/mjhammel/src/ximba/bb/bld/buildroot-snapshot/output/build/alsa-lib-1.0.24.1/src/ucm'
  CC     utils.lo
  CC     parser.lo
  CC     main.lo
parser.c: In function 'uc_mgr_scan_master_configs':
parser.c:1138: error: 'versionsort' undeclared (first use in this function)
parser.c:1138: error: (Each undeclared identifier is reported only once
parser.c:1138: error: for each function it appears in.)

I'm on Fedora 13, using an external Crosstool-NG 1.10.0 toolchain.

Tomorrow I'll try back-patching to 1.0.23 and see if that works.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

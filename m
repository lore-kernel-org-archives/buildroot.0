From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 16 Nov 2012 10:00:18 +0000 (UTC)
Subject: [Buildroot] [Bug 5690] New: python3 does not obey to
 BR2_PACKAGE_PYTHON3_PYC_ONLY=y
Message-ID: <bug-5690-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5690

           Summary: python3 does not obey to
                    BR2_PACKAGE_PYTHON3_PYC_ONLY=y
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: maxime.ripard at free-electrons.com
        ReportedBy: thomas.petazzoni at free-electrons.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Even though I have BR2_PACKAGE_PYTHON3_PYC_ONLY=y in my configuration, I have a
lot of *.py files in /usr/lib/python3.3/. The BR2_PACKAGE_PYTHON3_PY_ONLY,
BR2_PACKAGE_PYTHON3_PYC_ONLY and BR2_PACKAGE_PYTHON3_PY_PYC options should be
tested and fixed as needed.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

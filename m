From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 16 Nov 2012 10:01:59 +0000 (UTC)
Subject: [Buildroot] [Bug 5696] New: python3 installation is too large,
 patches from python2 needed
Message-ID: <bug-5696-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5696

           Summary: python3 installation is too large, patches from
                    python2 needed
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


Our Python 2 package has a bunch of patches (numbered 100 and above) that allow
to disable the build of a number of extensions that are not necessarily useful
in all situations. Those patches should be upgraded and added in our Python 3
package.

At the moment, the Python 3 installation takes 55 MB in /usr/lib/python3.3/,
which is way too much.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

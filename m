From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 18 Mar 2017 08:32:07 +0000
Subject: [Buildroot] [Bug 9751] New: expat legal info - manifest.csv: GPLv2
 Source site: MIT License (Buildroot 2017-02)
Message-ID: <bug-9751-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9751

            Bug ID: 9751
           Summary: expat legal info - manifest.csv: GPLv2 Source site:
                    MIT License (Buildroot 2017-02)
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: timo.valimaki at sensoan.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I started to make legal check to my Buildroot build - first time.

NAME=Buildroot
VERSION=2017.02
ID=buildroot
VERSION_ID=2017.02
PRETTY_NAME="Buildroot 2017.02"

When I checked Licenses listed in the manifest.csv file and then compared what
is said on actual source site I found differences.

E.g. package: expat - Manifest indicates GPLv2 but source site
(https://sourceforge.net/projects/expat/?source=navbar) indicates MIT License.

Is this due to a bug in expat package license info or something else?

-- 
You are receiving this mail because:
You are on the CC list for the bug.

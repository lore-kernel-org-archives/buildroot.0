From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 31 Jan 2018 14:24:32 +0000
Subject: [Buildroot] [Bug 10721] New: libpng package unaccessible
Message-ID: <bug-10721-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10721

            Bug ID: 10721
           Summary: libpng package unaccessible
           Product: buildroot
           Version: 2017.02.7
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jpcartal at free.fr
                CC: buildroot at uclibc.org
  Target Milestone: ---

libpng package v1.6.28 is not accessible anymore on buildroot site:

--2018-01-31 15:11:06--  http://sources.buildroot.net/libpng-1.6.28.tar.xz
R?solution de sources.buildroot.net (sources.buildroot.net)? 104.27.167.48,
104.27.166.48, 2400:cb00:2048:1::681b:a630, ...
Connexion ? sources.buildroot.net (sources.buildroot.net)|104.27.167.48|:80?
connect?.
requ?te HTTP transmise, en attente de la r?ponse? 403 Forbidden
2018-01-31 15:11:07 erreur?403?: Forbidden.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

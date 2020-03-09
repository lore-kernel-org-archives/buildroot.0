From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 09 Mar 2020 11:52:18 +0000
Subject: [Buildroot] [Bug 12626] New: PHP missing header files within 2020.02
Message-ID: <bug-12626-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12626

            Bug ID: 12626
           Summary: PHP missing header files within 2020.02
           Product: buildroot
           Version: 2020.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: joerg.hering at macgregor.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

empty Project like this (missing header files) 

BR2_aarch64=y
BR2_PACKAGE_PHP=y

/home/Public/BuildRoot/Machine/mdp-test/build/php-7.4.3/ext/standard/crc32.c:26:12:
schwerwiegender Fehler: sys/auxv.h: Datei oder Verzeichnis nicht gefunden
 #  include <sys/auxv.h>
            ^~~~~~~~~~~~

Greetings J?rg

-- 
You are receiving this mail because:
You are on the CC list for the bug.

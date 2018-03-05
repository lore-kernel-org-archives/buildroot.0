From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 05 Mar 2018 21:31:27 +0000
Subject: [Buildroot] [Bug 10836] New: Missing Qt5 component : translations
Message-ID: <bug-10836-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10836

            Bug ID: 10836
           Summary: Missing Qt5 component : translations
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: pinaraf at pinaraf.info
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi

The translations for the Qt5 user interface is split from the Qt5 code in a
qt5translations submodule, for instance
http://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qttranslations-opensource-src-5.9.3.tar.xz

It is a simple package, depending on the linguist host tools (already
packages).
The only trick would be to be able to choose the required languages from the
configuration menu. It is of great importance for people building embedded Qt
applications targeting non-english users.

I am willing to work on this package if you can not work on it (I'm not 100%
familiar with buildroot packaging rules, even less with a complex multi-version
package like Qt5, so I can not guarantee the quality of my work there).

Regards

 Pierre

-- 
You are receiving this mail because:
You are on the CC list for the bug.

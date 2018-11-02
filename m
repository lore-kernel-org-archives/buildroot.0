From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Nov 2018 11:26:30 +0000
Subject: [Buildroot] [Bug 11481] New: Docs: Is external.desc required?
Message-ID: <bug-11481-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11481

            Bug ID: 11481
           Summary: Docs: Is external.desc required?
           Product: buildroot
           Version: 2018.08.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: imphil at philipp-wagner.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I have a minor docs comment.

https://buildroot.org/downloads/manual/manual.html#customize

In the user guide, section "9.1. Recommended directory structure" the directory
tree shows two files for a br2 external tree: 

=====
+-- Config.in (if using a br2-external tree)
+-- external.mk (if using a br2-external tree)
=====

The documentation further down suggests that three files are needed:

=====
9.2.1. Layout of a br2-external tree

A br2-external tree must contain at least those three files, described in the
following chapters:

    external.desc
    external.mk
    Config.in 
=====


Most likely the external.desc file is missing from the top section?

-- 
You are receiving this mail because:
You are on the CC list for the bug.

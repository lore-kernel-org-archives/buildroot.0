From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 08 Oct 2020 08:10:42 +0000
Subject: [Buildroot] [Bug 13251] New: cryptsetup does not work on branch
 2020.02 following json-c upgrade
Message-ID: <bug-13251-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13251

            Bug ID: 13251
           Summary: cryptsetup does not work on branch 2020.02 following
                    json-c upgrade
           Product: buildroot
           Version: 2020.02.6
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: dominique.tronche at atos.net
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8596
  --> https://bugs.busybox.net/attachment.cgi?id=8596&action=edit
cryptsetup debug

We have integrated the last 2 tags of buildroot on branch 2020.02 which include
a patch on cryptsetup following an upgrade of json-c package, but this patch
does not seems sufficient
Our cyphered partition cannot be opened which makes our product unusable
Attached the cryptsetup command failing in debug mode

A similar issue was found on cryptsetup gitlab
https://gitlab.com/cryptsetup/cryptsetup/-/issues/556

Upgrading to cryptsetup version from master branch solved the issue

-- 
You are receiving this mail because:
You are on the CC list for the bug.

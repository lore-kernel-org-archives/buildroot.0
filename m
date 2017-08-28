From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 28 Aug 2017 20:47:23 +0000
Subject: [Buildroot] [Bug 10256] New: Kodi-inputstream-adaptive: download
 fails (patch included)
Message-ID: <bug-10256-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10256

            Bug ID: 10256
           Summary: Kodi-inputstream-adaptive: download fails (patch
                    included)
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: lipkegu at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7211
  --> https://bugs.busybox.net/attachment.cgi?id=7211&action=edit
Patch to fix the download link

When building kodi with addon inputstream adaptive, the addon fails to compile,
due to a missing download location. i included the current version of the
package for krypton.

it would be nice when we get this quickly to the relase version :)

signed-of-by: Guido Lipke <lipkegu@gmail.com>

-- 
You are receiving this mail because:
You are on the CC list for the bug.

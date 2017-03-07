From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 07 Mar 2017 21:41:01 +0000
Subject: [Buildroot] [Bug 9716] New: exit, shutdown, reboot from kodi
Message-ID: <bug-9716-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9716

            Bug ID: 9716
           Summary: exit, shutdown, reboot from kodi
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: rizom91 at openaliasbox.org
                CC: buildroot at uclibc.org
  Target Milestone: ---

I'm not sure how this is supposed to work, but exiting, shutdown or reboot in
Kodi has the same effect (black screen, cannot wake up with keyboard but not
really shutdown I guess because the sdcard access led is still blinking).

I have to unplug/replug power source after these actions.

I looked at the br-kodi script that seems to handle poweroff and reboot, but I
could make it work properly.

I'm running kodi as a non-root user (tried as root but it was the same). The
system is a Raspberry Pi 3 with the buildroot master branch compiled (so Kodi
16).

Does anyone know how to make it work ? I would like to get back to tty for
example after an exit.

PS: This is more an help request than a real bug I guess, so I hope it is OK to
post it like this.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

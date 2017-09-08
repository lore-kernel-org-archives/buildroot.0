From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 08 Sep 2017 09:42:36 +0000
Subject: [Buildroot] [Bug 10301] New: systemd/getty unused options
Message-ID: <bug-10301-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10301

            Bug ID: 10301
           Summary: systemd/getty unused options
           Product: buildroot
           Version: 2017.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: posted at heine.so
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi,

I stumbled across a minor issue with the getty configuration when using
systemd.

In menuconfig I can set

BR2_TARGET_GENERIC_GETTY_TERM
BR2_TARGET_GENERIC_GETTY_OPTIONS

but it is only used for busybox and sysvinit.
So I guess this should be implemented or disabled when systemd is used.

I would supply a patch, but first wanted to know: Is there any technical reason
why this is not implemented? 

Regards,
Michael

-- 
You are receiving this mail because:
You are on the CC list for the bug.

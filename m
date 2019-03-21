From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 21 Mar 2019 09:49:41 +0000
Subject: [Buildroot] [Bug 11731] New: buildroot 2019.02 systemd - long start
 Network name resolution service
Message-ID: <bug-11731-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11731

            Bug ID: 11731
           Summary: buildroot 2019.02 systemd - long start Network name
                    resolution service
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: skif at skif-web.ru
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7971
  --> https://bugs.busybox.net/attachment.cgi?id=7971&action=edit
screenshot with error

Hello!
After upgrade to buildroot 2019.02 I have a problem with Network name
resolution.

On startup, system write: A start job in running for Network name resolution.

After 3 minutes: [FAILED] failed to start Network Name resolution, and it all
starts again.

But, if i press any key, system boot go on and /etc/resolv.conf in correct.

What i do wrong ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.

From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 18 Jul 2019 17:49:54 +0000
Subject: [Buildroot] =?utf-8?b?W0J1ZyAxMjA0Nl0gTmV3OiBDYW7igJl0IGxvZ2lu?=
 =?utf-8?q?_as_root_user_after_upgrading_to_buildroot_2019=2E02?=
Message-ID: <bug-12046-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12046

            Bug ID: 12046
           Summary: Can?t login as root user after upgrading to buildroot
                    2019.02
           Product: buildroot
           Version: 2019.02
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: liadekel123 at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi everyone, 
2 weeks ago we upgraded our buildroot version from 2018.03 to 2019.02 . 
Until now we were using getty in order to login, and enabled login with 
root user on our defconfig.

After upgrading as described above, we can?t  login with root user,
While with standard user we do succeed.
As I saw one of the changes between the versions was that md5 is no longer
supported to hash the shadow file (same shadow file which contains our standard
user details).
We did tried to change the root password without any further success.

I?ll appreciate any ideas ... 
Many Thanks (:

-- 
You are receiving this mail because:
You are on the CC list for the bug.

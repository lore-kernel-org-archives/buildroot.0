From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 25 Sep 2017 16:10:28 +0000
Subject: [Buildroot] [Bug 10336] New: lttng compilation fails : linking error
Message-ID: <bug-10336-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10336

            Bug ID: 10336
           Summary: lttng compilation fails : linking error
           Product: buildroot
           Version: 2017.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: frederic.mathieu at dualis.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7241
  --> https://bugs.busybox.net/attachment.cgi?id=7241&action=edit
compilation log

Hi

my configuration :
- gcc 5.4.0
- X64
- custom HOST_DIR

With the same configuration, this package compile successfully with buildroot
2017.02.x.
it may be related to removing the output/host/usr directory ?


regards
Frederic MATHIEU

-- 
You are receiving this mail because:
You are on the CC list for the bug.

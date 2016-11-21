From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 21 Nov 2016 09:43:42 +0000
Subject: [Buildroot] [Bug 9441] New: Link
 BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY to BR2_ENABLE_DEBUG
Message-ID: <bug-9441-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9441

            Bug ID: 9441
           Summary: Link  BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY to
                    BR2_ENABLE_DEBUG
           Product: buildroot
           Version: 2015.08
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: blf_sn at yahoo.fr
                CC: buildroot at uclibc.org
  Target Milestone: ---

Dear all,
What do thing you about enabling  BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY when
BR2_ENABLE_DEBUG is selected? Or create a submenu for BR2_ENABLE_DEBUG ( build
packages with debugging symbols) and setBR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
as a submenu element of BR2_ENABLE_DEBUG.

Very often, I enable BR2_ENABLE_DEBUG and forgot to select
BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY because there are not in the same menus.
I suppose, may be wrongly, I am not the only one to make that mistake.
Best Regards!
Birahim

-- 
You are receiving this mail because:
You are on the CC list for the bug.

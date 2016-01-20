From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 20 Jan 2016 14:28:51 +0000
Subject: [Buildroot] [Bug 8616] New: Fail to build for raspberrypi_defconfig
 with big endian
Message-ID: <bug-8616-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8616

            Bug ID: 8616
           Summary: Fail to build for raspberrypi_defconfig with big
                    endian
           Product: buildroot
           Version: unspecified
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: paulonunes at mail.com
                CC: buildroot at uclibc.org

Created attachment 6286
  --> https://bugs.busybox.net/attachment.cgi?id=6286&action=edit
last lines of stdout on the failed execution

On building using raspberrypi_defconfig configuration and changing the
endianness to big endian, the buildroot fails to finish the build as attached
files describe in detail.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

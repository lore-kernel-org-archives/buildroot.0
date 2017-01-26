From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 26 Jan 2017 10:05:57 +0000
Subject: [Buildroot] [Bug 9616] New: CMake host packages cannot provide
	CONF_ENV
Message-ID: <bug-9616-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9616

            Bug ID: 9616
           Summary: CMake host packages cannot provide CONF_ENV
           Product: buildroot
           Version: 2016.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ovalentin at awox.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6871
  --> https://bugs.busybox.net/attachment.cgi?id=6871&action=edit
Add environment uppon configuration

When building an host package, HOST_*_CONF_ENV is not installed in the
environment during the configuration.

Providing with a patch suggestion,

thanks.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 13 Apr 2016 12:21:38 +0000
Subject: [Buildroot] [Bug 8846] New: Orphaned/missing toolchain borks
	eclipse plugin
Message-ID: <bug-8846-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8846

            Bug ID: 8846
           Summary: Orphaned/missing toolchain borks eclipse plugin
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: subwooferbone at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Using latest Buildroot Eclipse plugin.

Importing CDT project from another user, all build targets are gone. Eclipse
complains "An error has occurred. See error log for more details.
java.lang.NullPointerException".

C/C++ Build and C/C++ General pages of project properties are borked, null
pointers galore. 

Same behaviour with both Mars and Luna. Uninstalling the plugin makes the C/C++
options pages work again, but it is impossible to select another toolchain for
the projects defined with buildroot toolchains. Then complains about orphaned
toolchain.

Message sent to stderr: "Managed Build system manifest file error: Option
org.buildroot.home.bob.software_PI1509.platform.buildroot.output..toolchain.base.option.path.1204713667
uses a null category that is invalid in its context. The option was ignored."

-- 
You are receiving this mail because:
You are on the CC list for the bug.

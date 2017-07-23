From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 23 Jul 2017 12:19:07 +0000
Subject: [Buildroot] [Bug 10121] New: webkit without the multimedia option
 causes build error
Message-ID: <bug-10121-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10121

            Bug ID: 10121
           Summary: webkit without the multimedia option causes build
                    error
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: wschneider at nexoft.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

when I select webkit-gtk and do not select the associated multimedia option, I
get a compile error like this:

<...>
../WTF/wtf/PassRefPtr.h:40:18: Fehler: falsche Benutzung des unvollst?ndigen
Typs ?class WebCore::HTMLVideoElement?
<...>

the german error description means "undefined forward declaration of type
WebCore::HTMLVideoElement"

-- 
You are receiving this mail because:
You are on the CC list for the bug.

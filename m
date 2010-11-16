From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 Nov 2010 18:50:16 +0000 (UTC)
Subject: [Buildroot] [Bug 2833] New: Failed to compile webkit without X11
Message-ID: <bug-2833-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2833

           Summary: Failed to compile webkit without X11
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: oilehus at yahoo.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


If I want to build webkit with gtk+ and directfb, no X11, I got the following
errors

In file included from WebCore/bridge/npruntime_internal.h:28,
                 from WebCore/bridge/npruntime.cpp:31:
WebCore/bridge/npapi.h:105:26: error: X11/Xlib.h: No such file or directory
WebCore/bridge/npapi.h:106:27: error: X11/Xutil.h: No such file or directory
In file included from WebCore/bridge/npruntime.cpp:31:
WebCore/bridge/npruntime_internal.h:33:31: error: X11/Xresource.h: No such file
or directory
In file included from WebCore/bridge/npruntime_internal.h:28,
                 from WebCore/bridge/npruntime.cpp:31:
WebCore/bridge/npapi.h:273: error: ISO C++ forbids declaration of 'Display'
with no type
WebCore/bridge/npapi.h:273: error: expected ';' before '*' token
WebCore/bridge/npapi.h:274: error: ISO C++ forbids declaration of 'Visual' with
no type
WebCore/bridge/npapi.h:274: error: expected ';' before '*' token
WebCore/bridge/npapi.h:275: error: 'Colormap' does not name a type
WebCore/bridge/npapi.h:597: error: 'XEvent' does not name a type
WebCore/bridge/npapi.h:618: error: 'Region' does not name a type
WebCore/bridge/npapi.h:865: error: 'NPRegion' has not been declared
In file included from WebCore/bridge/npruntime_internal.h:29,
                 from WebCore/bridge/npruntime.cpp:31:
./WebCore/plugins/npfunctions.h:57: error: 'NPRegion' has not been declared
make[2]: *** [WebCore/bridge/libwebkit_1_0_la-npruntime.lo] Error 1
make[2]: *** Waiting for unfinished jobs....

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

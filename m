From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 22 Aug 2010 18:39:36 +0000 (UTC)
Subject: [Buildroot] [Bug 2419] New: Add a bundle of Lua modules
Message-ID: <bug-2419-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2419

           Summary: Add a bundle of Lua modules
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: francois.perrad at gadz.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2365
  --> https://bugs.busybox.net/attachment.cgi?id=2365
tarball

The first patch create the directory package/modules-lua,
and moves all actual Lua modules into.

Each of others patches adds a Lua module/library.

All these modules are available via LuaRocks, the Lua package installer for
no cross-compiling system.
(see http://luarocks.org/repositories/rocks/)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

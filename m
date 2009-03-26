From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 26 Mar 2009 23:16:06 +0000 (UTC)
Subject: [Buildroot] [Bug 225] New: m4 macros are out of place
Message-ID: <bug-225-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=225

           Summary: m4 macros are out of place
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P1
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: lykowdk at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


In my most recent pull from SVN,

alsa.m4  
freetype2.m4  
xaw.m4  
xorg-macros.m4  
xorg-server.m4  
xorgversion.m4  
xtrans.m4

are showing up in .../build_i686/staging_dir/usr/share/aclocal and I believe
that a recent change requires them to be in
.../build_i686/host_dir/usr/share/aclocal.

I'm not quite sure how to get them to build there, but if I copy them by hand
my build completes otherwise it crashes trying to build xorg.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

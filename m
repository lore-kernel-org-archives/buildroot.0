From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 31 Oct 2013 10:12:31 +0000 (UTC)
Subject: [Buildroot] [Bug 6650] New: Segmentation fault when trying to build
 latest buildroot
Message-ID: <bug-6650-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6650

           Summary: Segmentation fault when trying to build latest
                    buildroot
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: daniel.karlsson at scanreco.se
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5114
  --> https://bugs.busybox.net/attachment.cgi?id=5114
Log output when bug occured

When trying to compile latest buildroot (checked out from git repo 2013-10-31)
with the sama5d3ekdemo_defconfig, I get the following error:

/home/daniel/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/libgcc2.c: In
function '__absvdi2':
/home/daniel/buildroot-at91/output/toolchain/gcc-4.7.2/libgcc/libgcc2.c:273:1
internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://bugs.buildroot.net/> for instructions.
make[2]: *** [_absvdi2.o] Error 1

There are more error of the sam type that follows, but this is the first error
detected (see attachment, sorry for some words being in swedish).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Jul 2014 16:33:50 +0000 (UTC)
Subject: [Buildroot] [Bug 7268] New: python 2.7 compilation issue
Message-ID: <bug-7268-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7268

           Summary: python 2.7 compilation issue
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: buildroot-2014 at inbox.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi,

I am trying to build python for an x86_64 target. 

I am using fresh sources of buildroot (exactly the git revision
5ac8f8ce10027ac8285a7e9cec16e74aa38ee2c1).

To achieve that, I go through following steps :
- make defconfig
- in Target Options, change Target Architecture to x86_64 / generic
- in Toolchain, change C Library to glibc
- in Target Packages / Interpreter languages and scripting, enable python
- make

The following tarball encloses configuration file and make output.

It seems host part of python build goes well. Target part, however, fails
building "struct" module (I'm not a python expert... so I may be wrong).

Thanks

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

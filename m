From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 25 Feb 2010 16:02:13 +0000 (UTC)
Subject: [Buildroot] [Bug 1183] New: make source fails to download gmp,
	mpfr and patches
Message-ID: <bug-1183-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1183

            Target: ARM Integrator/CP
           Summary: make source fails to download gmp, mpfr and patches
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: johan at thelins.se
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1165)
 --> (https://bugs.busybox.net/attachment.cgi?id=1165)
Used configuration

When building for ARM Integrator/CP, the make source command does not work
fully. To complete the install, I had to wget the following files manually:

http://ftp.gnu.org/pub/gnu/gmp/gmp-4.2.4.tar.bz2
http://www.mpfr.org/mpfr-2.4.1/mpfr-2.4.1.tar.bz2
http://www.mpfr.org/mpfr-2.4.1/patches

I use the integrator926_defconfig, but remove non-busybox applications. See
attached configuration.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

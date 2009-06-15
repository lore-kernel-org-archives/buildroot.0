From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 15 Jun 2009 13:26:18 +0000 (UTC)
Subject: [Buildroot] [Bug 403] New: Error while building ISO9660 image
Message-ID: <bug-403-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=403

           Summary: Error while building ISO9660 image
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: akagi010 at yahoo.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=407)
 --> (https://bugs.busybox.net/attachment.cgi?id=407)
config file for buildroot

Hello, I currently try to build a busybox with buildroot, but it fails every
time with the error message:

cp 
/home/xxx/data/development/dist/build/product/buildroot/buildroot-2009.05/build_i686/iso9660/kernel
cp: Fehlender Zieldatei?Operand hinter
?/home/xxx/data/development/dist/build/product/buildroot/buildroot-2009.05/build_i686/iso9660/kernel?
?cp --help? gibt weitere Informationen.
make: ***
[/home/xxx/data/development/dist/build/product/buildroot/buildroot-2009.05/binaries/uclibc/rootfs.i686.iso]
Fehler 1

(I am german so the error messages are in german too).

I use Ubuntu 9.04 Jaunty as environment. I also attach the config file I use
for the build.

Please send me a note if I should supply additional information.

Best regards.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 15 Jan 2010 16:43:01 +0000 (UTC)
Subject: [Buildroot] [Bug 907] New: mkisofs: No such file or directory
Message-ID: <bug-907-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=907

           Summary: mkisofs: No such file or directory
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: max at olo.com.pl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I selected: 
Target filesystem options  ---> iso image 

after run make i have error: 

---------------------------------------------------------
# Use fakeroot so mkisofs believes the previous fakery
echo
"/root/buildroot/output/build/cdrtools-2.01/mkisofs/OBJ/i386-linux-cc/mkisofs
-R -b boot/grub/stage2_eltorito -no-emul-boot " \
                "-boot-load-size 4 -boot-info-table -o
/root/buildroot/output/images/rootfs.i686.iso
/root/buildroot/output/build/iso9660" \
                >> /root/buildroot/output/build/_fakeroot.rootfs.i686.iso
chmod a+x /root/buildroot/output/build/_fakeroot.rootfs.i686.iso
/root/buildroot/output/host/usr/bin/fakeroot --
/root/buildroot/output/build/_fakeroot.rootfs.i686.iso
/root/buildroot/output/build/_fakeroot.rootfs.i686.iso: line 2:
/root/buildroot/output/build/cdrtools-2.01/mkisofs/OBJ/i386-linux-cc/mkisofs:
No such file or directory
make: *** [/root/buildroot/output/images/rootfs.i686.iso] Error 127
--------------------------------------------------------------------------


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

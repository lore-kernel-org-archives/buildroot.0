From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 20 Oct 2008 13:20:07 -0700
Subject: [Buildroot] [buildroot 0005614]: make clean + make does not provide
	a full project rootfs
Message-ID: <8757169db099d269d815c4bac8219df4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5614 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5614
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-20-2008 13:20 PDT
Last Modified:              10-20-2008 13:20 PDT
====================================================================== 
Summary:                    make clean + make does not provide a full project
rootfs
Description: 
roberto at rafbook:~/gles/buildroot$ make clean

[...]

roberto at rafbook:~/gles/buildroot$ make 

Size of boot image is 4 sectors -> No emulation
Total translation table size: 2048
Total rockridge attributes bytes: 996
Total directory bytes: 4096
Path table size(bytes): 34
Max brk space used 0
2838 extents written (5 MB)
echo /home/roberto/gles/buildroot/binaries/ugles/rootfs.i586.iso
/home/roberto/gles/buildroot/binaries/ugles/rootfs.i586.iso
-rw-r--r-- 1 roberto roberto 5812224 2008-10-20 22:13
/home/roberto/gles/buildroot/binaries/ugles/rootfs.i586.iso
rm -f /home/roberto/gles/buildroot/project_build_i586/ugles/.fakeroot*

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-20-08 13:20  robang74       New Issue                                    
10-20-08 13:20  robang74       Status                   new => assigned     
10-20-08 13:20  robang74       Assigned To               => buildroot       
10-20-08 13:20  robang74       File Added: .config                          
======================================================================

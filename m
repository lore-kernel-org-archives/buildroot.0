From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 28 Oct 2008 02:33:02 -0700
Subject: [Buildroot] [buildroot 0005614]: make clean + make does not provide
	a full project rootfs
Message-ID: <6aeae9d3319411f8c40a94cdaacb0f9b@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
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
Last Modified:              10-28-2008 02:33 PDT
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

---------------------------------------------------------------------- 
 robang74 - 10-28-08 02:33  
---------------------------------------------------------------------- 
Proposed solution discussed in m-list
http://busybox.net/lists/buildroot/2008-October/011309.html 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-20-08 13:20  robang74       New Issue                                    
10-20-08 13:20  robang74       Status                   new => assigned     
10-20-08 13:20  robang74       Assigned To               => buildroot       
10-20-08 13:20  robang74       File Added: .config                          
10-20-08 13:20  robang74       Issue Monitored: robang74                    
10-28-08 02:29  robang74       File Added: Makefile-r23778.patch3               
    
10-28-08 02:33  robang74       Note Added: 0014434                          
======================================================================

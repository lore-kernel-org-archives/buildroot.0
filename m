From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 28 Aug 2007 17:43:54 -0700
Subject: [Buildroot] [buildroot 0001478]: libglib12 is only built as a
	static library
Message-ID: <58ba723bc05a3ba4bc88461d7f3279b9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1478 
====================================================================== 
Reported By:                gururaj
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1478
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-28-2007 17:43 PDT
Last Modified:              08-28-2007 17:43 PDT
====================================================================== 
Summary:                    libglib12 is only built as a static library
Description: 
trying to make libglib12 and it ends with error about missing libglib.so in
buildroot/build_arm/staging_dir/lib/. 

cp -dpf
/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/lib/libglib.so
/home/guru/project/original/bldrt/buildroot/project_build_arm/uclibc/root/lib/

cp: cannot stat
`/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/lib/libglib.so':
No such file or directory 
make: ***
[/home/guru/project/original/bldrt/buildroot/project_build_arm/uclibc/root/lib/libglib-1.2.so.0.0.10]
Error 1 


When i searched in this Directory i had 
root at box124:~/project/original/bldrt/buildroot# ls -la
build_arm/staging_dir/lib/libglib.* 
-rw-r--r-- 1 root root 596464 Aug 22 11:58
build_arm/staging_dir/lib/libglib.a 
-rwxr-xr-x 1 root root    593 Aug 22 11:58
build_arm/staging_dir/lib/libglib.la
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-28-07 17:43  gururaj        New Issue                                    
08-28-07 17:43  gururaj        Status                   new => assigned     
08-28-07 17:43  gururaj        Assigned To               => buildroot       
======================================================================

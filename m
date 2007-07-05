From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 5 Jul 2007 13:10:49 -0700
Subject: [Buildroot] [buildroot 0001422]: add logic to build a replacement
	make binary if host has unsuitable binary
Message-ID: <f6077fa7426cec5127f919a64a16880e@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1422 
====================================================================== 
Reported By:                chickenandporn
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1422
Category:                   New Features
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-05-2007 10:11 PDT
Last Modified:              07-05-2007 13:10 PDT
====================================================================== 
Summary:                    add logic to build a replacement make binary if host
has unsuitable binary
Description: 
On my build, the make binary is unsuitable; I have created a patch which
recognizes this and builds a make binary from the host using the same
download/configure logic in package/make/make.mk.  The previous failure in
dependencies.sh is resolved, although this is not a bug per-se (user can
manually fix the issue, but this allows some laziness).


====================================================================== 

---------------------------------------------------------------------- 
 chickenandporn - 07-05-07 13:10  
---------------------------------------------------------------------- 
Second patch (file-1073) is required to cause uclibc to also accept the
overlay make binary.  NOTE: patch -p1 for file-1073. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-05-07 10:11  chickenandporn New Issue                                    
07-05-07 10:11  chickenandporn Status                   new => assigned     
07-05-07 10:11  chickenandporn Assigned To               => buildroot       
07-05-07 10:11  chickenandporn File Added: buildroot-hostmake.patch             
      
07-05-07 12:51  chickenandporn Issue Monitored: chickenandporn                  
 
07-05-07 13:09  chickenandporn File Added: buildroot-hostmake-uclibc.patch      
             
07-05-07 13:10  chickenandporn Note Added: 0002557                          
======================================================================

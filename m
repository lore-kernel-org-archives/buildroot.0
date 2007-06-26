From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 26 Jun 2007 06:56:43 -0700
Subject: [Buildroot] [buildroot 0001405]: ARM OABI builds fail for gcc 4.x
Message-ID: <1edcce9f7eec970acfd8a0b98c3efe1c@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1405 
====================================================================== 
Reported By:                bjdooks
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1405
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-26-2007 06:50 PDT
Last Modified:              06-26-2007 06:56 PDT
====================================================================== 
Summary:                    ARM OABI builds fail for gcc 4.x
Description: 
ARM OABI configured builds cannot produce working gcc output due to missing
items in libgcc. 
====================================================================== 

---------------------------------------------------------------------- 
 bjdooks - 06-26-07 06:56  
---------------------------------------------------------------------- 
uploaded the correct build patch, buildroot-gcc-412-oabi2.build 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-26-07 06:50  bjdooks        New Issue                                    
06-26-07 06:50  bjdooks        Status                   new => assigned     
06-26-07 06:50  bjdooks        Assigned To               => buildroot       
06-26-07 06:50  bjdooks        File Added: buildroot-gcc-412-oabi.build         
          
06-26-07 06:56  bjdooks        File Added: buildroot-gcc-412-oabi2.build        
           
06-26-07 06:56  bjdooks        Note Added: 0002519                          
======================================================================

From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 15 Nov 2007 07:44:47 -0800
Subject: [Buildroot] [buildroot 0001592]: [PATCH] Set uClibc default target
	file format for Nios2
Message-ID: <8047b6ea6fb27ebb3223e07b6ce5f37f@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1592 
====================================================================== 
Reported By:                atle
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1592
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             11-15-2007 07:38 PST
Last Modified:              11-15-2007 07:44 PST
====================================================================== 
Summary:                    [PATCH] Set uClibc default target file format for
Nios2
Description: 
The attached patch sets the default uClibc target file format for Nios2 to
FLAT (the only option we have ..), and inserts "is not set" lines for the
other file format options to avoid that make oldconfig prompts for this
setting.

====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 11-15-07 07:44  
---------------------------------------------------------------------- 
applied in rev 20428, thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-15-07 07:38  atle           New Issue                                    
11-15-07 07:38  atle           Status                   new => assigned     
11-15-07 07:38  atle           Assigned To               => buildroot       
11-15-07 07:38  atle           File Added: uclibc-config-nios2.diff             
      
11-15-07 07:44  vanokuten      Status                   assigned => closed  
11-15-07 07:44  vanokuten      Note Added: 0002924                          
======================================================================

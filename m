From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:13 -0800
Subject: [Buildroot] [buildroot 0000438]: The libfl.a library is not
	installed in staging_dir.
Message-ID: <f7c4483f18d34b9ea393303d4ee02435@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=438 
====================================================================== 
Reported By:                steelman
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   438
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-19-2005 05:08 PDT
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    The libfl.a library is not installed in staging_dir.
Description: 
The libfl.a is installed under root directory of target system but not
under staging_dir which IMHO suits better for static libraries.

====================================================================== 

---------------------------------------------------------------------- 
 steelman - 09-19-05 05:12  
---------------------------------------------------------------------- 
The dupa.patch was a wrong file, dupa1.patch is the correct for this issue. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-19-05 05:08  steelman       New Issue                                    
09-19-05 05:08  steelman       Status                   new => assigned     
09-19-05 05:08  steelman       Assigned To               => uClibc          
09-19-05 05:08  steelman       File Added: dupa.patch                       
09-19-05 05:12  steelman       File Added: dupa1.patch                      
09-19-05 05:12  steelman       Note Added: 0000556                          
01-23-06 13:21  prpplague      Status                   assigned => resolved
01-23-06 13:21  prpplague      Resolution               open => fixed       
01-23-06 13:21  prpplague      Additional Information Updated                   

03-08-06 16:54  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================

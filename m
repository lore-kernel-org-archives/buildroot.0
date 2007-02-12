From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:25 -0800
Subject: [Buildroot] [buildroot 0000479]: vtun configure is looking for ssl
	and lzo in the wrong place
Message-ID: <c89c2c04c5d9cd0c0f78a9e0a1dd08da@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=479 
====================================================================== 
Reported By:                bjdooks
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   479
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-11-2005 08:14 PDT
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    vtun configure is looking for ssl and lzo in the
wrong place
Description: 
It seems recent updates have moved where lzo and ssl are installed,
(to /lib and /include) and left vtun looking in (/usr/include) for
them.


====================================================================== 

---------------------------------------------------------------------- 
 bjdooks - 10-11-05 08:18  
---------------------------------------------------------------------- 
sorry, wrong file uploaded first time 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-11-05 08:14  bjdooks        New Issue                                    
10-11-05 08:14  bjdooks        Status                   new => assigned     
10-11-05 08:14  bjdooks        Assigned To               => uClibc          
10-11-05 08:14  bjdooks        File Added: vtun-staging-update.patch            
       
10-11-05 08:18  bjdooks        File Added: vtun-staging-update2.patch           
        
10-11-05 08:18  bjdooks        Note Added: 0000619                          
01-24-06 07:09  prpplague      Status                   assigned => resolved
01-24-06 07:09  prpplague      Resolution               open => fixed       
01-24-06 07:09  prpplague      Additional Information Updated                   

03-08-06 16:54  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================

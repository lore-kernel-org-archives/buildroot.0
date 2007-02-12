From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:29 -0800
Subject: [Buildroot] [buildroot 0000856]: Not finding ethtool sources
Message-ID: <6c217ec0261f7fb679ab96392b00d5b4@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=856 
====================================================================== 
Reported By:                Jordi_Polo
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   856
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-28-2006 04:28 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    Not finding ethtool sources
Description: 
The buildroot downloaded at April 27, 2006 can't find the sources for
ethtool
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 04-28-06 05:47  
---------------------------------------------------------------------- 
Ups, sorry about that. The following tiny patch fixes it 

---------------------------------------------------------------------- 
 jacmet - 04-28-06 12:35  
---------------------------------------------------------------------- 
Thanks. Fixed in r14951. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-28-06 04:28  Jordi_Polo     New Issue                                    
04-28-06 04:28  Jordi_Polo     Status                   new => assigned     
04-28-06 04:28  Jordi_Polo     Assigned To               => uClibc          
04-28-06 05:47  jacmet         Note Added: 0001332                          
04-28-06 05:47  jacmet         File Added: ethtool-download-url.patch           
        
04-28-06 12:35  jacmet         Status                   assigned => closed  
04-28-06 12:35  jacmet         Note Added: 0001334                          
04-28-06 12:35  jacmet         Resolution               open => fixed       
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================

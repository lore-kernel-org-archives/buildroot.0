From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 27 Nov 2007 13:45:17 -0800
Subject: [Buildroot] [buildroot 0001572]: libmad $(MAKE) should be run with
	full configure environment
Message-ID: <4bd15ac472d43e14005f2bc720c54c82@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1572 
====================================================================== 
Reported By:                ikonst
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1572
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             11-04-2007 03:21 PST
Last Modified:              11-27-2007 13:45 PST
====================================================================== 
Summary:                    libmad $(MAKE) should be run with full configure
environment
Description: 
libmad's Makefile (like any autoconf-based Makefile) may wish to re-run
'configure'. We should provide it with the same environment as we provide
'configure' with.
====================================================================== 

---------------------------------------------------------------------- 
 ikonst - 11-04-07 03:22  
---------------------------------------------------------------------- 
This patch should be applied only after issue 0001560 is reverted. 

---------------------------------------------------------------------- 
 UlfSamuelsson - 11-27-07 13:45  
---------------------------------------------------------------------- 
Fixed in  revision 20554. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-04-07 03:21  ikonst         New Issue                                    
11-04-07 03:21  ikonst         Status                   new => assigned     
11-04-07 03:21  ikonst         Assigned To               => buildroot       
11-04-07 03:21  ikonst         File Added: libmad-make-with-target-opts.patch   
                
11-04-07 03:22  ikonst         Note Added: 0002887                          
11-27-07 13:45  UlfSamuelsson  Status                   assigned => closed  
11-27-07 13:45  UlfSamuelsson  Note Added: 0002979                          
======================================================================

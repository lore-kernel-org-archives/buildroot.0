From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 30 Oct 2008 03:12:31 -0700
Subject: [Buildroot] [buildroot 0005174]: Patch for directfb(add gfxdrive
	select options)
Message-ID: <b4f19e84d84d346f0a53ff948f8c351f@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=5174 
====================================================================== 
Reported By:                Devix
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5174
Category:                   New Features
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             09-27-2008 07:06 PDT
Last Modified:              10-30-2008 03:12 PDT
====================================================================== 
Summary:                    Patch for directfb(add gfxdrive select options)
Description: 
Thsi patch add gfx drivere select options into directfb package.
====================================================================== 

---------------------------------------------------------------------- 
 tpetazzoni - 10-13-08 03:20  
---------------------------------------------------------------------- 
The patch doesn't apply anymore, and a similar functionnality has been
added in r23621. Not all gfx drivers have been added in r23621, but they
can trivially be added.

I'd suggest to mark this bug as fixed by r23621. 

---------------------------------------------------------------------- 
 Correa - 10-30-08 03:12  
---------------------------------------------------------------------- 
fixed by r23621.
Pointed out by tpetazzoni 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-27-08 07:06  Devix          New Issue                                    
09-27-08 07:06  Devix          Status                   new => assigned     
09-27-08 07:06  Devix          Assigned To               => buildroot       
09-27-08 07:06  Devix          File Added:
directfb-1.0.1-add-gfxdriver-select-options.patch                    
09-27-08 08:46  Devix          Issue Monitored: Devix                       
09-27-08 08:46  Devix          Issue End Monitor: Devix                     
09-27-08 08:46  Devix          Issue Monitored: Devix                       
10-13-08 03:20  tpetazzoni     Note Added: 0013424                          
10-30-08 03:12  Correa         Status                   assigned => closed  
10-30-08 03:12  Correa         Note Added: 0014594                          
======================================================================

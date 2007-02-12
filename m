From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:03 -0800
Subject: [Buildroot] [buildroot 0000521]: tweak deafult dropbear build
	options
Message-ID: <38c0c170f79ed45cd1ebaeaa3ea4ca1f@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=521 
====================================================================== 
Reported By:                akvadrako
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   521
Category:                   Other
Reproducibility:            N/A
Severity:                   tweak
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-28-2005 09:59 PDT
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    tweak deafult dropbear build options
Description: 
I suggest these be the slightly modified defaults for building dropbear. 
WTMP isn't nessesary and it's real useful to have a ssh client.  It only
have about an additional 50K.
====================================================================== 

---------------------------------------------------------------------- 
 prpplague - 01-24-06 07:57  
---------------------------------------------------------------------- 
after review this was reversed. the dbclient link was already added so no
change there, however if you want to change the defaults for the
configure, add some options in the Config.in to select them. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-28-05 09:59  akvadrako      New Issue                                    
10-28-05 09:59  akvadrako      Status                   new => assigned     
10-28-05 09:59  akvadrako      Assigned To               => uClibc          
10-28-05 09:59  akvadrako      File Added: br-dropbear-fixes.patch              
     
12-29-05 03:31  vapier         Summary                  dropbear build fixes =>
tweak deafult dropbear build options
01-24-06 07:34  prpplague      Status                   assigned => resolved
01-24-06 07:34  prpplague      Resolution               open => fixed       
01-24-06 07:34  prpplague      Additional Information Updated                   

01-24-06 07:57  prpplague      Status                   resolved => feedback
01-24-06 07:57  prpplague      Resolution               fixed => reopened   
01-24-06 07:57  prpplague      Note Added: 0000991                          
01-24-06 07:57  prpplague      Status                   feedback => closed  
01-24-06 07:57  prpplague      Resolution               reopened => won't fix
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================

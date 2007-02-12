From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:44 -0800
Subject: [Buildroot] [buildroot 0000157]: New Feature to allow generic empty
	directories to be created
Message-ID: <d67d99013972b1c6171f662cc7126ad7@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=157 
====================================================================== 
Reported By:                rireland
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   157
Category:                   New Features
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-14-2005 18:11 PST
Last Modified:              02-12-2007 05:48 PST
====================================================================== 
Summary:                    New Feature to allow generic empty directories to be
created
Description: 
Adds a rm -f of .create_dir files in $(TARGET_DIR).
Useful if you want empty directories generated from the generic skeleton,
for example: etc/network/if-*/

====================================================================== 

---------------------------------------------------------------------- 
 rireland - 03-14-05 18:14  
---------------------------------------------------------------------- 
Yes, I know if_* files are created with the device table file.  I just
wanted another, easier to understand, method. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-14-05 18:11  rireland       New Issue                                    
03-14-05 18:11  rireland       File Added: create_dir.patch                    
03-14-05 18:14  rireland       Note Added: 0000086                          
03-16-05 12:11  andersen       Status                   new => assigned     
03-16-05 12:11  andersen       Assigned To               => uClibc          
03-22-05 09:11  rireland       Issue Monitored: rireland                    
01-25-06 12:49  prpplague      Status                   assigned => closed  
01-25-06 12:49  prpplague      Resolution               open => won't fix   
01-25-06 12:49  prpplague      Additional Information Updated                   

02-12-07 05:48  vapier         Status                   closed => assigned  
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
======================================================================

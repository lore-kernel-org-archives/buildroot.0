From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:56 -0800
Subject: [Buildroot] [buildroot 0000140]: wipe - secure erase for magnetic
	media (new package added)
Message-ID: <a04c523f287c25aa6484350ecc33edc4@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=140 
====================================================================== 
Reported By:                scott
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   140
Category:                   New Features
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-10-2005 12:58 PST
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    wipe - secure erase for magnetic media (new package
added)
Description: 
This patch will add a new package called 'wipe' which is a utility for
completely erasing magnetic media (hard drives, etc.)

The 'wipe' website is: http://abaababa.ouvaton.org/wipe/

====================================================================== 

---------------------------------------------------------------------- 
 scott - 01-23-06 09:36  
---------------------------------------------------------------------- 
the magnetic tape 'mt' command has an 'erase' option, but it is not a
secure multi-pase erase.  We use a USB key drive linux distro to secure
erase hard drives, and 'wipe' is the only multi-pass erase utility we
use.

I appreciate your clarification on existing functionality, but for our
needs, the 'mt' command will not work.  I just wanted to clarify this for
any other users to need a truly secure erase utility for media other than
magnetic tape (such as hard drives, as in our case). 

---------------------------------------------------------------------- 
 prpplague - 01-23-06 10:12  
---------------------------------------------------------------------- 
added to buildroot on revision 13513. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-10-05 12:58  scott          New Issue                                    
03-10-05 12:58  scott          File Added: wipe.patch                       
03-16-05 12:12  andersen       Status                   new => assigned     
03-16-05 12:12  andersen       Assigned To               => uClibc          
01-23-06 07:51  prpplague      Status                   assigned => closed  
01-23-06 07:51  prpplague      Resolution               open => won't fix   
01-23-06 07:51  prpplague      Additional Information Updated                   

01-23-06 09:36  scott          Status                   closed => feedback  
01-23-06 09:36  scott          Resolution               won't fix => reopened
01-23-06 09:36  scott          Note Added: 0000982                          
01-23-06 10:12  prpplague      Note Added: 0000983                          
01-23-06 10:13  prpplague      Status                   feedback => resolved
01-23-06 10:13  prpplague      Resolution               reopened => fixed   
03-08-06 16:55  vapier         Status                   resolved => closed  
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================

From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:49 -0800
Subject: [Buildroot] [buildroot 0001167]: SVN 17445 is missing a file?
Message-ID: <7c1f038587c70e121c905c70f40d44e2@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1167 
====================================================================== 
Reported By:                jcoppens
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1167
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-21-2007 20:10 PST
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    SVN 17445 is missing a file?
Description: 
On trying to 'make menuconfig' svn 17445, I get the following error:

make[1]: Leaving directory
`/usr/local/src/programming/buildroot/package/config'
package/Config.in:134: can't open file "package/l2tp/Config.in"

There is no directory l2tp in package/

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 01-22-07 11:34  
---------------------------------------------------------------------- 
Fixed in r17475. Sorry. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-21-07 20:10  jcoppens       New Issue                                    
01-21-07 20:10  jcoppens       Status                   new => assigned     
01-21-07 20:10  jcoppens       Assigned To               => uClibc          
01-22-07 11:34  bernhardf      Status                   assigned => closed  
01-22-07 11:34  bernhardf      Note Added: 0002031                          
01-22-07 11:34  bernhardf      Resolution               open => fixed       
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================

From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:22 -0800
Subject: [Buildroot] [buildroot 0000586]: I can't compile DirectFB
Message-ID: <b77bdd71fe018fe5e8277f92198136eb@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=586 
====================================================================== 
Reported By:                invaugen
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   586
Category:                   New Features
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-07-2005 16:31 PST
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    I can't compile DirectFB
Description: 
I download buildroot from svn today
I have an error when I compile DirectFB:
In file included from /usr/include/freetype2/freetype/freetype.h:51,
                 from /usr/include/freetype2/freetype/ftglyph.h:37,
                 from idirectfbfont_ft2.c:35:
/usr/include/freetype2/freetype/config/ftconfig.h:2:32: error:
multiarch-dispatch.h: No such file or directory

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 02-04-07 09:28  
---------------------------------------------------------------------- 
Meanwhile freetype and directfb use newer versions. I'll close this report
within a week or two unless i hear any update on this issue.

Please update and send the fixes to the list (or attach it to this
report).

Thanks 

---------------------------------------------------------------------- 
 bernhardf - 02-09-07 06:24  
---------------------------------------------------------------------- 
I assume that this works now since about all affected packages were updated
since this report. Please file a new bug (or reopen this one) if you still
encounter trouble.

Thanks for the report 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-07-05 16:31  invaugen       New Issue                                    
12-07-05 16:31  invaugen       Status                   new => assigned     
12-07-05 16:31  invaugen       Assigned To               => uClibc          
12-07-05 16:31  invaugen       File Added: directfb.txt                     
10-20-06 12:15  jruere         Issue Monitored: jruere                      
02-04-07 09:28  bernhardf      Note Added: 0002112                          
02-04-07 09:28  bernhardf      Status                   assigned => feedback
02-09-07 06:24  bernhardf      Status                   feedback => closed  
02-09-07 06:24  bernhardf      Note Added: 0002145                          
02-09-07 06:24  bernhardf      Resolution               open => no change
required
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================

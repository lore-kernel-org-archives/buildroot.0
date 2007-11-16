From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 16 Nov 2007 04:49:42 -0800
Subject: [Buildroot] [buildroot 0001593]: portage version bump
Message-ID: <ac09e6cec3247a0e0b9fddd59addb0ca@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1593 
====================================================================== 
Reported By:                aron
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1593
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             11-16-2007 02:34 PST
Last Modified:              11-16-2007 04:49 PST
====================================================================== 
Summary:                    portage version bump
Description: 
This patch bumps portage from 2.1.2.9 to 2.1.3.19
====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 11-16-07 02:51  
---------------------------------------------------------------------- 
after enabling portage and applying portage.patch :

mkdir -p /opt/buildroot/project_build_avr32/atstk1002
cp -dpRf package/config/buildroot-config
/opt/buildroot/project_build_avr32/atstk1002/buildroot-config
wget --passive-ftp  -P /sources
http://dev.gentoo.org/~azarah/sandbox//sandbox-1.2.18.1.tar.bz2
--13:51:59-- 
http://dev.gentoo.org/~azarah/sandbox//sandbox-1.2.18.1.tar.bz2
           => `/sources/sandbox-1.2.18.1.tar.bz2'
Resolving dev.gentoo.org... 140.211.166.183
Connecting to dev.gentoo.org|140.211.166.183|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
13:51:59 ERROR 404: Not Found. 

---------------------------------------------------------------------- 
 aron - 11-16-07 02:56  
---------------------------------------------------------------------- 
YEs, I was stupi enough to ask ulf the reason for using azarahs dev account
instead of a normal gentoo mirror. I'm opening a new bug report to fix
that. 

---------------------------------------------------------------------- 
 aron - 11-16-07 03:02  
---------------------------------------------------------------------- 
0001594 replaces this one. Pls close. 

---------------------------------------------------------------------- 
 vanokuten - 11-16-07 04:49  
---------------------------------------------------------------------- 
see 0001594 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-16-07 02:34  aron           New Issue                                    
11-16-07 02:34  aron           Status                   new => assigned     
11-16-07 02:34  aron           Assigned To               => buildroot       
11-16-07 02:34  aron           File Added: portage.patch                    
11-16-07 02:34  aron           Issue Monitored: aron                        
11-16-07 02:51  vanokuten      Note Added: 0002932                          
11-16-07 02:56  aron           Note Added: 0002934                          
11-16-07 03:02  aron           Note Added: 0002935                          
11-16-07 04:49  vanokuten      Status                   assigned => closed  
11-16-07 04:49  vanokuten      Note Added: 0002938                          
======================================================================

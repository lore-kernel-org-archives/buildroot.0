From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 16 Nov 2007 02:51:52 -0800
Subject: [Buildroot] [buildroot 0001593]: portage version bump
Message-ID: <f723672cb0e2f860a6bc3c628faaf4c2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             11-16-2007 02:34 PST
Last Modified:              11-16-2007 02:51 PST
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

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-16-07 02:34  aron           New Issue                                    
11-16-07 02:34  aron           Status                   new => assigned     
11-16-07 02:34  aron           Assigned To               => buildroot       
11-16-07 02:34  aron           File Added: portage.patch                    
11-16-07 02:34  aron           Issue Monitored: aron                        
11-16-07 02:51  vanokuten      Note Added: 0002932                          
======================================================================

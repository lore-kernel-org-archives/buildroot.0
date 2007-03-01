From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 1 Mar 2007 14:56:19 -0800
Subject: [Buildroot] [buildroot 0001241]: fakeroot download fails
Message-ID: <212d12f77766c97b402ab31aada6b349@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1241 
====================================================================== 
Reported By:                amckinle
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1241
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-28-2007 05:18 PST
Last Modified:              03-01-2007 14:56 PST
====================================================================== 
Summary:                    fakeroot download fails
Description: 
wget --passive-ftp -P /home/austin/src/buildroot/dl
http://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.5.12.tar.gz
--08:14:55-- 
http://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.5.12.tar.gz
           => `/home/austin/src/buildroot/dl/fakeroot_1.5.12.tar.gz'
Resolving ftp.debian.org... 128.101.240.212
Connecting to ftp.debian.org|128.101.240.212|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
08:14:55 ERROR 404: Not Found.

make: *** [/home/austin/src/buildroot/dl/fakeroot_1.5.12.tar.gz] Error 1
austin at eve:~/src/buildroot$ svn update
At revision 17982.

====================================================================== 

---------------------------------------------------------------------- 
 bifferos - 03-01-07 14:56  
---------------------------------------------------------------------- 
http://ftp.br.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.5.12.tar.gz
[^]

Now it seems the br link doesn't work either.  Perhaps the brazilian
mirror kept a copy for a short time before getting 'updated'. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-28-07 05:18  amckinle       New Issue                                    
02-28-07 05:18  amckinle       Status                   new => assigned     
02-28-07 05:18  amckinle       Assigned To               => buildroot       
02-28-07 05:18  amckinle       File Added: Config.in                        
03-01-07 14:56  bifferos       Note Added: 0002192                          
======================================================================

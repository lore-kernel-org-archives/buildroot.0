From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 15 May 2008 08:44:45 -0700
Subject: [Buildroot] [buildroot 0003324]: problem: run cross compiled
	asterisk on openwrt
Message-ID: <43fa07482b616120f996b90eab5c544e@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3324 
====================================================================== 
Reported By:                gebecom
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3324
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-15-2008 08:08 PDT
Last Modified:              05-15-2008 08:44 PDT
====================================================================== 
Summary:                    problem: run cross compiled asterisk on openwrt
Description: 
i have asterisk corss compiled and ported on openwrt. But wenn i under
/opt/sbin/ run ./asterisk , is the error: Unable to open pid file
'/opt/var/run/asterisk.pid'; No such file or directory.      wenn i run
./rasterisk  (-r), is the error : Unable to connect to remote asterisk
(does /opt/var/run/asterisk.ctl exist?)    wenn i run ./rasterisk -vvvvvvc
 , is the error: Cannot read termcap database; using dumb terminal
settings. Unable to remote asterisk (does /opt/var/run/asterisk.ctl
exist?)
Anyone can help me?
where is the error?
thanks in advance!!!!
====================================================================== 

---------------------------------------------------------------------- 
 Correa - 05-15-08 08:44  
---------------------------------------------------------------------- 
OpenWRT and Buildroot are not the same project. Did you try it with
buildroot? 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-15-08 08:08  gebecom        New Issue                                    
05-15-08 08:08  gebecom        Status                   new => assigned     
05-15-08 08:08  gebecom        Assigned To               => buildroot       
05-15-08 08:44  Correa         Note Added: 0007704                          
======================================================================

From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 19 May 2008 06:16:24 -0700
Subject: [Buildroot] [buildroot 0003324]: problem: run cross compiled
	asterisk on openwrt
Message-ID: <fe5b2b7fd8f9a3550c00f1e0f1787191@busybox.net>
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
Last Modified:              05-19-2008 06:16 PDT
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

---------------------------------------------------------------------- 
 gebecom - 05-19-08 06:16  
---------------------------------------------------------------------- 
yes. i have with buildroot cross compiled. And now i have cross-compiled
asterisk port to openwrt. But i can not the problem  solve. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-15-08 08:08  gebecom        New Issue                                    
05-15-08 08:08  gebecom        Status                   new => assigned     
05-15-08 08:08  gebecom        Assigned To               => buildroot       
05-15-08 08:44  Correa         Note Added: 0007704                          
05-19-08 06:14  gebecom        Issue Monitored: gebecom                     
05-19-08 06:16  gebecom        Note Added: 0007824                          
======================================================================

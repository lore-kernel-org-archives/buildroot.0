From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 8 Dec 2007 18:44:07 -0800
Subject: [Buildroot] [buildroot 0001659]: LSOF don't download from
	lsof.itap.purdue.edu
Message-ID: <6b999d4498e82df4f5ee08208487658e@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1659 
====================================================================== 
Reported By:                sushisan
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1659
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-08-2007 07:23 PST
Last Modified:              12-08-2007 18:44 PST
====================================================================== 
Summary:                    LSOF don't download from lsof.itap.purdue.edu
Description: 
ftp lsof.itap.purdue.edu respond:

Connected to lsof.itap.purdue.edu (128.210.7.20).
530-The name server used by lsof.itap.purdue.edu cannot convert your
network
530-address to a host name and back to your network address.  Therefore,
530-lsof.itap.purdue.edu will not accept the connection.  Consult with
your
530-DNS provider to determine why DNS lookups do not match correctly for
530-your network address and host name.
530-
530-Even without having proper DNS reverse lookup, you may be able to get
530-lsof from one of these mirror sites:
530-
530- ftp://ftp.cerias.purdue.edu/pub/tools/unix/sysutils/lsof
530- ftp://ftp.tau.ac.il/pub/unix/admin
530- ftp://ftp.cert.dfn.de/pub/tools/admin/lsof
530- ftp://ftp.fu-berlin.de/pub/unix/tools/lsof
530- ftp://ftp.kaizo.org/pub/lsof/
530- ftp://ftp.tu-darmstadt.de/pub/sysadmin/lsof
530- ftp://ftp.tux.org/pub/sites/vic.cc.purdue.edu/tools/unix/lsof
530- ftp://gd.tuwien.ac.at/utils/admin-tools/lsof
530- ftp://sunsite.ualberta.ca/pub/Mirror/lsof
530- ftp://the.wiretapped.net/pub/security/host-security/lsof/

====================================================================== 

---------------------------------------------------------------------- 
 sushisan - 12-08-07 18:44  
---------------------------------------------------------------------- 
This patch change the ftp to the forst mirror 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-08-07 07:23  sushisan       New Issue                                    
12-08-07 07:23  sushisan       Status                   new => assigned     
12-08-07 07:23  sushisan       Assigned To               => buildroot       
12-08-07 18:43  sushisan       File Added: br2-lsof.patch                    
12-08-07 18:44  sushisan       Note Added: 0003064                          
======================================================================

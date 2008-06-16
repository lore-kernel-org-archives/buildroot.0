From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 16 Jun 2008 04:43:23 -0700
Subject: [Buildroot] [buildroot 0003814]: libogg & libvorbis instalation
	fails
Message-ID: <7522036b51cbaa876f9bc3ac87009de3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been RESOLVED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3814 
====================================================================== 
Reported By:                tklas
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3814
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     resolved
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             06-16-2008 04:14 PDT
Last Modified:              06-16-2008 04:43 PDT
====================================================================== 
Summary:                    libogg & libvorbis instalation fails
Description: 
Ogg and Vorbis libraries fails to install. I changed libogg.mk and
libvorbis.mk (attached patch) and it works. But I'm not sure if it is
correct, please check it.

====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 06-16-08 04:43  
---------------------------------------------------------------------- 
Thanks, but this is already fixed in trunk (actually, the header install
targets have been removed as the global BR2_HAVE_DEVFILES option handles
it) 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-16-08 04:14  tklas          New Issue                                    
06-16-08 04:14  tklas          Status                   new => assigned     
06-16-08 04:14  tklas          Assigned To               => buildroot       
06-16-08 04:14  tklas          File Added: vorbis_install.patch                 
  
06-16-08 04:43  jacmet         Status                   assigned => resolved
06-16-08 04:43  jacmet         Resolution               open => fixed       
06-16-08 04:43  jacmet         Note Added: 0008314                          
======================================================================

From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 23 Jul 2008 02:45:21 -0700
Subject: [Buildroot] [buildroot 0002784]: setserial build failure
Message-ID: <5e433bdcb6cf87b21b853cc7ababc358@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2784 
====================================================================== 
Reported By:                davidg
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2784
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-03-2008 13:08 PDT
Last Modified:              07-23-2008 02:45 PDT
====================================================================== 
Summary:                    setserial build failure
Description: 
The setserial version in packages/setserial/setserial.mk doesn't exist at
the download site.
====================================================================== 

---------------------------------------------------------------------- 
 artemys - 07-23-08 02:45  
---------------------------------------------------------------------- 
Bug still here on latest SVN revision. Patch not valid anymore as
setserial_2.17-44.1.diff.gz not available on debian mirror.
setserial_2.17-44.2.diff.gz is available but doesn't apply
successfully...

If changing SETSERIAL_SITE to 
http://security.ubuntu.com/ubuntu/pool/main/s/setserial/ compilation is
working again... 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-03-08 13:08  davidg         New Issue                                    
04-03-08 13:08  davidg         Status                   new => assigned     
04-03-08 13:08  davidg         Assigned To               => buildroot       
04-03-08 13:08  davidg         File Added: setserial_version.patch              
     
07-23-08 02:45  artemys        Note Added: 0009914                          
======================================================================

From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 24 Apr 2007 06:44:22 -0700
Subject: [Buildroot] [buildroot 0001325]: added libsndfile
Message-ID: <159caf774e8f355841caff0365508b31@buildroot.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1325 
====================================================================== 
Reported By:                zonque
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1325
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             04-23-2007 21:35 PDT
Last Modified:              04-24-2007 06:44 PDT
====================================================================== 
Summary:                    added libsndfile
Description: 
Libsndfile is a C library for reading and writing files containing sampled
sound (such as MS Windows WAV and the Apple/SGI AIFF format) through one
standard library interface. It is released in source code format under the
Gnu Lesser General Public License.

This patch adds support for building this library.
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 04-24-07 06:44  
---------------------------------------------------------------------- 
Thanks. Committed as r18517 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-23-07 21:35  zonque         New Issue                                    
04-23-07 21:35  zonque         Status                   new => assigned     
04-23-07 21:35  zonque         Assigned To               => buildroot       
04-23-07 21:35  zonque         File Added: br2-libsndfile.gz                    
04-24-07 06:44  jacmet         Status                   assigned => closed  
04-24-07 06:44  jacmet         Note Added: 0002330                          
======================================================================

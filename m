From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 8 Jan 2008 11:38:03 -0800
Subject: [Buildroot] [buildroot 0001914]: many packages do not run
	CONFIG_UPDATE
Message-ID: <e2557627849e8ab8fe735ffaa50ce492@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1914 
====================================================================== 
Reported By:                dann
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1914
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-08-2008 11:38 PST
Last Modified:              01-08-2008 11:38 PST
====================================================================== 
Summary:                    many packages do not run CONFIG_UPDATE
Description: 
Many packages do not run ${CONFIG_UPDATE} so they cannot be compiled on
platforms
that require a more up to date config.guess and config.sub that what is
shipped with the package.

A patch to do that for a few packages is attached.

Please check it in.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-08-08 11:38  dann           New Issue                                    
01-08-08 11:38  dann           Status                   new => assigned     
01-08-08 11:38  dann           Assigned To               => buildroot       
01-08-08 11:38  dann           File Added: buildroot-CONFIG_UPDATE.patch        
           
======================================================================

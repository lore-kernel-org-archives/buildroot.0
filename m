From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 25 Aug 2008 02:05:21 -0700
Subject: [Buildroot] [buildroot 0004274]: psmisc does not build if locales
	enabled
Message-ID: <18dbd68e32a67e246f83cf347797df24@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=4274 
====================================================================== 
Reported By:                pepe
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4274
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             07-23-2008 15:43 PDT
Last Modified:              08-25-2008 02:05 PDT
====================================================================== 
Summary:                    psmisc does not build if locales enabled
Description: 
psmisc supports localization but does not depend on gettext/libintl, nor
does it find the libs.

The makefile stuff always seemed obscure too me, but the attached fix
seems to work with and without localization.
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 08-25-08 02:05  
---------------------------------------------------------------------- 
Thanks - Fixed in r23199 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-23-08 15:43  pepe           New Issue                                    
07-23-08 15:43  pepe           Status                   new => assigned     
07-23-08 15:43  pepe           Assigned To               => buildroot       
07-23-08 15:43  pepe           File Added: psmisc_intl.patch                    
08-25-08 02:05  jacmet         Status                   assigned => closed  
08-25-08 02:05  jacmet         Note Added: 0010754                          
======================================================================

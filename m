From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 23 Jul 2008 15:43:39 -0700
Subject: [Buildroot] [buildroot 0004274]: psmisc does not build if locales
	enabled
Message-ID: <23746d211e597ead303f9014d3f42a46@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             07-23-2008 15:43 PDT
Last Modified:              07-23-2008 15:43 PDT
====================================================================== 
Summary:                    psmisc does not build if locales enabled
Description: 
psmisc supports localization but does not depend on gettext/libintl, nor
does it find the libs.

The makefile stuff always seemed obscure too me, but the attached fix
seems to work with and without localization.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-23-08 15:43  pepe           New Issue                                    
07-23-08 15:43  pepe           Status                   new => assigned     
07-23-08 15:43  pepe           Assigned To               => buildroot       
07-23-08 15:43  pepe           File Added: psmisc_intl.patch                    
======================================================================

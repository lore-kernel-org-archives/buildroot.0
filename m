From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 24 Aug 2007 14:28:27 -0700
Subject: [Buildroot] [buildroot 0001472]: r19050 should be reverted or
	reworked
Message-ID: <ea5899336b303af729d341b180546ca2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1472 
====================================================================== 
Reported By:                tharvey
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1472
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-24-2007 14:28 PDT
Last Modified:              08-24-2007 14:28 PDT
====================================================================== 
Summary:                    r19050 should be reverted or reworked
Description: 
hostap and hostapd are not the same thing.  hostap is the PRISM driver
whereas hostapd is a AP configuration daemon that supports many WiFi
drivers.

r19050 lists the hostapd tarball as the source for the driver which is
incorrect

perhaps http://hostap.epitest.fi/releases/hostap-driver-0.4.9.tar.gz
should be used instead although I really don't use the 'hostap' driver so
I wouldn't know if thats the latest.

I ran into this while I was creating a package for 'hostapd' which
conflicted with hostap as it was incorrectly referring to the same source
package

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-24-07 14:28  tharvey        New Issue                                    
08-24-07 14:28  tharvey        Status                   new => assigned     
08-24-07 14:28  tharvey        Assigned To               => buildroot       
======================================================================

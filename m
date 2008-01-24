From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 24 Jan 2008 10:24:00 -0800
Subject: [Buildroot] [buildroot 0001939]: make source fails on inability to
	find the lm-sensors file.
Message-ID: <c86f927fb57ed8fc1bb351fa3110fff4@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1939 
====================================================================== 
Reported By:                Shingoshi
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1939
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-17-2008 05:37 PST
Last Modified:              01-24-2008 10:23 PST
====================================================================== 
Summary:                    make source fails on inability to find the
lm-sensors file.
Description: 
File is no longer available on the net.
lm-sensors_2.10.4-3.diff.gz
====================================================================== 

---------------------------------------------------------------------- 
 alisonken1 - 01-24-08 10:23  
---------------------------------------------------------------------- 
lm-sensors version has changed.
Change the following in packages/lm-sensors/lm-sensors.mk file:

$LM_SENSORS_VERSION:=2.10.5
$LM_SENSORS_PATCH:=[]-5.diff.gz 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-17-08 05:37  Shingoshi      New Issue                                    
01-17-08 05:37  Shingoshi      Status                   new => assigned     
01-17-08 05:37  Shingoshi      Assigned To               => buildroot       
01-24-08 10:23  alisonken1     Note Added: 0003509                          
======================================================================

From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 30 Jan 2008 05:53:03 -0800
Subject: [Buildroot] [buildroot 0002014]: dbus should create /var/lib/dbus
Message-ID: <369d29a97f92ef7cb8398c85bc43f877@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2014 
====================================================================== 
Reported By:                ikonst
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2014
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-30-2008 05:53 PST
Last Modified:              01-30-2008 05:53 PST
====================================================================== 
Summary:                    dbus should create /var/lib/dbus
Description: 
The dbus package should create the directory /var/lib/dbus since the
S97messagebus script relies on it.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-30-08 05:53  ikonst         New Issue                                    
01-30-08 05:53  ikonst         Status                   new => assigned     
01-30-08 05:53  ikonst         Assigned To               => buildroot       
01-30-08 05:53  ikonst         File Added: buildroot-dbus-var-lib.patch         
          
======================================================================

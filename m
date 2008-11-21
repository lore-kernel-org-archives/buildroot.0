From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 21 Nov 2008 06:01:56 -0800
Subject: [Buildroot] [buildroot 0006414]: makedevs won't compile on Ubuntu
	8.10, fix included: Use sync(2) instead running /bin/sync
Message-ID: <00d2552959ec45d2d49611087c53803b@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=6414 
====================================================================== 
Reported By:                blf
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   6414
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-21-2008 06:01 PST
Last Modified:              11-21-2008 06:01 PST
====================================================================== 
Summary:                    makedevs won't compile on Ubuntu 8.10, fix included:
Use sync(2) instead running /bin/sync
Description: 

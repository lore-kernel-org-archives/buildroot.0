From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:53 -0800
Subject: [Buildroot] [buildroot 0000367]: [Busybox commands and options doc
	link] Bad web browser display
Message-ID: <036a749ece6cfd2b9694abb0e4927e4c@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=367 
====================================================================== 
Reported By:                mdeschamps
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   367
Category:                   Website
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-08-2005 01:05 PDT
Last Modified:              02-12-2007 05:48 PST
====================================================================== 
Summary:                    [Busybox commands and options doc link] Bad web
browser display
Description: 
http://bugs.busybox.net/proj_doc_page.php presents a link leading to
http://bugs.busybox.net/file_download.php?file_id=1&type=doc
Upon clicking my firefox 1.0.4 (Mozilla/5.0 (X11; U; Linux i686; fr-FR;
rv:1.7.8) Gecko/20050511 Firefox/1.0.4) 

I got the source code displayed in plain (not interpreted by firefox ?)
-------
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>BusyBox - The Swiss Army Knife of Embedded Linux</title>
<link rev="made" href="mailto:root@localhost" />
</head>

<body style="background-color: white">

<p><a name="__index__"></a></p>
<!-- INDEX BEGIN -->
<!--

<ul>

	<li>#name</li>
	<li>#syntax</li>
	<li>#description</li>
	<li>#usage</li>
	<li>#common_options</li>
	<li>#commands</li>
	<li>#command_descriptions</li>
	<li>#libc_nss</li>
	<li>#maintainer</li>
	<li>#authors</li>
</ul>
-->
<!-- INDEX END -->

<p>
.
.
.
--------- etc, etc...




====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-08-05 01:05  mdeschamps     New Issue                                    
08-08-05 01:05  mdeschamps     Status                   new => assigned     
08-08-05 01:05  mdeschamps     Assigned To               => uClibc          
01-25-06 06:29  prpplague      Status                   assigned => closed  
01-25-06 06:29  prpplague      Resolution               open => no change
required
01-25-06 06:29  prpplague      Additional Information Updated                   

02-12-07 05:48  vapier         Status                   closed => assigned  
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
======================================================================

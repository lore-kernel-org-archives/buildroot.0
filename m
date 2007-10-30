From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 30 Oct 2007 14:43:01 -0700
Subject: [Buildroot] [buildroot 0001473]: curl site is not up to date and
	libcurl is not installed as expected
Message-ID: <654846609c209fdb6f3e9954625a938f@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1473 
====================================================================== 
Reported By:                tharvey
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1473
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             08-24-2007 14:31 PDT
Last Modified:              10-30-2007 14:43 PDT
====================================================================== 
Summary:                    curl site is not up to date and libcurl is not
installed as expected
Description: 
the CURL_SITE is no longer active and needs to be updated

additionally, BR2_PACKAGE_LIBCURL should build and install libcurl to the
target filesystem, instead it only builds it into STAGING_DIR


====================================================================== 

---------------------------------------------------------------------- 
 UlfSamuelsson - 10-30-07 14:43  
---------------------------------------------------------------------- 
Fixed since sometime in svn. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-24-07 14:31  tharvey        New Issue                                    
08-24-07 14:31  tharvey        Status                   new => assigned     
08-24-07 14:31  tharvey        Assigned To               => buildroot       
08-24-07 14:31  tharvey        File Added: buildroot-curl.patch                 
  
10-30-07 14:43  UlfSamuelsson  Status                   assigned => closed  
10-30-07 14:43  UlfSamuelsson  Note Added: 0002880                          
======================================================================

From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 6 Jun 2008 07:58:34 -0700
Subject: [Buildroot] [buildroot 0003624]: new package for boost library
	(boost.org)
Message-ID: <9fe6e5a9129aa63b574950395360fa9e@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3624 
====================================================================== 
Reported By:                rhunger
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3624
Category:                   New Features
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-03-2008 10:47 PDT
Last Modified:              06-06-2008 07:58 PDT
====================================================================== 
Summary:                    new package for boost library (boost.org)
Description: 
Attached patch adds a new package for boost libraries from
http://www.boost.org/.
Boost provides free peer-reviewed portable C++ source libraries.

====================================================================== 

---------------------------------------------------------------------- 
 rhunger - 06-06-08 07:58  
---------------------------------------------------------------------- 
Patch feature-boost-1.35.00-version2.patch contains an improved patch for
boost.

- corrected build and config dependencies for libboost_python on python
- corrected include path for python
- added help textes for each lib 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-03-08 10:47  rhunger        New Issue                                    
06-03-08 10:47  rhunger        Status                   new => assigned     
06-03-08 10:47  rhunger        Assigned To               => buildroot       
06-03-08 10:47  rhunger        File Added: feature-boost-1.35.00.patch          
         
06-04-08 00:16  rhunger        Issue Monitored: rhunger                     
06-06-08 07:55  rhunger        File Added: feature-boost-1.35.00-version2.patch 
                  
06-06-08 07:58  rhunger        Note Added: 0008114                          
======================================================================

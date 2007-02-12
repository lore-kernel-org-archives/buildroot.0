From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:51:06 -0800
Subject: [Buildroot] [buildroot 0000196]: libelf-0.8.5 wrong location
Message-ID: <49c79d1298e28cdc5c04024bde9baaeb@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=196 
====================================================================== 
Reported By:                Oliv
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   196
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-29-2005 07:53 PST
Last Modified:              02-12-2007 05:51 PST
====================================================================== 
Summary:                    libelf-0.8.5 wrong location
Description: 
when wget tries to retrieve libelf an error occurs 'cause his location has
changed:
wget --passive-ftp -P /data/LiveCD/buildroot/dl
http://www.stud.uni-hannover.de/~michael/software//libelf-0.8.5.tar.gz
--17:47:30-- 
http://www.stud.uni-hannover.de/%7Emichael/software/libelf-0.8.5.tar.gz
           => `/data/LiveCD/buildroot/dl/libelf-0.8.5.tar.gz'
R?solution de www.stud.uni-hannover.de... 130.75.176.2
Connexion vers www.stud.uni-hannover.de[130.75.176.2]:80...connect?.
requ?te HTTP transmise, en attente de la r?ponse...404 Not Found
17:47:30 ERREUR 404: Not Found.

make: *** [/data/LiveCD/buildroot/dl/libelf-0.8.5.tar.gz] Erreur 1


the "new" URL is: http://www.mr511.de/software/
======================================================================
Relationships       ID      Summary
----------------------------------------------------------------------
duplicate of        0000179 libelf Source URI is broken
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-29-05 07:53  Oliv           New Issue                                    
03-29-05 12:11  vapier         Relationship added       duplicate of 0000179
03-29-05 12:11  vapier         Duplicate ID             0 => 179            
03-29-05 12:11  vapier         Status                   assigned => resolved
03-29-05 12:11  vapier         Resolution               open => duplicate   
04-12-05 15:05  andersen       Status                   resolved => closed  
02-12-07 05:51  vapier         Status                   closed => assigned  
02-12-07 05:51  vapier         Assigned To              uClibc => buildroot 
======================================================================

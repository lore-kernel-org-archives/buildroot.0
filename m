From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 28 Feb 2008 07:29:57 -0800
Subject: [Buildroot] [buildroot 0002104]: grub_0.97-28.diff.gz no longer
	available from debian ftp site
Message-ID: <2bda1d795e9f2be2a98fd197f905206f@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=2104 
====================================================================== 
Reported By:                sharkconi
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2104
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             02-14-2008 01:31 PST
Last Modified:              02-28-2008 07:29 PST
====================================================================== 
Summary:                    grub_0.97-28.diff.gz no longer available from debian
ftp site
Description: 
Today, I want to install the grub, it can't get grub_0.97-28.diff.gz from
the debian ftp site, because debian has remove the source file. 
====================================================================== 

---------------------------------------------------------------------- 
 fabo - 02-14-08 02:02  
---------------------------------------------------------------------- 
[2008-02-13] Accepted 0.97-31 in unstable (low) (Robert Millan)

0.97-29 and 0.97-30 are also available.

grub (0.97-31) unstable; urgency=low

  * README.Debian, NEWS.Debian: Recommend that users invoke update-grub
    directly without hardcoding its path.  (Closes:
http://busybox.net/bugs/view.php?id=465235)
  * savedefault command is now issued when enabled via menu.lst variable
    of the same name, when user accepts the implications (note, that in
    the default configuration it was already disabled).
    (Closes: http://busybox.net/bugs/view.php?id=393079,
http://busybox.net/bugs/view.php?id=462701)
  * Restrict license in debian/copyright to GPLv2-only.  (Closes:
http://busybox.net/bugs/view.php?id=438177)

 -- Robert Millan <rmh@aybabtu.com>  Mon, 11 Feb 2008 17:32:57 +0100

grub (0.97-30) unstable; urgency=low

  * update-grub:
    - Update Marc Haber's address.  (Closes:
http://busybox.net/bugs/view.php?id=432700)
    - Make it more friendly to its GRUB 2 compatibiliy fork.
  * control (Build-Depends-Indep): Remove e2tools and mkisofs.
  * patches/ext3_256byte_inode.diff: New.  Support 256-byte inodes in
ext3.
    Thanks Stefan Lippers-Hollmann.  (Closes:
http://busybox.net/bugs/view.php?id=463236)

 -- Robert Millan <rmh@aybabtu.com>  Sun,  3 Feb 2008 01:19:47 +0100

grub (0.97-29) unstable; urgency=low

  [ Otavio Salvador ]
  * update-grub: Improve sorting with mixed numeric and non-numeric
    characters. Thanks dann frazier <dannf@debian.org> for the
    patch. Closes: http://busybox.net/bugs/view.php?id=422759

  [ Robert Millan ]
  * Add myself to Uploaders.
  * update-grub: Remove core.img handling.  It was becoming meaningless
    without presence of the grub-pc package.
  * control (Architecture): Replace any-* arches with the old, boring,
    hardcoded list.  (Closes: http://busybox.net/bugs/view.php?id=424510)
  * Get rid of grub-disk, mkbimage and grub-floppy.  They're deprecated
    in favour of grub-rescue-pc now.  (Closes:
http://busybox.net/bugs/view.php?id=399168,
http://busybox.net/bugs/view.php?id=250938,
http://busybox.net/bugs/view.php?id=429576,
    http://busybox.net/bugs/view.php?id=352731)

 -- Robert Millan <rmh@debian.org>  Tue, 26 Jun 2007 07:48:57 +0200 

---------------------------------------------------------------------- 
 sjhill - 02-28-08 07:29  
---------------------------------------------------------------------- 
Fixed in revision 21086 and confirmed working by Fathi. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-14-08 01:31  sharkconi      New Issue                                    
02-14-08 01:31  sharkconi      Status                   new => assigned     
02-14-08 01:31  sharkconi      Assigned To               => buildroot       
02-14-08 02:00  fabo           File Added: update_grub_patch_version.diff       
            
02-14-08 02:02  fabo           Note Added: 0004574                          
02-28-08 07:29  sjhill         Status                   assigned => closed  
02-28-08 07:29  sjhill         Note Added: 0005504                          
======================================================================

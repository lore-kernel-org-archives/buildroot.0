From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Thu, 05 Feb 2009 11:39:33 +0100
Subject: [Buildroot] cannot compute suffix of object files
Message-ID: <498AC1E5.6080707@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I try to install buildroot by testing the default configuration. I do a 
"make menuconfig" and I exit it without touching any setting. After I do 
a "make". I that correct ?

The problem is that the build failed on the 2009.02-RC3 and on the 
Subversion revision 25244. The error is alway the same:

checking for suffix of object files... configure: error: cannot compute 
suffix of object files: cannot compile

More details on the attached files. The host is a Debian Etch x86_64.

Please help
-- 
Jean-Christian de Rivaz
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-2009.02-rc3.txt
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090205/4d611da5/attachment.txt>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-svn-25244.txt
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090205/4d611da5/attachment-0001.txt>

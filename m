From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 14 Apr 2009 01:20:13 +0200
Subject: [Buildroot] busybox date -> strftime in uclibc ?
Message-ID: <063BB46F407949EA846CD7BF20F05B85@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
I tried to discover why the result of date is not ok
it seems date call strftime, 
 
i tried 
 
export LC_TIME="en_US.UTF-8"
export TZ=UTC
 
but without luck
 
date is still showing wrong data :
 
# date
at at 14 01:14:18 UTC 2009
#
# date -R
at, 14 at 2009 01:14:32 +0000
 
What is wrong ?
 
bb is 1.13.3 uclibc 9.30.1
 
Johan
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090414/27adfbec/attachment.htm>

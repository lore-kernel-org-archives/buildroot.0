From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 21 May 2010 16:14:08 +0200
Subject: [Buildroot] libglib2 solved
Message-ID: <CE4DE14F770C449092622CC4E29235E7@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
After some searching i found UCLIBC_HAS_LIBRESOLV_STUB should be turned on
in order to get libresolv. 
libglib2 is happy now about res_query , but  now complains about gettext.
I guess i need to do a distclean  and rebuild from scratch ( i think this is
a must after changing the toolchain settings )
 
There is hope...
 
Johan
 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100521/4fd55ece/attachment.html>

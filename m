From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 22 May 2010 00:53:08 +0200
Subject: [Buildroot] a remark on the default uclibc0.9.31 config
Message-ID: <8A567CE999EB4F76B3865E87F6BC7AC4@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi 
 
With this set in the default uclibc config
 
FORCE_SHAREABLE_TEXT_SEGMENTS=y
 
I got this:when starting mpg123
 
# mpg123
Can't modify /usr/lib/libmpg123.so.0's text section. Use GCC option -fPIC
for shared objects, please.
 
So i turned this option off and after rebuild the mpg123  does no longer
produce this error.
 
There might be more programs sensitive to this setting.
 
Johan
 
 

 
 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100522/a338b90a/attachment.html>

From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 20 May 2010 00:08:43 +0200
Subject: [Buildroot] BUG libglib2 build  fails  on res_query
Message-ID: <A0DC7146A8744029BA780D738D86D249@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
in an attempt to build libsoup that depends on libglib2 
 
i got this error, and i don't know how to resolve the missng res_query
 
i am using 2010.5rc2  with uclibc 0.9.31 and building for geode (i586)
 
snip
 
checking for wspiapi.h... no
checking for strndup... yes
checking for setresuid... yes
checking for setreuid... yes
checking sys/prctl.h usability... yes
checking sys/prctl.h presence... yes
checking for sys/prctl.h... yes
checking arpa/nameser_compat.h usability... yes
checking arpa/nameser_compat.h presence... yes
checking for arpa/nameser_compat.h... yes
checking for res_query... no
checking for res_query in -lresolv... no
checking for res_query in -lresolv (alternate version)... no
checking for res_query in -lbind... no
configure: error: res_query not found
make: ***
[/home/johan/buildroot/output/build/libglib2-2.22.5/.stamp_configured] Error
1

Johan
 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100520/da1c4a9a/attachment.html>

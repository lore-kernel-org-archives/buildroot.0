From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 19 May 2010 12:06:31 +0200
Subject: [Buildroot] change of staging_dir paths ?
Message-ID: <2040226006DA4CF38CBF75F437EF92EC@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter 
 
I am currently using the 2010.05rc2 (before i used 2010.02)
 
I noticed that the path to the tools no longer is  
 
buildroot/output/build/staging_dir/usr/bin
 but  now is
buildroot/output/staging/usr/bin  
 
Has this changed in 2010.05rc2 ? 
My path was still pointing to 
buildroot/output/build/staging_dir/usr/bin
but changing it to buildroot/output/staging/usr/bin   did not fix my problem
building QT (still sooms tu use /usr/bin/ld of my host )
 
Johan
 
 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100519/1ca82ee1/attachment.htm>

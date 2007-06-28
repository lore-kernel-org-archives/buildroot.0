From: Paul Kavan <pkavan@gmail.com>
Date: Thu, 28 Jun 2007 14:52:21 -0500
Subject: [Buildroot] Bad aterisk url
Message-ID: <61c0054e0706281252s3d40beb3h476a2dbd8dddc921@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all:

Trying to include asterisk in my build fails with:


wget --passive-ftp -P /home/grhuser/buildroot/dl
http://www.zlib.net//zlib-1.2.3.tar.bz2
--14:48:33--  http://www.zlib.net//zlib-1.2.3.tar.bz2
           => `/home/grhuser/buildroot/dl/zlib-1.2.3.tar.bz2'
Resolving www.zlib.net... 69.73.181.135
Connecting to www.zlib.net|69.73.181.135|:80... failed: No route to host.
make: *** [/home/grhuser/buildroot/dl/zlib-1.2.3.tar.bz2] Error 1

Checked the url myself. It is a dead link. Is there an alternative to this.
Searched the archives and did not find one.

Thanks.

Paul
-- 
***************************************
Paul David Kavan
Project Engineer
GRH Electronics, Inc.
402-734-4900
pkavan at gmail.com
***************************************
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070628/b2137b5c/attachment.htm 

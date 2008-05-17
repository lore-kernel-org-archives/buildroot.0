From: Conny Marco =?ISO-8859-1?Q?Menebr=F6cker?= <menebroecker@web.de>
Date: Sat, 17 May 2008 20:40:08 +0200
Subject: [Buildroot] How to handle with shared objects?
Message-ID: <1211049608.3289.14.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I added a new package to buildroot and it contains '.so' files.
Normaly I would add the path to /etc/ld.so.conf and run ldconfig.
But there is no /etc/ld.so.conf and ldconfig on my system.
But there is a /etc/ld.so.cache. So, I think there might be a file where
I can add the path and the /etc/ld.so.cache will be created at building
buildroot. Or I am wrong?

Conny
-- 
Don't send me an personal e-mail since it will be filtered by my
spamfilter.

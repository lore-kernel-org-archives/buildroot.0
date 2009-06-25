From: Neil Cherry <ncherry@linuxha.com>
Date: Thu, 25 Jun 2009 03:56:35 -0400
Subject: [Buildroot] Problems compiling microperl
Message-ID: <4A432DB3.2030206@linuxha.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've gotten most of buildroot to compile. I'm having problems
with microperl. The first first error I get is (trimmed):

x2p/makefile: No such file or directory

So I manually create the Makefile (Makefile.SH, then copy it to
makefile). It wil then continue to compile but fail with:

ext/IPC/SysV/SysV.c: No such file or directory

Any ideas?

-- 
Linux Home Automation         Neil Cherry       ncherry at linuxha.com
http://www.linuxha.com/                         Main site
http://linuxha.blogspot.com/                    My HA Blog
Author of:    	Linux Smart Homes For Dummies

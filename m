From: Neil Cherry <ncherry@linuxha.com>
Date: Fri, 26 Jun 2009 00:22:08 -0400
Subject: [Buildroot] Problems compiling microperl
In-Reply-To: <4A432DB3.2030206@linuxha.com>
References: <4A432DB3.2030206@linuxha.com>
Message-ID: <4A444CF0.6040001@linuxha.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Neil Cherry wrote:
> I've gotten most of buildroot to compile. I'm having problems
> with microperl. The first first error I get is (trimmed):
> 
> x2p/makefile: No such file or directory
> 
> So I manually create the Makefile (Makefile.SH, then copy it to
> makefile). It wil then continue to compile but fail with:
> 
> ext/IPC/SysV/SysV.c: No such file or directory
> 
> Any ideas?

I went into the ext/IPC/SysV/ directory, did a perl Makefile.PL
then a make SysV.c, returned to the main directory and simply
typed make. It worked now (???) not sure why this is different
than previous attempts (I did do a make clean in the Perl directory).

Anyway it's now kind of working. I need to figure out what file
to modify to add the extra commands.

-- 
Linux Home Automation         Neil Cherry       ncherry at linuxha.com
http://www.linuxha.com/                         Main site
http://linuxha.blogspot.com/                    My HA Blog
Author of:    	Linux Smart Homes For Dummies

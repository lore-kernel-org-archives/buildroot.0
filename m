From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sat, 7 May 2016 14:16:37 +0200
Subject: [Buildroot] Qt5 fails to compile with gcc 6.1.0
In-Reply-To: <20160507141147.65fe012a@free-electrons.com>
References: <572DBAB9.3060607@gmail.com> <572DD6A2.8030406@gmail.com>
 <20160507141147.65fe012a@free-electrons.com>
Message-ID: <572DDCA5.8060204@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 07/05/2016 14:11, Thomas Petazzoni ha scritto:
> Every time you do such tests, please make sure you do a complete 
> rebuild, i.e: make clean all If it still doesn't work for you after a 
> "make clean all", then please report the version of Buildroot being 
> used, as well as the .config file that reproduces the problem.

Yes, I always "make clean all".

Attached there is the .config file.
The version is Buildroot 2016.05-git-01197-gda433d6-dirty

-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/xml
Size: 94390 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160507/0586e04f/attachment.wsdl>

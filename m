From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 14:11:47 +0200
Subject: [Buildroot] Qt5 fails to compile with gcc 6.1.0
In-Reply-To: <572DD6A2.8030406@gmail.com>
References: <572DBAB9.3060607@gmail.com>
	<572DD6A2.8030406@gmail.com>
Message-ID: <20160507141147.65fe012a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 7 May 2016 13:50:58 +0200, Marco Trapanese wrote:

> I don't know how to configure a working environment with Qt5 and bluez5.
> I will try with musl, but I confess I really don't understand what's happening.

Every time you do such tests, please make sure you do a complete
rebuild, i.e:

	make clean all

If it still doesn't work for you after a "make clean all", then please
report the version of Buildroot being used, as well as the .config file
that reproduces the problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

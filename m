From: Thomas <tokant@gmx.net>
Date: Wed, 03 Feb 2010 12:31:50 +0100
Subject: [Buildroot] AT91, missing kernel include files
In-Reply-To: <1264861629.5256.24.camel@bernd-desktop>
References: <1264861629.5256.24.camel@bernd-desktop>
Message-ID: <1265196710.8149.2.camel@bernd-desktop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
> 
> If I compare the kernel include files in include/asm-arm/, I can see,
> that there are a lot of files and directories missing in the 2.6.28.2
> kernel. How do I get the include files?

I guess now, this is not a buildroot issue. The include files were
apparently removed from the kernel tree around the 2.6.23 versions.

Thanks, Thomas.

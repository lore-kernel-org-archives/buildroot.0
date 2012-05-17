From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 17 May 2012 20:12:22 +0200
Subject: [Buildroot] microblazeel_v2 are 64-bit executables
In-Reply-To: <20120516192453.7GAXH.715646.imail@fed1rmwml114>
 (chrisgriffith@cox.net's message of "Wed, 16 May 2012 16:24:53 -0700")
References: <20120516192453.7GAXH.715646.imail@fed1rmwml114>
Message-ID: <87ipfupth5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>   <chrisgriffith@cox.net> writes:

Hi,

 > Hi everyone, I hope this is a good place for this, I did search the
 > archives and the buglist, and I think it's more informational than a
 > bug.  As background, I'm using buildroot-2012.05-rc1 on Ubuntu 11.10
 > inside VirtualBox on Windows 7, targeting a MicroBlaze AXI system
 > with MMU on a Xilinx ML605 development board.

 > So it's not a dealbreaker to use the external V1 tools and say so in
 > the buildroot config, I just thought you might like to know that the
 > default downloaded MB toolchain doesn't always work from the get-go
 > and maybe put in a warning or something.

Ahh, interesting. Strange that they did a 64bit build. Is there any
functional reason to use the v2 toolchain rather than v1?

-- 
Bye, Peter Korsgaard

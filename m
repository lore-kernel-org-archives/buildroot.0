From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 16:30:34 +0100
Subject: [Buildroot] [PATCH] autobuild-run: Add an exception for CS
 nios2 2016.05 with boost package.
In-Reply-To: <1477734205-13453-1-git-send-email-romain.naour@gmail.com>
References: <1477734205-13453-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161101163034.5d110620@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Oct 2016 11:43:25 +0200, Romain Naour wrote:
> This toolchain is affected by PR19405 and instead of adding a toolchain
> dependency on boost package and it's reverse dependencies, use an
> autobuilder exception.
> 
> https://sourceware.org/bugzilla/show_bug.cgi?id=19405
> 
> Fixes:
> http://autobuild.buildroot.net/results/620/620b1cc2165a6d55c180b890fdb652f3a03e1ded
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Thanks, I've applied, after amending the commit log and the comment in
the code to indicate that you're talking about a binutils PR.
Otherwise, one might wonder which component of the toolchain is
affected by PR19405.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

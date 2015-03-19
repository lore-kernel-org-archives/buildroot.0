From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Mar 2015 13:37:15 +0100
Subject: [Buildroot] [PATCH v2] package/perf: fix build failures with
 high 'make -j' values
In-Reply-To: <1426749565-3888-1-git-send-email-steven@uplinklabs.net>
References: <1426749565-3888-1-git-send-email-steven@uplinklabs.net>
Message-ID: <20150319133715.13071852@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steven Noonan,

On Thu, 19 Mar 2015 00:19:25 -0700, Steven Noonan wrote:
> The 'perf' Makefile is flaky on some kernel versions. It will still parallelize
> the build even with 'make -j1' because it explicitly invokes a sub-make with
> the correct flags. But the top-level make is not smart enough to handle large
> '-j' values.
> 
> Signed-off-by: Steven Noonan <steven@uplinklabs.net>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jan 2015 22:36:23 +0100
Subject: [Buildroot] [PATCH] dtc: install libfdt headers to staging
In-Reply-To: <dcb93a863d98147bb850079e63f6a45231e24660.1421390255.git.baruch@tkos.co.il>
References: <dcb93a863d98147bb850079e63f6a45231e24660.1421390255.git.baruch@tkos.co.il>
Message-ID: <20150116223623.204ce903@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Fri, 16 Jan 2015 08:37:35 +0200, Baruch Siach wrote:
> The newly introduced install-lib target that we use since commit 8b500c1b63dc
> (dtc: bump version to 1.4.1) does not install headers. Add install-includes to
> DTC_INSTALL_STAGING_CMDS to make dependent packages like kexec-lite build.
> 
> Fixes:
> http://autobuild.buildroot.net/results/515/515d32e45957e911fda6345f909fa9200df311ff/
> http://autobuild.buildroot.net/results/b09/b09f15c7b59e972d2180d071804810315d2ee047/
> http://autobuild.buildroot.net/results/023/02376cd3dccc98d10a58e5398b9f8db75239f263/
> ...
> 
> Cc: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 15:40:52 +0200
Subject: [Buildroot] [PATCH v2] toolchain: Bump ARC tools to
 arc-2017.03-rc1
In-Reply-To: <1492803331-31992-1-git-send-email-vzakhar@synopsys.com>
References: <1492803331-31992-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20170422154052.0ca416d5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Apr 2017 22:35:31 +0300, Vlad Zakharov wrote:
> This commit bumps ARC toolchain to arc-2017.03-rc1
> 
> Please note that it is a release candidate and it might contain some
> breakages, please don't use it for production builds.
> 
> Also I have updated patches for binutils as our source files in
> binutils differ comparing to 2.28.
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> ---
> Changes v1..v2
>   - fixed typos and styling issues

Applied to master, thanks. I've started the rebuild of the pre-built
ARC toolchain, and I'll deploy it to the autobuilders when ready.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

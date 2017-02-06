From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 18:58:23 +0100
Subject: [Buildroot] [PATCH][autobuild] autobuild-run: introduce
 "--tc-cfg-uri" option for toolchain configs URI
In-Reply-To: <1477045454-8660-1-git-send-email-vzakhar@synopsys.com>
References: <1477045454-8660-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20170206185823.16a934b5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Oct 2016 13:24:14 +0300, Vlad Zakharov wrote:
> This commit introduces "--tc-cfg-uri" option (short "-t").
> Described option is used to pass URI of file that contain
> toolchains configurations to be used in autobuilds.
> 
> Default value refers to standard buildroot autobuild toolchain
> configuration file:
> http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv
> 
> Such update allows users to add their own toolchain configurations
> to use in buildroot autobuilds.
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> ---
>  scripts/autobuild-run | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

I've changed the option to --toolchains-url and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

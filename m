From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 15:43:13 +0200
Subject: [Buildroot] [PATCH 1/4] sepolgen: allow compiling for target
In-Reply-To: <20170202224505.22882-1-Adamduskett@outlook.com>
References: <20170202224505.22882-1-Adamduskett@outlook.com>
Message-ID: <20170409154313.11c113d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Feb 2017 17:45:02 -0500, Adam Duskett wrote:
> Sepolgen is currently a host-only package, however it is a dependency
> of audit2allow.  This patch allows for sepolgen to be compiled for the
> target.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  package/Config.in            |  1 +
>  package/sepolgen/Config.in   |  9 +++++++++
>  package/sepolgen/sepolgen.mk | 19 +++++++++++++++++++
>  3 files changed, 29 insertions(+)
>  create mode 100644 package/sepolgen/Config.in

Applied to master with the following changes:

    [Thomas:
     - fix formatting of Config.in file
     - add missing dependencies inherited from the fact that the package
       selects python3.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

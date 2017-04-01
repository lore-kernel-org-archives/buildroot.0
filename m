From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 14:43:35 +0200
Subject: [Buildroot] [PATCH 1/2] package/xenomai: enable armv5tej support
In-Reply-To: <20170331202604.18153-1-romain.naour@gmail.com>
References: <20170331202604.18153-1-romain.naour@gmail.com>
Message-ID: <20170401144335.5a6e2240@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 Mar 2017 22:26:03 +0200, Romain Naour wrote:
> Apply a patch from Xenomai 2.6 [1].
> 
> Fixes:
> http://autobuild.buildroot.net/results/762/7623410a81b1587b33b4f4b9cf1572c872b8a6e9/build-end.log
> 
> [1] https://git.xenomai.org/xenomai-2.6.git/commit/?id=ebc2779baa222db4a5936c3d3022803355585b8c
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../xenomai/0002-arm-enable-armv5tej-support.patch | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/xenomai/0002-arm-enable-armv5tej-support.patch

Applied to master, thanks. Please submit the patch upstream, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

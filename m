From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jan 2016 23:26:36 +0100
Subject: [Buildroot] [PATCH] package/tremor: select libogg package
In-Reply-To: <1451745735-5358-1-git-send-email-romain.naour@gmail.com>
References: <1451745735-5358-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160102232636.0632fbd9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jan 2016 15:42:15 +0100, Romain Naour wrote:
> tremor depends on libogg package but doesn't select it
> in Config.in. so libogg build is trigged at Makefile level.
> 
> Since 28f67899e54f15c6e48484ea2976c3e431756bcb, the build
> stop if a package build is trigged at Makefile level without
> being selected at Config.in level.
> 
> Fixes:
> http://autobuild.buildroot.net/results/0da/0da3265f0f1e499f5d34ed32b0d13a2eda53f976
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/tremor/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

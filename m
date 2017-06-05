From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:52:37 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/exiv2: fix pthread detection
In-Reply-To: <20170604082714.26214-1-bernd.kuhls@t-online.de>
References: <20170604082714.26214-1-bernd.kuhls@t-online.de>
Message-ID: <20170605115237.158ead38@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Jun 2017 10:27:14 +0200, Bernd Kuhls wrote:
> This commit fixes an error during configure:
> 
> -- Check if compiler accepts -pthread
> CMake Error: TRY_RUN() invoked in cross-compiling mode, please set the
>  following cache variables appropriately:
>    THREADS_PTHREAD_ARG (advanced)
> 
> Patch ported from librtlsdr:
> https://git.busybox.net/buildroot/commit/?id=4c6eace6f756d15ae9639a503c9245d1e7fb12a9
> 
> Fixes
> http://autobuild.buildroot.net/results/0f9/0f985993a0c0076f027cfe25bb13d6b85c644c0d/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: added more comments in commit message and exiv2.mk (Thomas)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

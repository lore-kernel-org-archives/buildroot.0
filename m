From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 08:59:06 +0200
Subject: [Buildroot] [PATCH 1/1] leveldb: fix parallel build
In-Reply-To: <20181008211351.18806-1-fontaine.fabrice@gmail.com>
References: <20181008211351.18806-1-fontaine.fabrice@gmail.com>
Message-ID: <20181009085906.4138ef76@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 Oct 2018 23:13:51 +0200, Fabrice Fontaine wrote:
> Build of leveldb sometimes fails on:
> Fatal error: can't create out-shared/db/db_bench.o: No such file or directory
> 
> Patch is not upstreamable as upstream switched to cmake
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/945bb8096c1f98f307161a6def5a9f7f25b2454a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/leveldb/0003-fix-parallel-build.patch | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/leveldb/0003-fix-parallel-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

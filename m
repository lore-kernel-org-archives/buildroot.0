From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 May 2020 23:06:14 +0200
Subject: [Buildroot] [PATCH v2] exfatprogs: fix more 64-bit types printf
 compile failure
In-Reply-To: <20200509213319.21792-1-ps.report@gmx.net>
References: <20200509213319.21792-1-ps.report@gmx.net>
Message-ID: <20200515230614.7986a2bf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  9 May 2020 23:33:19 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes test-pkg detected compile failures for the following toolchains:
> 
>   - br-mips64-n64-full
>   - br-mips64r6-el-hf-glibc
>   - br-powerpc64le-power8-glibc
>   - br-powerpc64-power7-glibc
>   - sourcery-mips64
> 
> Used test config:
> 
>   BR2_USE_WCHAR=y
>   BR2_PACKAGE_EXFATPROGS=y
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - reworked patch to don't break the other toolchains
> ---
>  ...PRIu64-PRIx64-to-printf-64-bit-types.patch | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 package/exfatprogs/0005-fsck-use-PRIu64-PRIx64-to-printf-64-bit-types.patch

I think this patch was applied upstream, released as part of version
1.0.3, which we now use in Buildroot master. So I've marked this patch
as Not Applicable.

Of course, if I missed something, let me know!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

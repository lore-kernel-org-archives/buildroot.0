From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 13:19:23 +0200
Subject: [Buildroot] [PATCH v1] fbset: fix musl compile
In-Reply-To: <1468268028-13960-1-git-send-email-ps.report@gmx.net>
References: <1468268028-13960-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160715131923.26096e0c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Jul 2016 22:13:48 +0200, Peter Seiderer wrote:
> Unconditional include <asm/types.h> for __u32 type.
> 
> Fixes [1]:
> 
>   error: unknown type name '__u32'
> 
> [1] http://autobuild.buildroot.net/results/90f/90fc7954c532417c2ceaf9ab8549099d84561a42
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/fbset/0001-Fix-musl-compile.patch | 33 +++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/fbset/0001-Fix-musl-compile.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

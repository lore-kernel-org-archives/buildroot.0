From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 15:11:30 +0100
Subject: [Buildroot] [PATCH 2/3] package/multicat: add patch to fix musl
 build
In-Reply-To: <1458430906-8291-2-git-send-email-joerg.krause@embedded.rocks>
References: <1458430906-8291-1-git-send-email-joerg.krause@embedded.rocks>
 <1458430906-8291-2-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160320151130.593510d9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Mar 2016 00:41:45 +0100, J?rg Krause wrote:
> Add a patch to fix two musl build issues:
>   1) `struct udphdr` requires definition of `_GNU_SOURCE`
>   2) `mode_t` requires including <sys/types.h>
> 
> Fixes:
> http://autobuild.buildroot.net/results/9f1/9f1a3f3aab854f1bd20f1064391e613457312022/
> 
> Upstream status: Pending [1]
> 
> [1] https://mailman.videolan.org/pipermail/multicat-devel/2016-March/000126.html
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/multicat/0002-Fix-musl-build.patch | 46 ++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/multicat/0002-Fix-musl-build.patch

Same comment as the previous patch: the information that you have sent
it upstream (with the link) should be added to the patch itself.

Applied with this fixed, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

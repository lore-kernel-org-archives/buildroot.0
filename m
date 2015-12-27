From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Dec 2015 12:00:06 +0100
Subject: [Buildroot] [PATCH] strace: fix building for arc, metag, nios2,
 or1k and tile
In-Reply-To: <1451078648-31021-1-git-send-email-abrodkin@synopsys.com>
References: <1451078648-31021-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20151227120006.71652af7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Sat, 26 Dec 2015 00:24:08 +0300, Alexey Brodkin wrote:
> Following commit broke building for arc, metag, nios2, or1k and tile:
> http://sourceforge.net/p/strace/code/ci/34683e3926d8c2daa368afb805da422ee7043396/
> 
> Now we're fixing that breakage with a back-port of upstream fix:
> http://sourceforge.net/p/strace/code/ci/dd1a80c8d213eed95fe55b7ebcb07ee165dd8e4b/
> 
> Mentioned fix will be a part of the next strace release,
> i.e. this patch must be removed on strace version bump.
> 
> Fixes http://autobuild.buildroot.org/results/f25/f25c23003ed282b935f5289c944615860265364a
> and alike, see http://autobuild.buildroot.org/?reason=strace-4.11
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .../0001-arc-metag-nios2-or1k-tile-fix-build.patch | 104 +++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 package/strace/0001-arc-metag-nios2-or1k-tile-fix-build.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

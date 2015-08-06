From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 09:08:22 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/bdwgc: musl build failure
In-Reply-To: <1438351522-23373-1-git-send-email-brendanheading@gmail.com>
References: <1438351522-23373-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150806090822.4d22dc35@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On Fri, 31 Jul 2015 15:05:22 +0100, Brendan Heading wrote:
> Fixes http://autobuild.buildroot.net/results/1ed/1edb5e7dab88d3fefca533ab56f7ddc7dd5411d2/
> 
> Upstream removed unused code which was causing musl compilation issues.
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> ---
> v1 -> v2 - updated to use a backported change from upstream.
> v2 -> v3 
>     - format-patch the original upstream fix to properly credit author.
> ---
>  ...include-sigcontext.h-and-asm-sigcontext.h.patch | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 package/bdwgc/0002-Do-not-include-sigcontext.h-and-asm-sigcontext.h.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

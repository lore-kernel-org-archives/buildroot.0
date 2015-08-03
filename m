From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Aug 2015 11:20:03 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/arptables: fix musl
 compilation issues
In-Reply-To: <1438552426-6135-1-git-send-email-brendanheading@gmail.com>
References: <1438552426-6135-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150803112003.2a4ba60f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On Sun,  2 Aug 2015 22:53:46 +0100, Brendan Heading wrote:
> Fixes http://autobuild.buildroot.net/results/841/841129b8f49df205e1dabc2c2a5be70fa266768b/
> 
> Backported two patches from upstream which had solved this problem.
> Please note that 0002-src-Use-stdint-types.patch is modified to apply
> cleanly - details in the patch file.
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> ---
> v1 -> v2 - clarified comments to show that one of the patches was
>     modified relative to the upstream commit to make it apply.

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

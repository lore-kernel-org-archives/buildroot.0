From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 23:27:05 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/btrfs-progs: fix build
 issues under musl
In-Reply-To: <1438291414-22590-1-git-send-email-brendanheading@gmail.com>
References: <1438291414-22590-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150730232705.2ff163f6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On Thu, 30 Jul 2015 22:23:34 +0100, Brendan Heading wrote:
> Fixes http://autobuild.buildroot.net/results/b97/b97f1e9cd459da96e3e1680bb7c43d8103ab12c2/build-end.log
> 
> Patches by Thomas to refactor detection of __always_inline and backtrace
> detection. Also added #include <limits.h> for PATH_MAX.
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> ---
> v2 - remove unneeded HAVE_ALWAYS_INLINE section.

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

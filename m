From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 21:56:15 +0200
Subject: [Buildroot] [PATCH V2] perf: Add support for Linux 3.13
In-Reply-To: <1405951332-8607-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <1405951332-8607-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <20140721215615.1b8c9bcf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anton Kolesov,

On Mon, 21 Jul 2014 18:02:12 +0400, Anton Kolesov wrote:
> The Makefile has been renamed to Makefile.perf; so now we check both
> Makefile and Makefile.perf to support 3.7 - 3.12 and 3.13 - beyond.
> 
> Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  package/perf/perf.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

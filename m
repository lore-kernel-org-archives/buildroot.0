From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 17:55:49 +0100
Subject: [Buildroot] [PATCH] ruby: fix verconf.h related build failure
In-Reply-To: <1417821815-9924-1-git-send-email-ps.report@gmx.net>
References: <1417821815-9924-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150110175549.0b6b1e41@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Sat,  6 Dec 2014 00:23:35 +0100, Peter Seiderer wrote:
> See [1] for failure analysis.
> 
> Fixes:
>    http://autobuild.buildroot.net/results/c94fef5d2cfb00a336905ae3c110d7680f6d5416/
>    http://autobuild.buildroot.net/results/4375cb1e325a336dbf59f22f975be9165ad0648a/
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2014-December/114273.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/ruby/ruby.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

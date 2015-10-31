From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Oct 2015 18:24:06 +0100
Subject: [Buildroot] [PATCH 1/4] package/dvblast: needs iconv always
In-Reply-To: <64a273c2431ecee72e0e7084dc4edee8850bb5d8.1446219805.git.yann.morin.1998@free.fr>
References: <cover.1446219805.git.yann.morin.1998@free.fr>
 <64a273c2431ecee72e0e7084dc4edee8850bb5d8.1446219805.git.yann.morin.1998@free.fr>
Message-ID: <20151031182406.056e3009@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 30 Oct 2015 16:43:40 +0100, Yann E. MORIN wrote:
> dvblast wants iconv functions even without locales.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/03f/03fe6dc17d7f36d9b8c7ced402850def95d8feb3/
>     http://autobuild.buildroot.org/results/064/0647b0180ac9a6bf6172742e388df9a9e584d91b/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Julian Scheel <julian@jusst.de>

For some reason, your Cc didn't work.

I've applied after tweaking the commit title: I don't think "needs iconv
always" is completely correct, so I've reworded to "always needs iconv".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 18:35:41 +0100
Subject: [Buildroot] [PATCH 1/1] boost: add option to build
 boost_coroutine
In-Reply-To: <1446569978-10357-1-git-send-email-edson.siqueira@datacom.ind.br>
References: <1446569978-10357-1-git-send-email-edson.siqueira@datacom.ind.br>
Message-ID: <20151103183541.000defd6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Edson Siqueira,

On Tue,  3 Nov 2015 14:59:38 -0200, Edson Siqueira wrote:
> It was disabled by default by commit 611dfe6cb55ed72d7df3b7c102f4a723248a4037
> due to the upgrade to boost 1.54.0.
> 
> Signed-off-by: Edson Siqueira <edson.siqueira@datacom.ind.br>

Thanks for your contribution. However, you don't explain why you think
that the problems that lead to commit
611dfe6cb55ed72d7df3b7c102f4a723248a4037 have now been fixed. Can you
give more details ? Have you tested the configurations pointed by the
611dfe6cb55ed72d7df3b7c102f4a723248a4037 commit log and verified that
they now build fine with the coroutine module enabled ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 22:47:47 +0200
Subject: [Buildroot] [PATCH v1] valgrind: bump version to 3.12.0
In-Reply-To: <1477430986-18875-1-git-send-email-ps.report@gmx.net>
References: <1477430986-18875-1-git-send-email-ps.report@gmx.net>
Message-ID: <20161026224747.0c3b96a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Oct 2016 23:29:46 +0200, Peter Seiderer wrote:
> See [1] for release notes.
> 
> - removed 0003-mips-replace-addi-with-addiu.patch (applied upstream, see [2])
> 
> [1] http://valgrind.org/docs/manual/dist.news.html
> [2] https://bugs.kde.org/show_bug.cgi?id=356112
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Patch 0003-mips-replace-addi-with-addiu.patch is only applied partly upstream,
> the '#ifdef' parts are missing.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

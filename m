From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 23:07:55 +0200
Subject: [Buildroot] [PATCH] libiscsi: Force configure to use gcc for LD
In-Reply-To: <1438093591-14134-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1438093591-14134-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150728230755.1461627a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Tue, 28 Jul 2015 16:26:31 +0200, Maxime Hadjinlian wrote:
> Fixes
> http://autobuild.buildroot.org/results/0a9/0a96f3654983ed2efc851522352dec43c1df0077/
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/libiscsi/libiscsi.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied with some changes:

    [Thomas:
      - pass the CC variable in <pkg>_CONF_ENV instead of <pkg>_CONF_OPTS
      - add comment in the code explaining why we are doing this.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

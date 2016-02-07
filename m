From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 23:12:52 +0100
Subject: [Buildroot] [PATCH v2] package/libatomic_ops: rename
 libatomic_ops supported arch Kconfig symbol
In-Reply-To: <1454882365-10901-1-git-send-email-romain.naour@gmail.com>
References: <1454882365-10901-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160207231252.148541fc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun,  7 Feb 2016 22:59:24 +0100, Romain Naour wrote:
> According to the discussion on the mailing-list [1], rename
> the libatomic_ops supported architectures Kconfig symbol.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2016-February/152146.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Frank Hunleth <fhunleth@troodon-software.com>
> ---
> v2: drop the ligacy handling, it's an hidden symbol (ThomasP)
> ---
>  package/bdwgc/Config.in         | 2 +-
>  package/erlang/Config.in        | 4 ++--
>  package/guile/Config.in         | 2 +-
>  package/libatomic_ops/Config.in | 4 ++--
>  package/moarvm/Config.in        | 4 ++--
>  5 files changed, 8 insertions(+), 8 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

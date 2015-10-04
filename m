From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 18:35:28 +0100
Subject: [Buildroot] [PATCH] audit: Bump version
In-Reply-To: <1443978074-1455-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443978074-1455-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20151004183528.26a2ef94@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Clayton,

Can you test/ack this patch? Thanks!

On Sun,  4 Oct 2015 19:01:14 +0200, Maxime Hadjinlian wrote:
> Remove patch as it was merged in this release:
> https://fedorahosted.org/audit/changeset/1117
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  .../audit/0001-Missed-cross-compile-fixes.patch    | 694 ---------------------
>  package/audit/audit.hash                           |   2 +-
>  package/audit/audit.mk                             |   2 +-
>  3 files changed, 2 insertions(+), 696 deletions(-)
>  delete mode 100644 package/audit/0001-Missed-cross-compile-fixes.patch

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

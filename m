From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Oct 2015 16:05:00 +0200
Subject: [Buildroot] [PATCH] audit: Bump version
In-Reply-To: <1443978074-1455-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443978074-1455-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20151011160500.3d8f9074@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

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

Since I had no feedback from Clayton after a week, I applied your
patch. However, I did a small change to it: I remove AUDIT_AUTORECONF =
YES from audit.mk, since we are no longer patching the package.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

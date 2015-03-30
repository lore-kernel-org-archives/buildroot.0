From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 21:29:13 +0200
Subject: [Buildroot] [PATCH] logrotate: Bump version to 3.8.9
In-Reply-To: <1427675556-9240-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
References: <1427675556-9240-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <20150330212913.7c9b6247@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Mon, 30 Mar 2015 02:32:36 +0200, Beno?t Th?baudeau wrote:
> Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>
> ---
>  package/logrotate/0001-make-autoreconfable.patch | 20 ++++++++++++++++++++
>  package/logrotate/logrotate.mk                   | 23 +++++++++++++----------
>  2 files changed, 33 insertions(+), 10 deletions(-)
>  create mode 100644 package/logrotate/0001-make-autoreconfable.patch

I've applied, after doing a number of changes:

[Thomas:
  - add comment explaining why AUTORECONF = YES is needed
  - expand commit log
  - use --without/--with instead of --with=yes/--with=no
  - fix indentation in the ACL condition]

Especially, next time, please include more details in the commit log: a
bump that converts from generic-package to autotools-package definitely
deserves a comment in the commit log, as well as the usage of
<pkg>_AUTORECONF = YES when it's non-obvious.

Feel free to send a follow-up patch to add a hash file for the
logrotate package.

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

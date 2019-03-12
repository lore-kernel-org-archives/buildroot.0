From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 21:37:54 +0100
Subject: [Buildroot] [PATCH] package/php: security bump to version 7.3.3
In-Reply-To: <20190312151029.24382-1-peter@korsgaard.com>
References: <20190312151029.24382-1-peter@korsgaard.com>
Message-ID: <20190312213754.20f35d52@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Mar 2019 16:10:29 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> php-7.3.3 fixes a number of security issues (no CVE known, bugtracker issues
> not yet public): https://secure.php.net/ChangeLog-7.php#7.3.3
> 
> Drop 0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch as the
> flock detection has been removed since commit 9222702633 (Avoid dependency
> on "struct flock" fields order.)
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...ch => 0004-Call-apxs-with-correct-prefix.patch} |  0
>  ...ck-mechanism-is-obviously-linux-so-force-.patch | 82 ----------------------
>  package/php/php.hash                               |  2 +-
>  package/php/php.mk                                 |  2 +-
>  4 files changed, 2 insertions(+), 84 deletions(-)
>  rename package/php/{0005-Call-apxs-with-correct-prefix.patch => 0004-Call-apxs-with-correct-prefix.patch} (100%)
>  delete mode 100644 package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

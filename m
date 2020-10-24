From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Oct 2020 22:40:47 +0200
Subject: [Buildroot] [PATCH] package/umtprd: bump to version 1.3.10
In-Reply-To: <20201022154809.22155-1-paul@crapouillou.net>
References: <20201022154809.22155-1-paul@crapouillou.net>
Message-ID: <20201024224047.2b906f61@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 22 Oct 2020 16:48:09 +0100
Paul Cercueil <paul@crapouillou.net> wrote:

> Bump package to the latest version 1.3.10, and remove the two patches
> which are not needed anymore.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  ...uild-errors-warnings-on-some-systems.patch | 38 ---------
>  ...finition-build-error-on-some-systems.patch | 78 -------------------
>  package/umtprd/umtprd.hash                    |  2 +-
>  package/umtprd/umtprd.mk                      |  2 +-
>  4 files changed, 2 insertions(+), 118 deletions(-)
>  delete mode 100644 package/umtprd/0001-Fix-the-missing-definitions-build-errors-warnings-on-some-systems.patch
>  delete mode 100644 package/umtprd/0002-Fix-the-pthread-missing-definition-build-error-on-some-systems.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 22:43:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/sentry-cli: fix dependency
In-Reply-To: <20200928193304.81313-1-fontaine.fabrice@gmail.com>
References: <20200928193304.81313-1-fontaine.fabrice@gmail.com>
Message-ID: <20200930224339.3a919e22@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 28 Sep 2020 21:33:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Replace SENTRY_CLI_DEPENDENCIES by HOST_SENTRY_CLI_DEPENDENCIES as
> sentry-cli is a host-generic-package
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ce566ec91a8f7d69f2525892a7a034c829db9dad
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sentry-cli/sentry-cli.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

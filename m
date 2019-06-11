From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Jun 2019 22:44:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/git: fix build with curl
In-Reply-To: <20190611170521.11183-1-fontaine.fabrice@gmail.com>
References: <20190611170521.11183-1-fontaine.fabrice@gmail.com>
Message-ID: <20190611224418.25a37e7c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 11 Jun 2019 19:05:21 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> curl-config path can be set through ac_cv_prog_CURL_CONFIG and not
> ac_cv_prog_curl_config
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4b22f761795d8760dac6ddfd40934259f0135a4d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/git/git.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Sep 2019 22:39:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/perl-class-std-fast: fixup the
 'v' prefix in the version
In-Reply-To: <20190911170150.26936-1-fontaine.fabrice@gmail.com>
References: <20190911170150.26936-1-fontaine.fabrice@gmail.com>
Message-ID: <20190913223910.175c76fc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 11 Sep 2019 19:01:50 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> In order for the perl-class-std-fast version to match what is given by
> release-monitoring.org, the 'v' prefix should be encoded in
> PERL_CLASS_STD_FAST_SOURCE and not PERL_CLASS_STD_FAST_VERSION.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/perl-class-std-fast/perl-class-std-fast.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

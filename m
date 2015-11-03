From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 20:49:48 +0100
Subject: [Buildroot] [PATCH] perl-cross: bump to version 1.0.1
In-Reply-To: <1446572343-9099-1-git-send-email-francois.perrad@gadz.org>
References: <1446572343-9099-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20151103204948.4535328a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Tue,  3 Nov 2015 18:39:03 +0100, Francois Perrad wrote:
> all patches merged
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl/0002-dynaloader-hints.patch           | 15 ----------
>  .../0003-add-version.pm-to-miniperl_top-path.patch | 16 -----------
>  ...ilt-in-functions-to-avoid-false-positives.patch | 32 ----------------------
>  package/perl/perl.hash                             |  2 +-
>  package/perl/perl.mk                               |  3 +-
>  5 files changed, 2 insertions(+), 66 deletions(-)
>  delete mode 100644 package/perl/0002-dynaloader-hints.patch
>  delete mode 100644 package/perl/0003-add-version.pm-to-miniperl_top-path.patch
>  delete mode 100644 package/perl/0004-suppress-built-in-functions-to-avoid-false-positives.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

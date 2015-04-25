From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 16:46:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/perl-libwww-perl: Move
 package/perl-libwww to new package
In-Reply-To: <1429967642-1762-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429967642-1762-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150425164646.27b1da9e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 25 Apr 2015 15:14:02 +0200, Bernd Kuhls wrote:
> This move is necessary to sync the package with scancpan output
> as suggested by Francois.
> http://lists.busybox.net/pipermail/buildroot/2015-April/126406.html
> 
> Since perl-libwww was never part of any official buildroot release
> I did not bother the include legavy handling of its options ;)
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/Config.in                                        |    2 +-
>  package/{perl-libwww => perl-libwww-perl}/Config.in      |    8 +++++---
>  package/perl-libwww-perl/perl-libwww-perl.hash           |    3 +++
>  .../perl-libwww-perl.mk}                                 |   14 +++++++++-----
>  4 files changed, 18 insertions(+), 9 deletions(-)
>  rename package/{perl-libwww => perl-libwww-perl}/Config.in (70%)
>  create mode 100644 package/perl-libwww-perl/perl-libwww-perl.hash
>  rename package/{perl-libwww/perl-libwww.mk => perl-libwww-perl/perl-libwww-perl.mk} (56%)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

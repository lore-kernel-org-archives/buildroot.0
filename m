From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 11:42:56 +0200
Subject: [Buildroot] [PATCH 01/20] perl-digest-hmac: New package
In-Reply-To: <1429432413-17038-2-git-send-email-bernd.kuhls@t-online.de>
References: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
 <1429432413-17038-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150419114256.547fb11d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 19 Apr 2015 10:33:14 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/Config.in                              |    1 +
>  package/perl-digest-hmac/Config.in             |    6 ++++++
>  package/perl-digest-hmac/perl-digest-hmac.hash |    3 +++
>  package/perl-digest-hmac/perl-digest-hmac.mk   |   14 ++++++++++++++
>  4 files changed, 24 insertions(+)
>  create mode 100644 package/perl-digest-hmac/Config.in
>  create mode 100644 package/perl-digest-hmac/perl-digest-hmac.hash
>  create mode 100644 package/perl-digest-hmac/perl-digest-hmac.mk

Applied, thanks. For the other patches, I'd like to see a better
solution than adding zillions of host packages just to please
spamassassin configure script.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

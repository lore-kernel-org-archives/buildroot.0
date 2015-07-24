From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jul 2015 16:55:57 +0200
Subject: [Buildroot] [V2 1/6] perl-io-socket-ssl: bump to version 2.016
In-Reply-To: <1437748731-31026-1-git-send-email-francois.perrad@gadz.org>
References: <1437748731-31026-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20150724165557.7152b222@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Fri, 24 Jul 2015 16:38:46 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl-io-socket-ssl/perl-io-socket-ssl.hash | 4 ++--
>  package/perl-io-socket-ssl/perl-io-socket-ssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Thanks! Is this series replacing the previous one that contained Perl
module bumps and dependency fixes?

If so, how do you intend to fix the missing dependency of many Perl
modules on the 'perl' package, as we discussed previously in another
thread?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

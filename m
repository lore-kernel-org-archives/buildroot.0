From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 22:38:26 +0200
Subject: [Buildroot] [PATCH 01/15] scancpan: adjust package name
In-Reply-To: <1437670050-27014-1-git-send-email-francois.perrad@gadz.org>
References: <1437670050-27014-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20150723223826.67e04ac2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Thu, 23 Jul 2015 18:47:16 +0200, Francois Perrad wrote:
> underscore is not allowed in BR package name.
> this problem was found with the Perl module DB_File
> which must give the BR package perl-db-file.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl-db-file/Config.in       | 2 +-
>  package/perl-db-file/perl-db-file.mk | 2 +-
>  support/scripts/scancpan             | 1 +
>  3 files changed, 3 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

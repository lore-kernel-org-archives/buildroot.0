From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Dec 2016 18:01:10 +0100
Subject: [Buildroot] [V2] perl-db-file: remove this package
In-Reply-To: <20161226145035.19124-1-francois.perrad@gadz.org>
References: <20161226145035.19124-1-francois.perrad@gadz.org>
Message-ID: <20161227180110.4454aac7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Dec 2016 15:50:35 +0100, Francois Perrad wrote:
> The module DB_File (Berkeley DB wrapper) is a Perl core module.
> Long time ago, its built as core module was broken.
> Since perl-cross-1.0.2, this issue is fixed.
> So, this package which build DB_File as CPAN module, becomes useless.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  Config.in.legacy                       |  9 +++++++++
>  package/Config.in                      |  1 -
>  package/perl-db-file/Config.in         | 11 -----------
>  package/perl-db-file/perl-db-file.hash |  3 ---
>  package/perl-db-file/perl-db-file.mk   | 22 ----------------------
>  5 files changed, 9 insertions(+), 37 deletions(-)
>  delete mode 100644 package/perl-db-file/Config.in
>  delete mode 100644 package/perl-db-file/perl-db-file.hash
>  delete mode 100644 package/perl-db-file/perl-db-file.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Dec 2016 14:31:01 +0100
Subject: [Buildroot] [PATCH] perl-db-file: remove this package
In-Reply-To: <20161226105920.17254-1-francois.perrad@gadz.org>
References: <20161226105920.17254-1-francois.perrad@gadz.org>
Message-ID: <20161226143101.2f370cd6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Dec 2016 11:59:20 +0100, Francois Perrad wrote:
> The module DB_File (Berkeley DB wrapper) is a Perl core module.
> Long time ago, its built as core module was broken.
> Since perl-cross-1.0.2, this issue is fixed.
> So, this package which build DB_File as CPAN module, becomes useless.
> 
> `depends on BR2_PACKAGE_PERL_DB_FILE` could be replaced by
> `select BR2_PACKAGE_BERKELEYDB` and `depends on BR2_PACKAGE_PERL`.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Thanks, but please add the relevant entry in Config.in.legacy.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

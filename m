From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 17:23:39 +0200
Subject: [Buildroot] [PATCH] perl: removes useless files in target tree
In-Reply-To: <1401821218-5716-1-git-send-email-francois.perrad@gadz.org>
References: <1401821218-5716-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140608172339.083abcd0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Tue,  3 Jun 2014 20:46:58 +0200, Francois Perrad wrote:
> $(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE contains include files.
> *.bs & .packlist files come with perl or perl/cpan packages.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  Makefile | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

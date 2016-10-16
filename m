From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 12:13:25 +0200
Subject: [Buildroot] [PATCH 1/2] dependencies: check for MakeMaker Perl
 module
In-Reply-To: <1467845012-10531-1-git-send-email-romain.naour@gmail.com>
References: <1467845012-10531-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161016121325.05bfa4d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Jul 2016 00:43:31 +0200, Romain Naour wrote:
> ExtUtils::MakeMaker is one of the Perl Core modules usually packaged in
> Perl package for a Debian/Ubuntu based system.
> For a Fedora based system, each Perl Core modules have their own RPM
> package. So install only Perl package is not enough.
> 
> Fixes:
> >>> host-libxml-parser-perl 2.41 Configuring  
> [...]
> perl `which perl` Makefile.PL
> Can't locate ExtUtils/MakeMaker.pm in @INC (you may need to install the ExtUtils::MakeMaker module)
> 
> Add a new Perl module check in dependency.sh.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Fran?ois Perrad <francois.perrad@gadz.org>
> ---
>  support/dependencies/dependencies.sh | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

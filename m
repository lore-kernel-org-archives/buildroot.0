From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Oct 2016 23:10:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/perl: bump version to 5.24.0
In-Reply-To: <20161003141728.25097-1-bernd.kuhls@t-online.de>
References: <20161003141728.25097-1-bernd.kuhls@t-online.de>
Message-ID: <20161003231006.73f7e11a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Oct 2016 16:17:28 +0200, Bernd Kuhls wrote:
> perl-cross has a new version scheme since 1.1.0:
> https://github.com/arsv/perl-cross/releases
> 
> perl does not contain a version-specific perldelta.pod anymore:
> https://rt.perl.org/Public/Bug/Display.html?id=129328#txn-1424561
> 
> Therefore PERL_CROSS_SET_POD was changed accordingly.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/perl/perl.hash | 12 ++++++------
>  package/perl/perl.mk   | 16 +++++++---------
>  2 files changed, 13 insertions(+), 15 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

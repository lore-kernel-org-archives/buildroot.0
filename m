From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 14:58:53 +0200
Subject: [Buildroot] [PATCH] binutils: remove unnecessary host-texinfo
 dependency
In-Reply-To: <1441810429-57871-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441810429-57871-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150920145853.45d42e90@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 9 Sep 2015 15:53:49 +0100, Vicente Olivert Riera wrote:
> host-texinfo dependency was only necessary when building the git version
> of binutils, however, this upstream commit allows binutils to build
> without makeinfo (a binary provided by host-texinfo)...
> 
> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=bba33ab1e0f7d2ebd8f8435f92ed12e2a3c558a4
> 
> ...so we can safely remove the host-texinfo dependency.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/binutils/binutils.mk |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

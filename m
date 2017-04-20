From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 22:33:07 +0200
Subject: [Buildroot] [PATCH] mutt: bump version to 1.8.2
In-Reply-To: <20170419092551.19105-1-Vincent.Riera@imgtec.com>
References: <20170419092551.19105-1-Vincent.Riera@imgtec.com>
Message-ID: <20170420223307.3e424aab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Apr 2017 10:25:51 +0100, Vicente Olivert Riera wrote:
> 0001-nodoc.patch is no longer necessary since a new --disable-doc
> configure option has been added by this commit:
>   https://dev.mutt.org/hg/mutt/rev/b45bfce1bb0e
> 
> Use that option and remove the patch. Since we are not patching
> Makefile.am we also don't need to autoreconf.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/mutt/0001-nodoc.patch | 21 ---------------------
>  package/mutt/mutt.hash        |  2 +-
>  package/mutt/mutt.mk          |  5 ++---
>  3 files changed, 3 insertions(+), 25 deletions(-)
>  delete mode 100644 package/mutt/0001-nodoc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

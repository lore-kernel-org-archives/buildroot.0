From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Apr 2016 16:50:41 +0200
Subject: [Buildroot] [PATCH] postgresql: bump version to 9.5.2
In-Reply-To: <1459504730-33796-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1459504730-33796-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160402165041.3d68e753@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 1 Apr 2016 10:58:50 +0100, Vicente Olivert Riera wrote:
> Also remove a patch which is no longer necessary.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  ...ker-compiler-output-with-their-default-ou.patch | 56 ----------------------
>  package/postgresql/postgresql.hash                 |  4 +-
>  package/postgresql/postgresql.mk                   |  2 +-
>  3 files changed, 3 insertions(+), 59 deletions(-)
>  delete mode 100644 package/postgresql/0001-Compare-linker-compiler-output-with-their-default-ou.patch

Since you remove that single patch, is autoreconf still needed?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

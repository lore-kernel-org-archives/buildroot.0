From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 14:54:06 +0200
Subject: [Buildroot] [PATCH] uclibc: update to 1.0.26
In-Reply-To: <20170729025620.GA21116@waldemar-brodkorb.de>
References: <20170729025620.GA21116@waldemar-brodkorb.de>
Message-ID: <20170729145406.71047fbb@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Jul 2017 04:56:20 +0200, Waldemar Brodkorb wrote:
> Both patches applied upstream.
> The release contains mostly bugfixes and a basic sparc64
> port. As the sparc64 port only contains support for static
> binaries, it will be not enabled in buildroot yet.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/uclibc/0001-remove-__FAVOR_BSD.patch       | 373 ---------------------
>  ...-udp.h-sync-completely-with-GNU-C-library.patch |  52 ---
>  package/uclibc/uclibc.hash                         |   2 +-
>  package/uclibc/uclibc.mk                           |   2 +-
>  4 files changed, 2 insertions(+), 427 deletions(-)
>  delete mode 100644 package/uclibc/0001-remove-__FAVOR_BSD.patch
>  delete mode 100644 package/uclibc/0002-udp.h-sync-completely-with-GNU-C-library.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

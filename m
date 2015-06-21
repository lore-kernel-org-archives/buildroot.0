From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 09:49:25 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/gpm: add hash file,
 change archive to lzma
In-Reply-To: <1434409042-17117-2-git-send-email-petr.vorel@gmail.com>
References: <1434409042-17117-1-git-send-email-petr.vorel@gmail.com>
 <1434409042-17117-2-git-send-email-petr.vorel@gmail.com>
Message-ID: <20150621094925.5907411a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Petr Vorel,

On Tue, 16 Jun 2015 00:57:22 +0200, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v3:
> - use lzma, mainly as proof of concept of previous patch "pkg-generic:
>   support for lzma archives"
> Changes v2:
> - added missing hash file
> - keep tar.bz2
> ---
>  package/gpm/gpm.hash | 2 ++
>  package/gpm/gpm.mk   | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>  create mode 100644 package/gpm/gpm.hash

Applied after adjusting the commit since a hash file for gpm has been
added in the mean time. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

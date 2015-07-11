From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 16:32:12 +0200
Subject: [Buildroot] [PATCH/next 1/7] package/dovecot: bump version to
 2.2.18
In-Reply-To: <1432110398-22791-1-git-send-email-bernd.kuhls@t-online.de>
References: <1432110398-22791-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150711163212.281ed091@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 20 May 2015 10:26:32 +0200, Bernd Kuhls wrote:
> Removed patch applied upstream:
> http://hg.dovecot.org/dovecot-2.2/rev/e4ad83ed88c9
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/dovecot/0001-zlib.patch |   24 ------------------------
>  package/dovecot/dovecot.hash    |    2 +-
>  package/dovecot/dovecot.mk      |    2 +-
>  3 files changed, 2 insertions(+), 26 deletions(-)
>  delete mode 100644 package/dovecot/0001-zlib.patch

Applied patches 1 to 6. Patch 7 was apparently already applied (at
least it was no longer in patchwork).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

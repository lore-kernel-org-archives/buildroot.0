From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 14:39:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/trace-cmd: bump version to
 2.6.1, add hash
In-Reply-To: <20170611073411.24549-1-bernd.kuhls@t-online.de>
References: <20170611073411.24549-1-bernd.kuhls@t-online.de>
Message-ID: <20170611143931.56e0a640@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Jun 2017 09:34:11 +0200, Bernd Kuhls wrote:
> Removed patch applied upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ix-trace-record.c-with-non-ptrace-compile.patch | 32 ----------------------
>  package/trace-cmd/trace-cmd.hash                   |  2 ++
>  package/trace-cmd/trace-cmd.mk                     |  2 +-
>  3 files changed, 3 insertions(+), 33 deletions(-)
>  delete mode 100644 package/trace-cmd/0001-trace-cmd-Fix-trace-record.c-with-non-ptrace-compile.patch
>  create mode 100644 package/trace-cmd/trace-cmd.hash

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

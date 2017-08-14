From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 22:20:19 +0200
Subject: [Buildroot] [PATCH] sysvinit: fix compilation error against musl
In-Reply-To: <20170813173559.8413-1-daggs@gmx.com>
References: <20170813173559.8413-1-daggs@gmx.com>
Message-ID: <20170814222019.30d1b9cf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Aug 2017 20:35:59 +0300, Dagg Stompler wrote:
> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---
>  .../0002-musl_fix_compilation_errors.patch         | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/sysvinit/0002-musl_fix_compilation_errors.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

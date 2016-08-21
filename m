From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Aug 2016 22:22:46 +0200
Subject: [Buildroot] [PATCH] package/trace-cmd: fix build without ptrace
In-Reply-To: <1471803936-10075-1-git-send-email-romain.naour@gmail.com>
References: <1471803936-10075-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160821222246.4a30ae5d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Aug 2016 20:25:36 +0200, Romain Naour wrote:
> Backport upstream patch.
> 
> Fixes:
> http://autobuild.buildroot.net/results/78c/78ca1819cdecce81336cadca17762fde8276d13a
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...ix-trace-record.c-with-non-ptrace-compile.patch | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/trace-cmd/0001-trace-cmd-Fix-trace-record.c-with-non-ptrace-compile.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

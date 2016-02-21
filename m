From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 12:29:31 +0100
Subject: [Buildroot] [PATCH 1/2] package/vim: add optional support for
 acl
In-Reply-To: <1456008342-10748-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456008342-10748-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221122931.00ac6f1e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 20 Feb 2016 23:45:41 +0100, Bernd Kuhls wrote:
> When acl was compiled before, vim will use it as optional dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/vim | grep NEEDED | sort
>  0x0000000000000001 (NEEDED)             Shared library: [libacl.so.1]
> [...]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/vim/vim.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

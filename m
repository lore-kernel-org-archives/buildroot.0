From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 12:09:46 +0100
Subject: [Buildroot] [PATCH] uclibc: add patch to sync sys/timex.h
In-Reply-To: <20170305010528.GA5983@waldemar-brodkorb.de>
References: <20170305010528.GA5983@waldemar-brodkorb.de>
Message-ID: <20170305120946.4feaf4c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 5 Mar 2017 02:05:28 +0100, Waldemar Brodkorb wrote:
> This fixes a qemu-user compile error.
> 
> Reported-by: Fran?ois Perrad <francois.perrad@gadz.org>
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .../0004-sync-header-with-GNU-libc-kernel.patch    | 85 ++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 package/uclibc/0004-sync-header-with-GNU-libc-kernel.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

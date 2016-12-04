From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 23:59:30 +0100
Subject: [Buildroot] [PATCH 2/2] package/openpowerlink: fix build with
 Linux kernel 4.7+
In-Reply-To: <1478207123-27787-2-git-send-email-romain.naour@gmail.com>
References: <1478207123-27787-1-git-send-email-romain.naour@gmail.com>
 <1478207123-27787-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20161204235930.6cb8da3c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 Nov 2016 22:05:23 +0100, Romain Naour wrote:
> dev->trans_start was replaced by netif_trans_update helper in kernel
> 4.7 by commit 860e9538a9482bb84589f7d0718a7e6d0a944d58.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...Veth-Fix-compilation-on-Linux-kernels-4.7.patch | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/openpowerlink/0004-FIX-Veth-Fix-compilation-on-Linux-kernels-4.7.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

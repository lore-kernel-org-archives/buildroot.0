From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 22:17:58 +0200
Subject: [Buildroot] [PATCH v9] support/scripts/check-host-rpath: also
 check HOST_DIR/{bin, sbin}
In-Reply-To: <1461102541-5987-1-git-send-email-s.martin49@gmail.com>
References: <1461102541-5987-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20160421221758.06914111@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Apr 2016 23:49:00 +0200, Samuel Martin wrote:
> At least syslinux is installing stuff in HOST_DIR/sbin.
> 
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v8->v9:
> - none
> - move out of the RPATH series

Applied to master, thanks. One less patch in your big series :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

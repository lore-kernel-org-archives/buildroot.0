From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Aug 2013 06:58:39 +0200
Subject: [Buildroot] [PATCH] package/libbsd: further reduce the set of
 supported archs
In-Reply-To: <1376951733-31803-1-git-send-email-yann.morin.1998@free.fr>
References: <1376951733-31803-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20130823065839.30ea8873@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 20 Aug 2013 00:35:33 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Support for a,out on ARM will be dropped in Linux 3.11 (and is already
> missing in the -rc).
> 
> m68k is marked BROKEN in Buildroot, so it is never ever tested.
> 
> The x86 familly is the only one left with support for a.out, now.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

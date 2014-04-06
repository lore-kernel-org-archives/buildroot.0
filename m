From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 17:12:35 +0200
Subject: [Buildroot] [PATCH] support/check-kernel-headers: use mktemp
 instead of hand-crafted temp file
In-Reply-To: <1396796368-26000-1-git-send-email-yann.morin.1998@free.fr>
References: <1396796368-26000-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140406171235.5a2aea37@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  6 Apr 2014 16:59:28 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Instead of creating a temporary files with a dubious scheme, use mktemp,
> which purpose is exactly that: creating temporary files
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 22:11:26 +0100
Subject: [Buildroot] [PATCH 1/1] barebox: fix compilation on x86-64
 architecture
In-Reply-To: <1425480646-30970-1-git-send-email-fabienlahoudere.pro@gmail.com>
References: <1425480646-30970-1-git-send-email-fabienlahoudere.pro@gmail.com>
Message-ID: <20150304221126.2ed648c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabien Lahoudere,

On Wed,  4 Mar 2015 15:50:46 +0100, Fabien Lahoudere wrote:
> Barebox uses KERNEL_ARCH to derive BAREBOX_ARCH, but doesn't
> currently handle the case of the x86-64 architecture. In this
> case KERNEL_ARCH is x86_64, but BAREBOX_ARCH should be x86
> nonetheless.
> 
> Signed-off-by: Fabien Lahoudere <fabienlahoudere.pro@gmail.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 15:06:49 +0100
Subject: [Buildroot] [PATCH v3 08/13] package/dhcp: remove sleep from
 SysV init scripts restart
In-Reply-To: <1445734779-7212-8-git-send-email-benoit.thebaudeau.dev@gmail.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <1445734779-7212-8-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <20151224150649.20d39ef3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Sun, 25 Oct 2015 02:59:34 +0200, Beno?t Th?baudeau wrote:
> From: Beno?t Th?baudeau <benoit@wsystem.com>
> 
> No sleep is required for the restart and force-reload operations to
> succeed.
> 
> Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
> 
> ---
> Changes v2 -> v3: none.

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

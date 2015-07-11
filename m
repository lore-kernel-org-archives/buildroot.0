From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 00:25:27 +0200
Subject: [Buildroot] [PATCH] busybox: Install udhcpc script only if
 enabled
In-Reply-To: <1436629865-19506-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436629865-19506-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150712002527.491cd583@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sat, 11 Jul 2015 17:51:05 +0200, Maxime Hadjinlian wrote:
> It doesn't make sense to install such a scripts if UDHCPC was not
> selected.
> Also remove the entry from BUSYBOX_PERMISSIONS as the install command
> does the same job.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/busybox/busybox.mk | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 23:17:48 +0200
Subject: [Buildroot] [PATCH v4 2/3] core/pkg-kconfig: Do not use $(call
 ...) without parameters
In-Reply-To: <1460971383-10595-3-git-send-email-romain.izard.pro@gmail.com>
References: <1460971383-10595-1-git-send-email-romain.izard.pro@gmail.com>
 <1460971383-10595-3-git-send-email-romain.izard.pro@gmail.com>
Message-ID: <20160418231748.6f93d48f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Apr 2016 11:23:02 +0200, Romain Izard wrote:
> When there are no parameters, simply use $(var) instead of $(call var)
> 
> Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
> ---
> Changelog:
> v3: new
> v4: no change

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

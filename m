From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 23:17:43 +0200
Subject: [Buildroot] [PATCH v4 1/3] core/pkg-kconfig: Factorize make
 commands
In-Reply-To: <1460971383-10595-2-git-send-email-romain.izard.pro@gmail.com>
References: <1460971383-10595-1-git-send-email-romain.izard.pro@gmail.com>
 <1460971383-10595-2-git-send-email-romain.izard.pro@gmail.com>
Message-ID: <20160418231743.4d82a834@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Apr 2016 11:23:01 +0200, Romain Izard wrote:
> Use a variable to factorize the calls to make, as we use the same set
> of options multiple times.
> 
> Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
> ---
> Changelog:
> v3: new
> v4: fix commit message

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

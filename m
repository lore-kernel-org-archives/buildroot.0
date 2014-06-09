From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 11:32:53 +0200
Subject: [Buildroot] [PATCH] filesystems: also chown symlinks
In-Reply-To: <1402257743-21650-1-git-send-email-yann.morin.1998@free.fr>
References: <1402257743-21650-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140609113253.75f0aba8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  8 Jun 2014 22:02:23 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Currently, the symlinks in the generated filesystems will have the
> UID of the user running the build, because 'chown' does not change
> the ownership of symlinks, by default.
> 
> Although the implications are limited, some may not want that UID
> to leak in the generated filesystems.
> 
> So, use 'chown -h' so even symlinks get properly chowned.
> 
> Reported-by: Angelo Dureghello <angelo@barix.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

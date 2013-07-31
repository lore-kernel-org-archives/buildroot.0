From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 18:16:40 +0200
Subject: [Buildroot] [PATCH v2] package/libedit: switch to alternate URL
 for proper packaging
In-Reply-To: <1375116257-27967-1-git-send-email-yann.morin.1998@free.fr>
References: <1375116257-27967-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20130731181640.55c139ad@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 29 Jul 2013 18:44:17 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Upstream libedit does not have a proper homepage, and does not provide
> any sort of packaging whatsoever. So far, we used Debian's wayback
> machine to get a tarball of a rather oldish libedit.
> 
> As Thomas pointed out, someone has been maintaining a proper autotools
> based, up-to-date package for a while.
> 
> While Debian is stuck to 2.11 (5 years old now), we bump to 3.1 as a bonus.
> 
> Remove our libedit.pc, it's now bundled with the package.
> 
> Reported-by: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

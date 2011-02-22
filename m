From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Feb 2011 19:25:38 +0100
Subject: [Buildroot] No response after "Freeing init memory"
In-Reply-To: <AANLkTi=pxm_KCKqhFr0c7kMs_DU6m1wE49V5K6ShE=WQ@mail.gmail.com>
References: <AANLkTimNjQwt1HtqQLCcnsVWtSp7=3Mb2M_00EMsdOzS@mail.gmail.com>
	<AANLkTikh9tw-PuERGodGqC+aVS0dfkiyR11RGghcx=E2@mail.gmail.com>
	<AANLkTi=pxm_KCKqhFr0c7kMs_DU6m1wE49V5K6ShE=WQ@mail.gmail.com>
Message-ID: <20110222192538.6720529a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 22 Feb 2011 09:06:34 +0100
Zden?k Materna <zdenek.materna@gmail.com> wrote:

> -------------- inittab ---------------------------------------------------
> 
> # /etc/inittab
> #
> # This inittab is a basic inittab sample for sysvinit, which mimics
> # Buildroot's default inittab for Busybox.

Aah, you have enabled sysvinit. Could you disable it, make clean &&
make, and retry ?

Busybox already contains a default init, and it's the one most of us
test and use on a daily basis.

I've written this sysvinit inittab not long ago, it was working for me,
but it definitely does not receive as much testing as the sysvinit one
gets.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

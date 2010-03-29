From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Mar 2010 19:59:46 +0200
Subject: [Buildroot] AIX / RS6000
In-Reply-To: <20100329173236.B2E60389B5D@pombo.ieav.cta.br>
References: <20100329173236.B2E60389B5D@pombo.ieav.cta.br>
Message-ID: <20100329195946.73064ae7@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 29 Mar 2010 14:32:36 -0300
gilmar <rlima@ieav.cta.br> wrote:

> >>>I am using buildroot but , i don?t find option to change of Linux to AIX .
> >>>
> >>>Where i can find this option ?

We do not support AIX and will probably never support AIX (old,
no longer developed Unix, not suitable for embedded). If you just need a
compiler, you can look at Crosstool-NG, but they do not support AIX
either, so you would have to create the support yourself.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

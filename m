From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Mar 2011 19:41:06 +0100
Subject: [Buildroot] toolchain into the root disk
In-Reply-To: <AANLkTinAL=LOhtUzChPu1xjnebf9PaXyJjmMknpthOrL@mail.gmail.com>
References: <AANLkTi=tEiD9=biree-6EzC5qN_6ZL0r=tyhC0WPtpm1@mail.gmail.com>
	<20110307143332.3afe2773@surf>
	<AANLkTim0Up1xxGFx8AAg-_BWSNXgiJDjRV-3w1eaV9+m@mail.gmail.com>
	<20110307182124.555f16ab@surf>
	<AANLkTinAL=LOhtUzChPu1xjnebf9PaXyJjmMknpthOrL@mail.gmail.com>
Message-ID: <20110307194106.3e980b0c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 7 Mar 2011 17:46:28 +0000
Max <themaxmail@gmail.com> wrote:

> >Do you really need a native toolchain on the target ? What do you want
> >to build on the target ?
> 
> I prefer to have the toolchain also on the target for quick recompilation
> during debugging phase =P

I don't see why having the toolchain on the target makes it any
quicker. Just cross-compile your application, make your root filesystem
mounted over NFS, and use cross-debugging. There are zero extra steps
when compared to native building your application.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

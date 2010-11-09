From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Nov 2010 18:40:59 +0100
Subject: [Buildroot] What is procedure for building custom Linux-2.6.36
 from BuildRoot?
In-Reply-To: <AANLkTin_UbOpJG-j9tK5s13M-2D3o-Ncy2NTkX-MnDmJ@mail.gmail.com>
References: <20101108163354.35840@gmx.com>
	<AANLkTin_UbOpJG-j9tK5s13M-2D3o-Ncy2NTkX-MnDmJ@mail.gmail.com>
Message-ID: <20101109184059.0930340e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 9 Nov 2010 17:45:40 +0100
Lionel Landwerlin <llandwerlin@gmail.com> wrote:

> From the buildroot configuration tool, in the kernel submenu, you can
> select a "custom tarball" kernel (which might be a 2.6.36 in your
> case) and also a "custom config file".

And to adjust the kernel configuration, you can do:

 make linux26-menuconfig

or

 make linux26-xconfig

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

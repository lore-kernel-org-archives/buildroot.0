From: Robert Urban <urban@unix-beratung.de>
Date: Fri, 06 Mar 2009 01:19:55 +0100
Subject: [Buildroot] (apparently) HUGE kernel
In-Reply-To: <49B061A9.7020404@unix-beratung.de>
References: <49B061A9.7020404@unix-beratung.de>
Message-ID: <49B06C2B.4070001@unix-beratung.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Robert Urban wrote:
> Still the kernel (bzImage) is 12MB large.  gah.  On my Fedora10 system the
> kernel is 2.5MB large.  A 12MB kernel isn't the end of the world, but it
> just seems too large.
> 
> I would be grateful if someone could have a look at my config-file and
> possibly offer an explanation.  The config file is here:
> 
> 	http://www.spielwiese.de/rob/Buildroot/linux-config

as someone pointed out (thanks again), my bzImage includes the initramfs,
which is controlled by

	CONFIG_INITRAMFS_SOURCE="..."

cheers,

Rob Urban

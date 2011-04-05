From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Apr 2011 23:42:53 +0200
Subject: [Buildroot] Buildroot "install" wrapper to preserve file
 permissions
In-Reply-To: <BANLkTimBTeADgaq2F_MhNY-2UTUQGXz0=g@mail.gmail.com>
References: <BANLkTi=gd8UtSZLpam0=Luyq8dZzcdfO_g@mail.gmail.com>
	<20110405215447.135159ef@surf> <87ipuswjux.fsf@macbook.be.48ers.dk>
	<BANLkTimBTeADgaq2F_MhNY-2UTUQGXz0=g@mail.gmail.com>
Message-ID: <20110405234253.2d0c2700@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 5 Apr 2011 22:32:52 +0200
Daniel Nystr?m <daniel.nystrom@timeterminal.se> wrote:

> Yes, that's how I meant. Sorry for any bad description.
> 
> I thing this would also make many packages installed by e.g. autoconf
> preserve their permissions without any extra code.

How does this wrapper works ? I'd like to check if it solve my dbus
issue, because I'm not sure that the dbus build system installs it with
the correct ownership (permission will probably be correct, but I'm not
sure about ownership).

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

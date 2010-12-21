From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Dec 2010 11:44:08 +0100
Subject: [Buildroot] [PATCH] New package: bwm-ng
In-Reply-To: <AANLkTinCqJKvufcf7QVpJefQh2RbaiZeZHWXfpt4PCW_@mail.gmail.com>
References: <1292921723-3372-1-git-send-email-keguang.zhang@gmail.com>
	<AANLkTinCqJKvufcf7QVpJefQh2RbaiZeZHWXfpt4PCW_@mail.gmail.com>
Message-ID: <20101221114408.2a7fc559@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Dec 2010 11:32:38 +0100
Belisko Marek <marek.belisko@gmail.com> wrote:

> some comments for use ncurses:
> Seems this package should be build with or without ncurses.
> What about add some menu entry for that? Like for example qt.
> Normally user didn't check mk  file just select package.

For many packages, we do as Kelvin did initially: if the dependency is
available, we use it, if not, we silently work without it. Admittedly,
it's a bit "hidden" from the user, but that's the only solution to not
have hundreds or thousands of options in the configuration interface.

So I'd prefer to keep what Kelvin did on this.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

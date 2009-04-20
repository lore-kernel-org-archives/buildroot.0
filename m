From: Sven Neumann <s.neumann@phase-zero.de>
Date: Mon, 20 Apr 2009 12:52:42 +0200
Subject: [Buildroot] problem with dbus-daemon
In-Reply-To: <1239991165.6397.20.camel@sven>
References: <1239991165.6397.20.camel@sven>
Message-ID: <1240224762.6315.24.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, 2009-04-17 at 19:59 +0200, Sven Neumann wrote:

> I am trying to run dbus-daemon (out of buildroot) on an ARM platform and
> keep getting this error:
> 
> Can't modify application's text section; use the GCC option -fPIE for
> position-independent executables.

Thanks to an advice I received off-list, I have changed from uCLibC
0.9.30 to 0.9.30.1, recompiled everything, and now dbus is up and
running.  :-)


Sven

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Mar 2016 18:25:49 +0100
Subject: [Buildroot] [PATCH] pkgconf: Add a symlink to the
 GNU_TARGET_NAME-pkg-config
In-Reply-To: <20160302212553.718456cf@free-electrons.com>
References: <1456770170-6326-1-git-send-email-jer@airfi.aero>
 <20160302212553.718456cf@free-electrons.com>
Message-ID: <20160318172549.GB3696@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-03-02 21:25 +0100, Thomas Petazzoni spake thusly:
> On Mon, 29 Feb 2016 19:22:50 +0100, Jeroen Roovers wrote:
> >  Lots of packages start to call pkg-config "properly" and run into
> >  failures like this:
> > 
> > *
> > * System Logging Utilities
> > *
> > syslogd (SYSLOGD) [N/y/?] n
> > klogd (KLOGD) [N/y/?] n
> > logger (LOGGER) [Y/n/?] y
> > make[2]: .../output/host/usr/bin/arm-buildroot-linux-gnueabihf-pkg-config: Command not found
> > make[2]: .../output/host/usr/bin/arm-buildroot-linux-gnueabihf-pkg-config: Command not found
> > make[1]: Leaving directory '.../output/build/busybox-1.24.1'
> 
> I think we should solve this specific problem by passing the PKG_CONFIG
> in the Busybox environment.

Should we not always pass PKG_CONFIG in the target environment, instead
of per-package?

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

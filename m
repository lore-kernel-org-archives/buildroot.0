From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 20 Aug 2008 11:49:42 +0200
Subject: [Buildroot] ARM EABI toolchain - anyone build it successfully?
In-Reply-To: <48ABE3DE.80908@wpkg.org>
References: <48AAE812.4020706@wpkg.org> <20080819154955.GA15608@mx.loc>
	<48AAECB6.6020309@wpkg.org> <20080819162809.GA15851@mx.loc>
	<48ABE3DE.80908@wpkg.org>
Message-ID: <20080820094942.GA20189@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 20, 2008 at 11:29:02AM +0200, Tomasz Chmielewski wrote:

> OK, it builds (I had a custom uClibc config, which perhaps made some  
> problems), but even then, lots of Busybox things don't work.
>
> I.e.:
>
> # ./busybox
> (...)
> Currently defined functions:
>         ash, cat, mount, sh, sleep, switch_root, umount, whoami
>
> # ./busybox ash
> Illegal instruction

what CPU did you select? ISTR that i have fixed this for iWMMXT && EABI

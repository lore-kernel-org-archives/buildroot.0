From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jan 2014 06:20:18 +0800
Subject: [Buildroot] command line regular expression substitution fails
In-Reply-To: <52CC7292.306@alcatel-lucent.com>
References: <52CC7292.306@alcatel-lucent.com>
Message-ID: <20140108062018.6a5f3adb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ed Sutter,

On Tue, 07 Jan 2014 16:33:06 -0500, Ed Sutter wrote:

> I'm using buildroot for the first time to set up rootfs on an iMX6
> based platform.  I've been debugging a startup issue and just realized
> that the the line...

[...]

> and I see that fails as well.  I'm guessing this is some kind of busybox
> configuration (regex/readline/etc..) issue, but since I got it all 
> through buildroot,
> I figured I'd try here first.
> Any ideas?

Can you show your Buildroot configuration (i.e the .config file) ? Did
you customize the Busybox configuration using "make
busybox-menuconfig", or provided a custom Busybox configuration file?

Normally, if you keep the default Busybox configuration provided by
Buildroot, it works.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

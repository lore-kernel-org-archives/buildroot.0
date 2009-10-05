From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Oct 2009 08:48:45 +0200
Subject: [Buildroot] [git commit master] buildroot;
 move defconfigs to configs/ and print in help
In-Reply-To: <20091004202133.B35E577762@busybox.osuosl.org>
References: <20091004202133.B35E577762@busybox.osuosl.org>
Message-ID: <20091005084845.023ff120@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 4 Oct 2009 22:20:28 +0200,
Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

> As discussed earlier on the mailing list. It simplifies code, gives
> more sensible error message on typos and makes the defconfigs easier
> to find for users.

I have to say I'm not necessarly a big fan of this change. The
_defconfig files used to be stored together with the kernel
configuration, busybox configuration, uClibc configuration and target
skeleton specific to a target (in target/device/<vendor>/<board>).

Now, the _defconfig files are in a separate location, which makes it
slightly less logical/easy for people to add new targets.

Cheers!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com

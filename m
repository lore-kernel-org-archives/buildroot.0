From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Aug 2009 01:15:30 +0200
Subject: [Buildroot] Bump LVM2 to 2.02.50 (LVM2.2.02.47.tgz missing on
 ftp)
In-Reply-To: <159a01660908010851g4e37e7eyd7059449b9a7e74e@mail.gmail.com>
References: <159a01660908010851g4e37e7eyd7059449b9a7e74e@mail.gmail.com>
Message-ID: <20090802011530.256be9c9@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 1 Aug 2009 17:51:09 +0200,
Daniele Salvatore Albano <d.albano@gmail.com> a ?crit :

> LVM2.2.02.47.tgz doesn't exists anymore on lvm2 ftp (
> ftp://sources.redhat.com/pub/lvm2/ ), there are two new releases:
> - LVM2.2.02.49.tgz
> - LVM2.2.02.50.tgz
> 
> I've updated the patch level to 50 and it's seems to compile fine,
> however i haven't tested it yet.
> 
> Attached the patch to upgrade the patch level to 50.
> 
> Should i open a bug on bugzilla for this?

I've just sent a pull request to Peter contain this fix, and an
additional fix to improve the installation of lvm2 to the target
directory.

Thanks for the contribution!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com

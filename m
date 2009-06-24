From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Jun 2009 11:03:46 +0200
Subject: [Buildroot] [git commit] busybox: 1.13.x defconfig: enable
	devmem applet
In-Reply-To: <1245832302.25464.0.camel@sven> (Sven Neumann's message of "Wed\,
	24 Jun 2009 10\:31\:42 +0200")
References: <20090622132901.57D11777A2@busybox.osuosl.org>
	<1245832302.25464.0.camel@sven>
Message-ID: <87iqim3swd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 >> -# CONFIG_DEVMEM is not set
 >> +CONFIG_DEVMEM=y
 >> CONFIG_EJECT=y
 >> # CONFIG_FEATURE_EJECT_SCSI is not set
 >> # CONFIG_FBSPLASH is not set

 Sven> This breaks the build for me:

 Sven> libbb/lib.a(appletlib.o):(.rodata.applet_main+0x88): undefined reference
 Sven> to `devmem_main'
 Sven> collect2: ld returned 1 exit status

 Sven> Is there perhaps a dependency missing that needs to be selected along
 Sven> with devmem ?

Strange - It works fine here (in buildroot and native). Could your
post your .config?

-- 
Bye, Peter Korsgaard

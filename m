From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Feb 2012 12:34:47 +0100
Subject: [Buildroot] External Toolchain: Calculation of SYSROOT_DIR in
 toolchain/toolchain-external/ext-tool.mk wrong?
In-Reply-To: <4666169C600DD24C84F509DC90790D5007629FD42D@DEMCHP99E75MSX.ww902.siemens.net>
References: <4666169C600DD24C84F509DC90790D5007629FD2B5@DEMCHP99E75MSX.ww902.siemens.net>
 <20120201103842.546e6eb8@skate>
 <4666169C600DD24C84F509DC90790D5007629FD42D@DEMCHP99E75MSX.ww902.siemens.net>
Message-ID: <20120201123447.71e90bc2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 1 Feb 2012 12:20:02 +0100,
"Warlich, Christof" <christof.warlich@siemens.com> a ?crit :

> > Would it be possible to get your external toolchain, so that I could do
> > some testing, and integrate it in my set of external toolchains, so
> > that we keep it working in the future?
> 
> Thanks a lot for the offer, but I doubt that it is worth the effort.

Well, if we can't test it, it's going to be hard to improve Buildroot
to support this type of toolchain. If you have solved your specific
problem, it's great, but it would have been ever better to improve the
mainline Buildroot so that other users in your case would find things
working nicely :)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

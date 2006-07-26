From: Konstantin Kletschke <kletschke@synertronixx.de>
Date: Wed Jul 26 09:17:34 2006
Subject: [Buildroot] HowTo make jffs2 image after linux.mk?
In-Reply-To: <ecb4efd10607260906n38ebb87fj4a32d191d37840a5@mail.gmail.com>
References: <20060726135221.GB8832@synertronixx3>
	<ecb4efd10607260820u199c122ci4c52233a0b785134@mail.gmail.com>
	<20060726155323.GA14849@synertronixx3>
	<ecb4efd10607260906n38ebb87fj4a32d191d37840a5@mail.gmail.com>
Message-ID: <20060726161729.GB14849@synertronixx3>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2006-07-26 12:06 -0400 schrieb Clem Taylor:

> >gumstix? I did not found gunstix stuff there...
> 
> Yeah, they have a bunch of buildroot customizations in there tree:
> http://svn.gumstix.com/gumstix-buildroot/trunk

Ok, now I got it :-)

> They happened to be using u-boot and I wanted to see how they handled
> some u-boot integration issues. In the process I found that they had
> fixed a number of buildroot annoyances.

I will keep an eye on their stuff.

They should use "make xxx_defconfig" in kernel source tree instead of
copying a linux.config I already saw ;)

Regards, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF

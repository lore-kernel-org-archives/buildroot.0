From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 11:07:17 +0100
Subject: [Buildroot] [PATCH v2 1/2] trousers: new package
In-Reply-To: <CAOJKDvLfvzLSG5Z65BcKyE4DrA0nw9XA4aGrgw+uqJj+ss=K-g@mail.gmail.com>
References: <1446659225-30438-1-git-send-email-nrubinstein@aldebaran.com>
 <20151224084221.12044000@free-electrons.com>
 <CAOJKDvLfvzLSG5Z65BcKyE4DrA0nw9XA4aGrgw+uqJj+ss=K-g@mail.gmail.com>
Message-ID: <20151224110717.0fda5512@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Dec 2015 10:21:00 +0100, No? RUBINSTEIN wrote:

> >      - select libiconv when locale support is not available, otherwise the
> >        build fails due to missing iconv.h
> >      - disable on BR2_STATIC_LIBS configurations as it doesn't build. It
> >        could be made to build by patching the trousers Makefile.
> >      - add missing dependency on thread support in the toolchain
> >
> 
> Are you running an automatic test set on your host machine to detect these
> problems?

No, I am testing with a bunch of toolchains used by autobuild.b.o.
Since your package had no toolchain dependencies, I tested with
http://autobuild.buildroot.org/toolchains/configs/br-arm-basic.config.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Jan 2019 16:27:28 +0100
Subject: [Buildroot] [PATCH] package/rtc-tools: new package
In-Reply-To: <20190115144901.GA28293@piout.net>
References: <20190115093229.8772-1-thomas.petazzoni@bootlin.com>
 <20190115144901.GA28293@piout.net>
Message-ID: <20190115162728.30a0786a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Jan 2019 15:49:01 +0100, Alexandre Belloni wrote:

> > diff --git a/package/rtc-tools/rtc-tools.hash b/package/rtc-tools/rtc-tools.hash
> > new file mode 100644
> > index 0000000000..81be1afe4e
> > --- /dev/null
> > +++ b/package/rtc-tools/rtc-tools.hash
> > @@ -0,0 +1,3 @@
> > +# Locally calculated
> > +sha256 152d8455bae5ad672e99bb91dfbed5b8b4bd8b0325146d1cf1c4d80b6e0d8a16 rtc-tools-33ef4aa1c92b0c92a351284d93d1ac5570de9cc7.tar.gz
> > +sha256 7ae50a5344af14d6231aff6814632a220b3127da4099aea2c6070fd79c407c1a COPYING
> > diff --git a/package/rtc-tools/rtc-tools.mk b/package/rtc-tools/rtc-tools.mk
> > new file mode 100644
> > index 0000000000..5e9d040b27
> > --- /dev/null
> > +++ b/package/rtc-tools/rtc-tools.mk
> > @@ -0,0 +1,26 @@
> > +################################################################################
> > +#
> > +# rtc-tools
> > +#
> > +################################################################################
> > +
> > +RTC_TOOLS_VERSION = 33ef4aa1c92b0c92a351284d93d1ac5570de9cc7  
> 
> Should I tag a release or are you fine with the git hash?

I'm fine with the Git hash.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

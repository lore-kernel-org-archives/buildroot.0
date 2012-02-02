From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Feb 2012 17:00:59 +0100
Subject: [Buildroot] [git commit] boot: only show vendor-specific
 bootloaders for applicable arm variant
In-Reply-To: <87ipjp9ql2.fsf@macbook.be.48ers.dk>
References: <20120201224701.C13259097B@busybox.osuosl.org>
 <20120202164743.30dfab12@skate>
 <87ipjp9ql2.fsf@macbook.be.48ers.dk>
Message-ID: <20120202170059.42c7b05e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 02 Feb 2012 16:56:25 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> True. Is that a common use case? If so then I'll revert.

I don't know if it's a common use case. But I would suspect that many
newcomers do not necessarily select the right sub-architecture. But I
don't have a strong opinion with your regard to your patch. I just
think that people may not discover that those bootloaders are available
in Buildroot.

However, as discussed on IRC, we might see an increase of
platform-specific packages (3D drivers and libraries, codecs and DSP
stuff, etc.), so maybe we'll need some way of selecting the platform in
order to show only the relevant packages? Or maybe simply by organizing
the packages like:

 Platform specific packages ->
  Texas Instruments OMAP packages ->
  Freescale i.MX packages ->
  ...

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

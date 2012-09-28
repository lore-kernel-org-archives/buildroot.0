From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Sep 2012 19:05:26 +0200
Subject: [Buildroot] [PATCH] pkg-infra: produce legal info for
 proprietary packages
In-Reply-To: <CAAXf6LUF1bOSTGyMtC2OEbQSOeDiMphktpxtSZHmLj4ms9c+yQ@mail.gmail.com>
References: <20120928121758.GA2362@mail.sceen.net>
 <1348834801-2672-1-git-send-email-rbraun@sceen.net>
 <20120928142314.4810033e@skate>
 <CAAXf6LUF1bOSTGyMtC2OEbQSOeDiMphktpxtSZHmLj4ms9c+yQ@mail.gmail.com>
Message-ID: <20120928190526.79db5cde@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, 28 Sep 2012 18:40:04 +0200, Thomas De Schampheleire wrote:

> Additionally, it would be nice to get some context. Why do you need this?
> What its the use case?
> 
> The proprietary packages are not in the current legal info, precisely
> because you wouldn't distribute them.
> If you have a package that you distribute under a non open-source license,
> I think it makes more sense to provide a real name to the license.

There are things like firmware, or DSP blobs or other stuff that are
just provided in binary form, but their license allows free
redistribution. Should we mark those as PROPRIETARY, or should we have
a different license name for those?

Basically, the context is the intel-microcode package, which bundles a
binary-only firmware for some Intel hardware. Which license
informations should we attach to it?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Aug 2012 15:50:47 +0200
Subject: [Buildroot] [PATCH 07/36] package/celt051: new package
In-Reply-To: <201208171527.29938.yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
 <1344815664-28138-7-git-send-email-yann.morin.1998@free.fr>
 <20120817131818.74842ae3@skate>
 <201208171527.29938.yann.morin.1998@free.fr>
Message-ID: <20120817155047.4e94c0dd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 17 Aug 2012 15:27:29 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> > Just curious, for what reason an audio codec is needed as a dependency
> > of a virtual machine thing? How does it fit in the stack?
> 
> celt-0.51 is a hard-depdency for Spice to encode the audio.
> It's select-ed by BR2_PACKAGE_SPICE in a later patch.
> 
> Note that I added all new packages in a row, rather than add them just
> prior to the requiring qemu feature. Should I re-order the series to make
> the depedencies clearer?

No, I understood perfectly that celt was a dependency of spice. My
question was not Buildroot-specific: I was trying to understand
what Qemu/Spice had to do with an audio encoder.

> > Do you predict this version requirement to be kept for a long period of
> > time?
> 
> Spice advertises that celt-051 is the only supported version because
> later versions have changed too much and are thus not compatible.
> 
> I have absolutely no idea whther Spice will upgrade one day... :-/

Ah, ok, I just realized you named the package celt051 and not celt just
because of that. Ok, good.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

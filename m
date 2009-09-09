From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Sep 2009 08:24:47 +0200
Subject: [Buildroot] [RFC] [PATCH 0/5] Buildroot cleanup
In-Reply-To: <87vdjt160i.fsf@macbook.be.48ers.dk>
References: <4AA62DD20200000D00128C56@gwia.alliedtelesyn.co.nz>
	<4AA75F310200007000017827@gwia.alliedtelesyn.co.nz>
	<4AA75F310200007000017827@gwia.alliedtelesyn.co.nz>
	<1252440948.19600.4.camel@bender>
	<87vdjt160i.fsf@macbook.be.48ers.dk>
Message-ID: <20090909082447.7a230c8f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 08 Sep 2009 23:27:41 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> I have been thinking about it myself. *REALLY* supporting toolchains
> for all the different architectures / variants, uclibc and (e)glibc
> and following up on compiler bugs takes quite some effort (and noone
> seems willing to do it for buildroot), so maybe the best long term
> solution is simply to deprecate the toolchain building stuff and just
> recommend crosstool-ng instead?

That was my plan...

> This would make BR less selfcontained / one-stop-shop though.

until I met Buildroot users (I mean not end-users but organizations
using Buildroot as the build system they ship with their devices) who
told me that the selfcontained nature of BR was something they really
liked.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com

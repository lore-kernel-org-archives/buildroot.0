From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Sep 2010 13:12:21 +0200
Subject: [Buildroot] On internal vs. external toolchains
In-Reply-To: <AANLkTikZEe+tS3WtxULNLNq80QrVRy0U5XWzneRcHRnw@mail.gmail.com>
References: <20100928223652.6dc72083@surf>
	<AANLkTi=Sf1+acAXfCgJcTv+4Yrtw0nEH+_Ugv3+0dVk0@mail.gmail.com>
	<20100929105151.76bd6230@surf>
	<AANLkTikZEe+tS3WtxULNLNq80QrVRy0U5XWzneRcHRnw@mail.gmail.com>
Message-ID: <20100929131221.0a5e9c1b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 29 Sep 2010 14:01:23 +0300
Paulius Zaleckas <paulius.zaleckas@gmail.com> wrote:

> > Are you using internal toolchain or external toolchain ?
> 
> internal

Then you could probably save ~20-30% of your build time by using an
external toolchain (generated either by Buildroot itself, Crosstool-NG
or using a ready-to-use CodeSourcery toolchain).

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

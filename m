From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Apr 2016 13:30:31 +0200
Subject: [Buildroot] [PATCH v2] mpv: new package
In-Reply-To: <5721F276.5040304@zacarias.com.ar>
References: <1461762722-10026-1-git-send-email-gustavo@zacarias.com.ar>
 <20160428131945.1fb83683@free-electrons.com>
 <5721F276.5040304@zacarias.com.ar>
Message-ID: <20160428133031.39b4a7bf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Apr 2016 08:22:30 -0300, Gustavo Zacarias wrote:

> Also keep in mind that these failures are because of the need for 
> updated toolchains for the autobuilders (XSI_MATH):
> http://autobuild.buildroot.net/results/dbd/dbdaf0b856129ce84a6291b1afe4acfec4c2777f/build-end.log

The ones related to j1() being not available, I guess so. But many of
the failures are related to the detection of wayland, sdl1, sdl2. Are
those also related to the XSI_MATH thing?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

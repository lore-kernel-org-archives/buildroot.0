From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Jan 2013 11:08:19 +0100
Subject: [Buildroot] Buildroot and PTXDist
In-Reply-To: <CAKvQZ_3=JY06hrgjn2ivcZonpmQ7sHgYX1vwEdda7HPU9k=Bbg@mail.gmail.com>
References: <CAKvQZ_3=JY06hrgjn2ivcZonpmQ7sHgYX1vwEdda7HPU9k=Bbg@mail.gmail.com>
Message-ID: <20130103110819.77f4326f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Willy Lambert,

On Thu, 3 Jan 2013 10:06:35 +0100, Willy Lambert wrote:

> could someone help me in finding what's different between Buildroot
> and PtxDist ? Both project seems active and both projects seems to do
> the same thing (creating the rootfs from scratch) and AFAIK PTXDist in
> a fork from buildroot.

I don't know enough of PTXdist to make an objective and honest
comparison being both projects.

However, I am not sure PTXdist is really a fork of Buildroot. It
certainly uses the same kconfig interface, and also uses make, but
besides that, I am not sure that the PTXdist developers started off
from Buildroot.

In term of activity:

 * In 2011, 1093 commits in PTXdist, 1422 commits in Buildroot
 * In 2012, 1383 commits in PTXdist, 2645 commits in Buildroot

A difference is that Buildroot is very community-driven, while PTXdist
is driven by Pengutronix, and the vast majority of the contributions are
done by Pengutronix engineers. In the 2476 commits of the last two years
of development, 2116 were done by Pengutronix engineers.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jun 2012 10:19:17 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2012-06-13
In-Reply-To: <CAPNngRMBN95AdPLA8LrOwUhSVEM1p_VRtTUyf_wbO9T5JHfeFw@mail.gmail.com>
References: <20120614063146.7563852CEB3@lolut.humanoidz.org>
 <CAPNngRMBN95AdPLA8LrOwUhSVEM1p_VRtTUyf_wbO9T5JHfeFw@mail.gmail.com>
Message-ID: <20120615101917.2c757be3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Fri, 15 Jun 2012 01:16:03 -0300,
Milton Soares Filho <milton.soares.filho@gmail.com> a ?crit :

> Could we dispose of more info (extra field) so it's easier to
> filter-out failed builds using custom external toolchains? Found them
> too noisy when randomly bug-hunting.

Yes, I'm thinking of adding a 'toolchain-description.txt' file to every
build, that would describe the toolchain that has been used (Buildroot
config used to build the toolchain, CT-NG config used to build the
toolchain, etc.).

Would this be good for you?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

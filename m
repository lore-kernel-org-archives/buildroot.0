From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jan 2013 14:36:12 +0100
Subject: [Buildroot] CANBUs Quesetion
In-Reply-To: <002d01cdf30f$46f45890$d4dd09b0$@co.uk>
References: <001b01cdf015$9b34ca40$d19e5ec0$@co.uk>
 <20130111171429.79490168@skate>
 <004501cdf24a$009f6440$01de2cc0$@co.uk>
 <50F40BF3.5080106@relinux.de>
 <004b01cdf26d$ea1d2cb0$be578610$@co.uk>
 <20130114195101.12914c2d@skate>
 <002d01cdf30f$46f45890$d4dd09b0$@co.uk>
Message-ID: <20130115143612.46c9a774@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ted Wood,

On Tue, 15 Jan 2013 10:58:39 -0000, Ted Wood wrote:

> I'm really not sure how to make it any clearer than I did with my
> previous post.

You can easily be more precise: just say which driver you are talking
about, where we can download the source code to have a look and make
you useful suggestions.

If it's an external kernel module, then you can have a look at the
lttng-modules, linux-fusion, igh-ethercat packages for some examples.
But the exact steps to do will depend on how the build system of your
driver has been written, which is why I'm asking to see the source code
for it.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

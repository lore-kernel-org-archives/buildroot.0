From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Mar 2013 21:08:31 +0100
Subject: [Buildroot] adding dhcpcd
In-Reply-To: <069B5A25F9844945B625ADE7258AC94C061FF823@4rf-nz-orion.local.4rf.com>
References: <1362163072.19802.25.camel@genx.eng.msli.com>
 <5130F7CA.6090203@zacarias.com.ar> <1362500477.20183.74.camel@genx>
 <20130305194707.474ded42@skate> <1362592916.20183.152.camel@genx>
 <20130306195844.2f8c14b6@skate> <1362599417.20183.159.camel@genx>
 <069B5A25F9844945B625ADE7258AC94C061FF823@4rf-nz-orion.local.4rf.com>
Message-ID: <20130306210831.4fbe8150@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Reuben Dowle,

On Wed, 6 Mar 2013 20:05:49 +0000, Reuben Dowle wrote:

> In your patch, you should probably replace the place-holder "...some environment variables..." with setting some actual environment variables.

Yes, indeed, but John was saying that the build of his package doesn't
even start, which I understood as "I run make", but nothing happens.

Oh, John, remember to do a 'make dhcpcd-dirclean' every time you want
to retry the build of your package. Once a package has been built in
output/build/<somepkg>-<someversion>/, Buildroot doesn't rebuild it.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

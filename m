From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Feb 2013 08:56:04 +0100
Subject: [Buildroot] [PATCH] add pre-build script
In-Reply-To: <CAEBucnA1BebDBHWb4PcQBGiUpyiAcT0=vs3Tu4D+LVw1YdN0_A@mail.gmail.com>
References: <05255DE50A102443A25D42F2CCAC151FA58C25@LUMEXCH.luminatorusa.com>
 <511C1281.5040502@mind.be>
 <CAEBucnA1BebDBHWb4PcQBGiUpyiAcT0=vs3Tu4D+LVw1YdN0_A@mail.gmail.com>
Message-ID: <20130214085604.52619b06@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Wed, 13 Feb 2013 19:04:30 -0600, Spenser Gilliland wrote:

> I have a use case for this.  In Microblaze builds, it would be nice to
> generate optimal cflags from the dts/mhs for use in all software.
> This could be accomplished by a pre script.

Do you have the example of pre-build script that does this? Changing
the CFLAGS requires changing some internal Buildroot make variables, so
I'm not sure how you're doing this from a pre-build script.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

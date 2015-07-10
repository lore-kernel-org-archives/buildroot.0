From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jul 2015 22:23:53 +0200
Subject: [Buildroot] [PATCH v7 20/22] squashfs: Add xattr support
In-Reply-To: <CANn-YGTqC=bhPjybxvfbH9sVZ2Vfa6xrvKaRkVOAvKTdCV3byA@mail.gmail.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-21-git-send-email-clayton.shotwell@rockwellcollins.com>
 <20150706121602.402373fc@free-electrons.com>
 <CANn-YGTqC=bhPjybxvfbH9sVZ2Vfa6xrvKaRkVOAvKTdCV3byA@mail.gmail.com>
Message-ID: <20150710222353.637179e9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Clayton,

On Fri, 10 Jul 2015 14:54:28 -0500, Clayton Shotwell wrote:

> I would really like to know what I was thinking when I put this patch
> together because you are completely correct on how terrible this is. I
> looked back at it and I don't believe the host xattr support should be
> enabled at all. There are too many host dependencies, unrelated to the
> xattr package, that need to be met for this to work properly (think
> extended attributes on the filesystem itself). I am going to drop the
> host changes and only enable this for the target (where I am actually
> looking to use it).

No problem. However, I'm curious to know what is your use case: you are
preparing a SquashFS image on your target?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

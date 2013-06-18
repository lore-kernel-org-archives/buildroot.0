From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Jun 2013 09:12:39 +0200
Subject: [Buildroot] Changes in the Buildroot autobuilders
In-Reply-To: <E6BF041E97966E4DB955F0DF883AD2D633A03317@de02wembxa.internal.synopsys.com>
References: <20130616180054.58f52914@skate> <20130616170305.GI3495@free.fr>
 <20130616191806.7b4a899a@skate> <20130616172508.GL3495@free.fr>
 <20130616200540.5a370504@skate> <20130617074535.GB16699@lukather>
 <20130617094958.33eaff88@skate>
 <CAEBucnCWYyj23_RyLtP3p-B6zmBYiYOA4LiODMEdxEr7x4D+xw@mail.gmail.com>
 <20130617175407.GA3202@free.fr>
 <F9C551623D2CBB4C9488801D14F864C639A66D56@ex-mb1.corp.adtran.com>
 <E6BF041E97966E4DB955F0DF883AD2D633A03317@de02wembxa.internal.synopsys.com>
Message-ID: <20130618091239.28d1dbc8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Mon, 17 Jun 2013 20:09:51 +0000, Mischa Jonker wrote:

> How would we handle architecture-specific failures for a package if we don't have a global MAINTAINERS file? Add another _MAINTAINER variable in the config.in.<arch> file?

I believe architecture-specific failures would have to be handled
separately. We can't really add a maintainer into a Config.in file.

Even if we have a global MAINTAINERS file, how would architecture
maintainers be expressed? In the kernel, the MAINTAINERS file creates a
relation between a person and set of files/directories, but an
architecture in Buildroot is not a set of files or directories.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

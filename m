From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Sep 2019 09:04:08 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/libsodium: add config for
 full build
In-Reply-To: <CAFtSRGDT0udQCby-XzsZTe-VUTBSva7cdrh6wpZ_nMf+J8Pz2Q@mail.gmail.com>
References: <20190923082902.28472-1-adrien@gallouet.fr>
 <20190928231934.236e5f83@windsurf>
 <CAFtSRGDT0udQCby-XzsZTe-VUTBSva7cdrh6wpZ_nMf+J8Pz2Q@mail.gmail.com>
Message-ID: <20190929090408.67e6d38e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Sep 2019 23:49:56 +0200
Adrien Gallou?t <adrien@gallouet.fr> wrote:

> > But then, does it make sense to invert the option and name it
> > BR2_PACKAGE_LIBSODIUM_MINIMAL ? It would match the
> > --enable-minimal/--disable-minimal autoconf options of libsodium.  
> 
> That was my first patch :) Do you want me to resubmit it ?

I don't have a very clear-cut opinion.

On one hand, it is weird to have a Config.in option to reduce/remove
something. But on the other hand, it makes sense to have Config.in
options that are as much as possible mapped to the corresponding
options provided by the package build system.

Arnout, Peter, any preference ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

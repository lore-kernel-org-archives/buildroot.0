From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jun 2014 09:30:05 +0200
Subject: [Buildroot] [PATCH] reenable microblaze little endian for
 internal musl toolchain
In-Reply-To: <20140601070425.GA4197@waldemar-brodkorb.de>
References: <20140531084556.GA17277@waldemar-brodkorb.de>
 <CAPALihPyH5erdhQOsTiQ7E2_La9AuTi_7ED5tUqpfph713sjWw@mail.gmail.com>
 <20140531234315.3cc32e4e@free-electrons.com>
 <CAPALihOk0J7b7GWzth6AsiEm5KE7EZJ1w_XeSfRXbBvZ_Aa04Q@mail.gmail.com>
 <20140601070425.GA4197@waldemar-brodkorb.de>
Message-ID: <20140601093005.46935ca3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Sun, 1 Jun 2014 09:04:25 +0200, Waldemar Brodkorb wrote:

> Try the internal buildroot toolchain and musl, this will work for
> little endian targets.

Unfortunately, due to a misunderstanding from me, in 2014.05, it's not
possible to build a Microblaze little endian toolchain with musl in
Buildroot. It will be re-enabled for 2014.08, or in a 2014.05.1 release
if we do one.

> The external toolchain for musl is big endian
> only and furthermore contains a bug, because musl 1.0 didn't work
> for microblaze. At least not for qemu-system-microblazeel.
> Rich Felker fixed the Bug after 1.0 release, after I reported it via
> #musl on IRC.

I'm going to send soon a patch that updates a lot of external
toolchains, including the musl ones, and they use a more recent musl
version than 1.0.0.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

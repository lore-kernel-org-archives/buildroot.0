From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 May 2014 23:43:15 +0200
Subject: [Buildroot] [PATCH] reenable microblaze little endian for
 internal musl toolchain
In-Reply-To: <CAPALihPyH5erdhQOsTiQ7E2_La9AuTi_7ED5tUqpfph713sjWw@mail.gmail.com>
References: <20140531084556.GA17277@waldemar-brodkorb.de>
 <CAPALihPyH5erdhQOsTiQ7E2_La9AuTi_7ED5tUqpfph713sjWw@mail.gmail.com>
Message-ID: <20140531234315.3cc32e4e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear William Welch,

On Sat, 31 May 2014 15:56:01 -0500, William Welch wrote:

> What I know is, that the resulting images built by musl toolchain did not
> work, and readelf says the images are big-endian.
> 
> I selected microblaze little endian target and then chose 3 different
> toolchains and made 3 separate builds.  -- musl, buildroot internal, and
> the old Xilinx. Musl was the only one that did not run.

You did use the musl external toolchain, right?

> QEMU is nice but does not necessarily prove that a toolchain will work on
> my spartan6 microblazeel design, which I have been using with builroot,
> successfully, for some time now.

Absolutely. Do not hesitate to report back to us any issue that you
might see on Microblaze. We're definitely interested in growing the
user base of Buildroot users on this architecture.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

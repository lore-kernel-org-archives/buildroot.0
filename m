From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Dec 2019 12:00:29 +0100
Subject: [Buildroot] [FYI] Bootlin external toolchains
In-Reply-To: <CAMw6YJKQ-Su+nKYJo3YZyEo5XxdgPEpdj-D22psgqib2dwnv_Q@mail.gmail.com>
References: <CAMw6YJLJae0GcmrDmSY8FZ-uMj+WBybPkBaLQC1wkhooCjoKyQ@mail.gmail.com>
 <20191202152601.4ab1c8cd@windsurf>
 <a9c40802-dfd5-67b5-6750-b0711f667280@smile.fr>
 <CAMw6YJKQ-Su+nKYJo3YZyEo5XxdgPEpdj-D22psgqib2dwnv_Q@mail.gmail.com>
Message-ID: <20191203120029.2962bfaa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 3 Dec 2019 12:07:51 +0200
Vadim Kochan <vadim4j@gmail.com> wrote:

> May be it would be good to start with generic script which generates
> br2_fragment by specifying the path to the toolchain ?

Such fragments already exist for each toolchain, for example:

  https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/fragments/aarch64--glibc--stable-2018.11-1.frag

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

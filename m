From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 25 Mar 2008 23:58:00 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/toolchain/gcc/4.2.1:avr32_patches_break_x86
References: <20080321112103.A34573C2F3@busybox.net><87lk4cxq51.fsf@macbook.be.48ers.dk><46a136670803210455l30fffb0dx90c449c7aa5c551e@mail.gmail.com><d6cda7730803210814v1cbc6b73ge6e7cdf65a0b5f9@mail.gmail.com><46a136670803210824y45035bd4u50dfa5446b9e8003@mail.gmail.com>
	<d6cda7730803210833s3cdce637m8b701f53dad302b@mail.gmail.com>
Message-ID: <035001c88ece$f13e7ab0$040514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> It was a source download, I suspect the behavior might still be in
> there, I haven't tried yet. I was focusing on figuring out in which
> revision things got broken... unfortunally it takes over an hour to
> try each revision. It was a download from the same repository as the
> Atmel's ARM stuff, so, I guess it's now at www.at91.com ftp

You do not need to worry about where the external sources are located.
They are relative to $(BR2_ATMEL_MIRROR)
and you can configure to use the prepatched toolchain inside buildroot 
using make menuconfig

The Config.in for the prepatched toolchain is in "target/device".
Any patches for the prepatched toolchain will be in a subdirectory
of "target/device/Atmel".

Best Regards
Ulf Samuelsson 

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Sep 2013 19:34:17 +0200
Subject: [Buildroot] Why elf2flt is built *after* busybox
In-Reply-To: <1378225250.11000.4.camel@phoenix>
References: <1378225250.11000.4.camel@phoenix>
Message-ID: <20130903193417.1a092fd5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Axel Lin,

On Wed, 04 Sep 2013 00:20:50 +0800, Axel Lin wrote:

> Just enable elf2flt and start build.
> From the build log I found the build system build busybox before
> elf2flt. Is this normal?
> I thought elf2flt needs to be ready before building other packages?

Because elf2flt support is broken and someone needs to fix it. You've
already sent several e-mails about this. Gustavo Zacarias is working on
improving the elf2flt, but on a spare time basis, so it's progressing
as time and motivation permits.

Sorry to be a bit rude, but if you want things to move forward faster,
either send patches to fix the problems and get the thing working, or
hire someone to do this work for you. I'm sure ARM noMMU support in
Buildroot will improve, because there are more and more Cortex-M
systems that are capable of running Linux, but it's not something that
is currently well supported in Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

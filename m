From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Jul 2012 19:56:47 +0200
Subject: [Buildroot] [git commit] mii-diag: link statically if
 configured to do so
In-Reply-To: <CA+wH294UjT4T2a7_SNziD+VLeLAvzMNZxZmbyg+hz9CW+pg=zg@mail.gmail.com>
References: <20120627200833.E3F7C8E0E8@busybox.osuosl.org>
 <20120629121602.1b0fecd6@skate>
 <87txxt42up.fsf@macbook.be.48ers.dk>
 <20120630105559.7e57508a@skate> <4FEEF8D4.4080702@mind.be>
 <CA+wH294UjT4T2a7_SNziD+VLeLAvzMNZxZmbyg+hz9CW+pg=zg@mail.gmail.com>
Message-ID: <20120703195647.078ad47c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sat, 30 Jun 2012 18:09:38 +0100,
Alex Bradbury <asb@asbradbury.org> a ?crit :

> That would be neat. Is there a list of currently tested configurations
> somewhere?

Basically, the way the autobuilds work is that Peter and I have a set
of base configurations, that define the architecture and the toolchain,
and then we do a "make randpackageconfig" to generate a random
selection of packages.

Peter has a few base configurations, and if I understand correctly, on
a given build machine, he always uses the same base configuration.

On my side, I have a single build machine, but I have 39 different base
configurations (mixing architectures, internal/external toolchains with
various configurations and versions), and I select a random one for
each build, before doing the "make randpackageconfig".

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

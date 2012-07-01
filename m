From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jul 2012 21:32:27 +0200
Subject: [Buildroot] [git commit] mii-diag: link statically if
 configured to do so
In-Reply-To: <4FEEF8D4.4080702@mind.be>
References: <20120627200833.E3F7C8E0E8@busybox.osuosl.org>
 <20120629121602.1b0fecd6@skate>
 <87txxt42up.fsf@macbook.be.48ers.dk>
 <20120630105559.7e57508a@skate> <4FEEF8D4.4080702@mind.be>
Message-ID: <20120701213227.2a648898@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 30 Jun 2012 15:02:12 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>   I expect that adding -static to LDFLAGS will break quite a few packages.
> Would it be possible to add a BR2_PREFER_STATIC_LIB test to the autobuilds?

I'm planning on adding some more randomness on the builds, i.e for
certain builds, enable BR2_PREFER_STATIC_LIB, or BR2_HAVE_DEVFILES, or
BR2_HAVE_DOCUMENTATION, or some other options.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

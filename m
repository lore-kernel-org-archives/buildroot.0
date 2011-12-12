From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Dec 2011 16:27:22 +0100
Subject: [Buildroot] [PATCH 1/1] libosip2 : bump version.
In-Reply-To: <87liqhu8tr.fsf@macbook.be.48ers.dk>
References: <1323701031-27344-1-git-send-email-sagaert.johan@skynet.be>
 <87liqhu8tr.fsf@macbook.be.48ers.dk>
Message-ID: <20111212162722.14634b32@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 12 Dec 2011 16:08:00 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Either use the real upstream or change to a stable snapshot.debian.org
> URL.

Generally speaking, I think we should refuse to use URLs on
ftp.debian.org. Those are *always* changing all the time, and have
already broken the build for numerous packages. They are also causing
problems to people using old versions of Buildroot.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

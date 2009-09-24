From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Sep 2009 20:28:01 +0200
Subject: [Buildroot] Foreigh toolchain
In-Reply-To: <185890.9723.qm@web23501.mail.ird.yahoo.com>
References: <87tyysgx87.fsf@macbook.be.48ers.dk>
	<185890.9723.qm@web23501.mail.ird.yahoo.com>
Message-ID: <20090924202801.78a69428@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 24 Sep 2009 16:33:13 +0000 (GMT),
Michael Trimarchi <trimarchimichael@yahoo.it> a ?crit :

> I have this problem using the foreigh toolchain. Can anyone know how
> to fix it?

That's a libtool issue, and I haven't yet found the proper solution for
it. It's probably a matter of recompiling libtool and using our own.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com

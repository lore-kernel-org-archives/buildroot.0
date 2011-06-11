From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2011 10:48:55 +0200
Subject: [Buildroot] Generic serial port disappear after udev started
In-Reply-To: <201106101349.34083.minimod@morethan.org>
References: <BANLkTinE9E==rnL=NJSKkW=SELY=bZbHJg@mail.gmail.com>
	<201106101349.34083.minimod@morethan.org>
Message-ID: <20110611104855.23b50569@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 10 Jun 2011 13:49:31 -0500,
"Michael S. Zick" <minimod@morethan.org> a ?crit :

> Is /dev on nfs?
> that might be the problem, nfs makes files, not device nodes.

Huh?

I routinely use root-over-NFS, including the /dev with static device
nodes, and it works just fine.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

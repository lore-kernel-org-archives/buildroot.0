From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2016 21:47:53 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-05-13
In-Reply-To: <20160514145905.GA3877@free.fr>
References: <20160514063024.2C7B91025E9@stock.ovh.net>
 <20160514154655.57ae0bad@free-electrons.com>
 <20160514145905.GA3877@free.fr>
Message-ID: <20160515214753.67974bf6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 14 May 2016 16:59:05 +0200, Yann E. MORIN wrote:

> I'm not sure my machine is the only one to have the issue. There are
> very similar issues building host-python3:

Gaah, indeed :-/

Python is a big and widely used package, it's a bit annoying to disable
parallel build for it. But I guess it's the best we can do right now,
unless you have an idea to fix the problem (but parallel build issues
are often complex to understand, especially in a convoluted build
system like the one of Python...).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

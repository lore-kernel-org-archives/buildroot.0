From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Oct 2010 13:30:56 +0200
Subject: [Buildroot] [git commit master 1/1] toolchain: do not require
 full path
In-Reply-To: <AANLkTinktTTjKWoJSy16bka6o7Q1dim2O6Fy8_AFEm6j@mail.gmail.com>
References: <20101016204702.67E958D282@busybox.osuosl.org>
	<871v7pet77.fsf@macbook.be.48ers.dk>
	<201010221719.23905.vapier@gentoo.org>
	<87tykdcsma.fsf@macbook.be.48ers.dk>
	<AANLkTinktTTjKWoJSy16bka6o7Q1dim2O6Fy8_AFEm6j@mail.gmail.com>
Message-ID: <20101023133056.24a6d6fe@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Oct 2010 04:32:58 -0400
Mike Frysinger <vapier@gentoo.org> wrote:

> not really.  there are plenty of examples where people are allowed to
> maintain their own branch in the same "master" tree.  uClibc, glibc,
> OE off the top of my head.

I personally don't see any big advantage of this option compared to the
current organization and workflow, it seems just to be a matter of
personal taste. So let's keep the workflow we've been using for the
last two years, which has proven to be pretty good for Buildroot
development.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

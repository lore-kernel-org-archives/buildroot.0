From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 11:53:01 +0200
Subject: [Buildroot] buildroot-2010.05-rc2, problem with binutils-2.20.1
In-Reply-To: <4BF64DBB.9030805@invalid-domain.net>
References: <1274422785.5719.8.camel@bernd-desktop>
	<4BF64DBB.9030805@invalid-domain.net>
Message-ID: <20100521115301.078521bd@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 21 May 2010 11:09:15 +0200
Ludger Keilig <buildroot@invalid-domain.net> wrote:

> Seems to be the same as in bug #1789.
> 
> For me, it helped to revert the patch introduced in commit
> 6b939d40f6a29a43277566adc9d4312d49cb3abf.
> No, I don't like this, but at least it seems to work.

I just tested the configuration suggested in #1789, and it just worked
for me. Something odd is going on here..

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

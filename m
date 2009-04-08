From: Lloyd Sargent <lsargent@txdigital.com>
Date: Wed, 8 Apr 2009 13:13:21 -0500
Subject: [Buildroot] DBUS keeps getting installed...
In-Reply-To: <20090408174742.GA30358@real.realitydiluted.com>
References: <200904081213.21064.lsargent@txdigital.com>
	<20090408174742.GA30358@real.realitydiluted.com>
Message-ID: <200904081313.21367.lsargent@txdigital.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 08 April 2009 12:47:42 sjhill at realitydiluted.com wrote:
> > Perhaps I misread something, but I was under the impression that if DBUS
> > was not set, then it wouldn't be included in the build?
>
> So, did you select HAL to build? You could grep for 'dbus' in
> packages/*/*.mk to see what packages depend on dbus being built.

# BR2_PACKAGE_HAL is not set

I grep'ed for dbus and found nothing that I am building.

I'm really puzzled on this.

Cheers,

Lloyd

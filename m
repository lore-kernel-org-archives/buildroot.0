From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Feb 2010 19:44:51 +0100
Subject: [Buildroot] Reduce time for a make, possible?
In-Reply-To: <SNT129-W199BB281476B38B7CFC464B94A0@phx.gbl>
References: <SNT129-W199BB281476B38B7CFC464B94A0@phx.gbl>
Message-ID: <20100215194451.0aee0f65@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Feb 2010 15:29:48 +0100
Tony Mozi <spooflinux@hotmail.fr> wrote:

> When we make a change in the buildroot like add or remove an option,
> it's necessary to do 'make clean' then a 'make'. Is it possible to
> reduce the time of this operation which is very long?

For the moment, it is not possible safely. However, during the last
Buildroot Working Day last week, this was one of the main topic that we
discussed. So it's definitely not a feature that will be available in
the coming weeks, but pretty likely in the coming months or so.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

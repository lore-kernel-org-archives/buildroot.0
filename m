From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jul 2012 12:16:44 +0200
Subject: [Buildroot] [PATCH] protobuf: fix circular dependency warning
In-Reply-To: <CAHt8ZCMqmpRRva26M9XpC-NYUHyEyf9mE33yMHSrqtJEYNm6wA@mail.gmail.com>
References: <1342212552-6567-1-git-send-email-spdawson@gmail.com>
 <20120713225952.67925f4e@skate>
 <CAHt8ZCMqmpRRva26M9XpC-NYUHyEyf9mE33yMHSrqtJEYNm6wA@mail.gmail.com>
Message-ID: <20120714121644.6d62142b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 14 Jul 2012 10:07:06 +0100,
Simon Dawson <spdawson@gmail.com> a ?crit :

> Hi Thomas. This generic mechanism does indeed work in the present case
> (package protobuf). However, the indicated patch is only for the
> gentargets package mechanism; to apply to the protobuf package, a
> similar modification of pkg-autotargets.mk is required.
> 
> I'm happy to do this modification, if you think it appropriate.

Arnout, can you extend your patch to take this into account (including
pkg-autotargets and pkg-cmaketargets)? Or if you don't have the time,
tell Simon to extend your patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

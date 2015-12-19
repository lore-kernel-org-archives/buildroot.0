From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 15:14:50 +0100
Subject: [Buildroot] [PATCH 10/12] package/x11r7/xserver_xorg-server:
 bump version to 1.18.0
In-Reply-To: <567565C0.4090902@mind.be>
References: <1450522892-14611-1-git-send-email-bernd.kuhls@t-online.de>
 <1450522892-14611-10-git-send-email-bernd.kuhls@t-online.de>
 <20151219141714.5da170a3@free-electrons.com>
 <567565C0.4090902@mind.be>
Message-ID: <20151219151450.4ff3680a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sat, 19 Dec 2015 15:12:16 +0100, Arnout Vandecappelle wrote:

>  I would normally say that we should still have legacy handling here, to draw
> people's attention to the fact that something in the .config changed. However,
> it's just a change of version, and versions are changing all over the place, so
> indeed legacy handling isn't needed here.

As you say, we're bumping versions of tons of packages all the time,
without notifying users each time (it would be horrible), so why should
we do it specifically for the X.org server ? Especially when the user
has chosen to use the "tip" (1.17) and we're just updating to the more
recent "tip".

If we were to remove the 1.14 version, which is kept so far only for
compatibility with old NVidia X.org drivers, then maybe we should do
legacy handling (and even I'm not sure, because if we are to remove
this version, it means that we would have upgraded the NVidia drivers
to a version that works fine with a more recent X.org server).

Too much legacy handling is not good IMO.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

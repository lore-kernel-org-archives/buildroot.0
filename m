From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 19:13:47 +0100
Subject: [Buildroot] [RFC] Wine package
In-Reply-To: <54A6CF2D.1090706@dawncrow.de>
References: <54A6CF2D.1090706@dawncrow.de>
Message-ID: <20150102191347.229139f2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Hentschel,

On Fri, 02 Jan 2015 18:02:37 +0100, Andr? Hentschel wrote:

> I'm working on the Wine package for upstream buildroot.
> I attached Config.in and wine.mk for early review, so i don't start totally wrong.

Can you send a proper patch, sent inline (using git send-email) ? This
is actually what makes review easy as we can just hit "Reply" and put
some comments inline in the code.

> For cross compilation wine needs its own tools compiled for the host architecture, therefor there is host-wine.
> As there's no easy way to only build the wine tools i disabled as much as possible.

Ok.

> Are stable or up-to-date (development) versions preferred? Wine 1.6.2 (latest stable) is one year old...

We typically prefer stable versions, unless there's good reasons to use
a more recent version.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

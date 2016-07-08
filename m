From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Jul 2016 09:55:24 +0200
Subject: [Buildroot] [PATCH] tekui: relax dynamic library dependency
In-Reply-To: <CAB0FRstErD=FH8SJS13GdwV-+N_fc5VZU7hRkk98x6kGmz+eug@mail.gmail.com>
References: <1467910890-16574-1-git-send-email-francois.perrad@gadz.org>
 <20160707213240.378baea9@free-electrons.com>
 <CAB0FRstErD=FH8SJS13GdwV-+N_fc5VZU7hRkk98x6kGmz+eug@mail.gmail.com>
Message-ID: <20160708095524.357ed893@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 8 Jul 2016 09:42:00 +0200, Fran?ois Perrad wrote:

> A sub-option "Demo" is usual in BR.
> But with TekUI, the sub-option will be "Dependencies for Demo".
> It sounds bad.

Why would the sub-option be named "Dependencies for Demo" ?

If the tekui build system automatically detects the availability of
those dependencies to build/install the demos, then it is just fine:
you can have a sub-option called "Install demos" that adds the
necessary dependencies.

Or is tekui installing the demos unconditionally, and then they are
potentially broken on the target due to missing dependencies ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

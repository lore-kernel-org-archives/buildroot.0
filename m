From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jul 2013 13:24:07 +0200
Subject: [Buildroot] [PATCH] arch/arm: add support for thumb(1) mode
In-Reply-To: <51E7CC9B.1070109@zacarias.com.ar>
References: <1374075555-9599-1-git-send-email-gustavo@zacarias.com.ar>
 <20130717175838.2fc2831e@skate> <51E6C06C.8070300@zacarias.com.ar>
 <20130717215826.60942218@skate> <51E719D4.4070304@zacarias.com.ar>
 <20130718091917.06476a78@skate> <51E7CC9B.1070109@zacarias.com.ar>
Message-ID: <20130718132407.5fe4133b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 18 Jul 2013 08:08:11 -0300, Gustavo Zacarias wrote:

> > We definitely do something. If you enable Thumb in the
> > configuration, then -mthumb gets hard-coded into the external
> > toolchain wrapper. If you enable ARM in the configuration, then
> > -marm gets hard-coded into the external toolchain wrapper.
> > 
> > See:
> > http://git.buildroot.net/buildroot/tree/toolchain/toolchain-external/ext-tool.mk#n183
> > and:
> > http://git.buildroot.net/buildroot/tree/toolchain/toolchain-external/ext-toolchain-wrapper.c#n50.
> 
> Missed that!
> It's working though, tested on real hardware (arm920t) with CS 2013.05

Excellent, thanks for the testing!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

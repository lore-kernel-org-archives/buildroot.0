From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 May 2018 17:46:58 +0200
Subject: [Buildroot] [PATCH 1/1] zeromq: add libatomic linkage when
 available
In-Reply-To: <CALFsTFVARKTJVVrkBwAKt9Qud3EiNo6tDO4UhAwtnWvWG3kOyQ@mail.gmail.com>
References: <20180426195309.26042-1-asafka7@gmail.com>
 <20180428153900.0f809228@windsurf>
 <CALFsTFVARKTJVVrkBwAKt9Qud3EiNo6tDO4UhAwtnWvWG3kOyQ@mail.gmail.com>
Message-ID: <20180507174658.274b4937@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Asaf,

On Sun, 29 Apr 2018 18:40:05 +0000, Asaf Kahlon wrote:

> I completely agree that the solution should be on upstream, and the current
> solution is easiest one but not the best one. I'll try to build a patch on
> the upstream and send it here.

Do you have any news about this ? If needed, you can leverage some code
from Mesa3D, which I've just patched earlier today:

  https://lists.freedesktop.org/archives/mesa-dev/2018-May/194214.html

It would be nice to have a patch in the near future, to fix this build
issue. Let me know if you need help for this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

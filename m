From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 20:31:52 +0200
Subject: [Buildroot] Silencing the build
In-Reply-To: <CAHkwnC_1+=SR88eS3hHDOFMvzFFF_dE5LuRdKhKfi9pFm1RL4Q@mail.gmail.com>
References: <1404906414-15197-1-git-send-email-fabio.porcedda@gmail.com>
 <20140715212814.1dfcce43@free-electrons.com>
 <CAHkwnC_1+=SR88eS3hHDOFMvzFFF_dE5LuRdKhKfi9pFm1RL4Q@mail.gmail.com>
Message-ID: <20140717203152.2e18fb9b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Thu, 17 Jul 2014 19:40:46 +0200, Fabio Porcedda wrote:

> > Hum, yes, but why? The entire build process is anyway very noisy, so is
> > there really a point in silencing specifically this part? What is the
> > ultimate goal you're trying to achieve here?
> 
> My ultimate goal is to be able using the "-s" flags to silence all
> parts, because sometimes i just want to build and view only ">>> *"
> messages, errors, warning without anything else.
> 
> As example the "toolchain-external" target already do that when the
> "-s" option is used.
> 
> I've silenced only this part because it was easy and it's anyway an improvement.
> 
> Maybe i can work on silencing other parts too if the feature is desired.

Ok, thanks for the explanation.

I guess we need to decide whether having a fully silent build in "make
-s" is a goal we should aim at. It seems like a good idea to me, but I
don't have a really strong opinion about this.

What do others think about this?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
